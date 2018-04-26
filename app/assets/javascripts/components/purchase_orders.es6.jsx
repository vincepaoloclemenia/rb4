class PurchaseOrders extends React.Component{
    constructor(props){
        super(props)
        this.state = { 
            purchaseOrders: [], 
            poNumber: '',           
            status: '',
            creator: '',
            branches: [],
            suppliers: [],
            branch: [],
            supplier: [],
            items: [],
            fetching: false,
            keywords: '',
            item: [],
            searching: false,
            totalAmount: null
        }
        this.items = []
    }

    searchPurchaseOrder(){       
        var branches = []
        var suppliers = []
        var items = []
        var from = $("#from").val()
        var to = $("#to").val()
        var itemParams = ''
        var poParams = '' 
        var creatorParams = ''
        var statusParams = ''
        var branchParams = ''
        var supplierParams = ''
        var dateParams = ''
        if ((from != '' && to != '') || ( this.state.creator != '' || this.state.creator != '' || this.state.poNumber != '' || this.state.item.length > 0 || this.state.supplier.length > 0 || this.state.branch.length > 0)){  
            this.setState({ fetching: true })
            if(this.state.branch.length > 0){
                branches = this.state.branch.map( x => x.label )
                branchParams = `&branch=${branches.join(" ")}`
            }
            
            if(this.state.supplier.length > 0){
                suppliers = this.state.supplier.map( x=> x.label )
                supplierParams = `&supplier=${suppliers.join(" ")}`
            }
            
            if(this.state.item.length > 0){
                items = this.state.item.map( x => x.value )
                itemParams = `&items=${items.join(" ")}`
                this.items = items
            }

            if (this.state.poNumber != '')
                poParams = `&po_number=${this.state.poNumber}`
            
            if (this.state.creator != '' )
                creatorParams = `&creator=${this.state.creator}`
            
            if (this.state.status != '')
                statusParams = `&status=${this.state.status}`

            if (from != '' && to != '')
                dateParams = `&from=${from}&to=${to}`

          
            $.ajax({
                url: `/api/purchase_orders/get_pos.json?${dateParams}${poParams}${branchParams}${supplierParams}${itemParams}${creatorParams}${statusParams}`,
                method: 'GET',
                success: (data) => {
                    this.setState({ 
                        purchaseOrders: data.purchase_orders, fetching: false, 
                        searching: true,
                        totalAmount: data.total_amount,
                        keywords: `${this.state.item.length > 0 ? `Items: [${items.join(", ")}]` : ''}${this.state.poNumber ? ` PO Number: ${this.state.poNumber} ` : '' } ${this.state.status ? ` Status: ${this.state.status} ` : ''} ${this.state.creator ? ` Creator: ${this.state.creator} ` : ''} ${this.state.branch.length > 0 ? ` Branches: [${this.state.branch.map( x=>x.label).join(", ")}] ` : '' } ${this.state.supplier.length > 0 ? ` Suppliers: [${this.state.supplier.map( x=>x.label).join(", ")}] ` : '' }`                    
                    })
                }
            })     
        }     
    }

    resetEveything(){
        $("#from").val('')
        $("#to").val('')
        this.setState({
            searching: false, supplier: [], branch: [], poNumber: '', status: '', creator: '', fetching: true, keywords: '', item: []
        })
        this.fetchPurchaseOrders()
    }


    componentDidMount(){
        $('#to').datepicker({
            autoclose: true,
            minDate: new Date()
        }).on('change',function(evt){
            evt.stopPropagation()
            evt.preventDefault()
        })

        $('#from').datepicker({
            autoclose: true,
            minDate: new Date()
        }).on('change',function(evt){
            evt.stopPropagation()
            evt.preventDefault()
        })

        this.setState({ fetching: true })        
        $.ajax({
            url: '/api/purchase_orders.json',
            method: 'GET',
            success: (data) => {    
                this.setState({
                    purchaseOrders: data.purchase_orders, items: data.items, branches: data.branches, suppliers: data.suppliers, fetching: false,
                })
            }
        })
    }

    render(){
        return(
            <div id='purchase-order-summary'>
                <div className='panel'>
                    <div className='panel-heading pb20'>
                        <div className='pull-left mt7'>Search Filter</div>                       
                    </div>
                    <div className='panel-body'>
                        <form action="/purchase_orders_summary" acceptCharset="UTF-8" method="get">
                            <input name="utf8" type="hidden" value="√" />
                            <div className='row mb10'>
                                <div className='col-xs-4 mb5'>
                                    <label htmlFor='q[po_number_matches]'>PO Number</label>
                                    <input
                                        placeholder="Search" 
                                        autoComplete="off" 
                                        type="search" 
                                        name="q[po_number]" 
                                        id="po_number" 
                                        className='form-control'
                                        onChange={ e => this.setState({ poNumber: e.target.value })}
                                        value={this.state.poNumber}
                                    />
                                </div>
                                <div className='col-xs-4 mb5'>
                                    <label htmlFor='q[status]'>Status</label>
                                    <input
                                        placeholder="Search" 
                                        autoComplete="off" 
                                        type="search" 
                                        name="q[status]" 
                                        id="status" 
                                        className='form-control'
                                        onChange={ e => this.setState({ status: e.target.value })}
                                        value={this.state.status}
                                    />
                                </div>
                                <div className='col-xs-4 mb5'>
                                    <label htmlFor='q[creator]'>Creator</label>
                                    <input
                                        placeholder="Search" 
                                        autoComplete="off" 
                                        type="search" 
                                        name="q[creator]" 
                                        id="creator" 
                                        className='form-control'
                                        onChange={ e => this.setState({ creator: e.target.value })}
                                        value={this.state.creator}
                                    />
                                </div>
                                
                            </div>
                            <div className='row mb10'>
                                <div className='col-xs-6 mb5'>
                                    <label htmlFor='q[supplier_name]'>Supplier Name</label>
                                    <Select.Creatable
                                        multi={true}
                                        name='q[supplier_name]'
                                        optionClassName='form-control'
                                        options={this.state.suppliers}
                                        onChange={ value => this.setState({ supplier: value }) }
                                        value={this.state.supplier}               
                                    /> 
                                </div>
                                
                                <div className='col-xs-6 mb5'>
                                    <label htmlFor='q[item]'>Item Name</label>
                                    <Select.Creatable
                                        multi={true}
                                        name='q[item]'
                                        optionClassName='form-control'
                                        options={this.state.items}
                                        onChange={ value => this.setState({ item: value }) }
                                        value={this.state.item}               
                                    />  
                                </div>
                            </div>

                            <div className='row mb10'>
                                <div className='col-xs-6 mb5'>
                                    <label htmlFor='q[branch_name]'>Branch Name</label>
                                    <Select.Creatable
                                        multi={true}
                                        name='q[branch_name]'
                                        optionClassName='form-control'
                                        options={this.state.branches}
                                        onChange={ value => this.setState({ branch: value }) }
                                        value={this.state.branch}               
                                    />
                                </div>

                                <div className='col-md-3 mb5'>
                                    <label >Date Filter</label>
                                    <input placeholder='Date from' className='form-control' type='text' id='from' onChange={ e => this.setState({ dateFrom: e.target.value }) }/>
                                </div>

                                <div className='col-md-3 mb5'>
                                    <label ></label>
                                    <input placeholder='Date to' className='form-control' type='text' id='to' onChange={ e => this.setState({ dateTo: e.target.value }) }/>
                                </div>
                                
                            </div>
                            <div className='row mb10' style={{ marginRight: '15px' }}>
                                <div className='col-xs-12'>
                                    <div className='pull-right'>
                                        <button onClick={this.searchPurchaseOrder.bind(this)} className='btn btn-primary' type='button'><i className='fa fa-search' aria-hidden='true'></i><span className='gap1'></span>Search</button>
                                        {this.displayResetButton()}
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                {this.displayPanel()}
            </div>
        )

    }

    displayResetButton(){
        if(this.state.keywords === '') { return }
        return(
            <button onClick={this.resetEveything.bind(this)} className='btn btn-default'>Reset</button>            
        )
    }

    displayPanel(){
        if (this.state.fetching){
            return(
                <div className='panel'>
                    <div className='panel-heading border pb45'>
                        <div className='pull-left mt7'>Purchase Orders List</div>
                        <div className='pull-right'>
                            <button className='btn btn-success btn-round btn-outline'><i className='icon-glyph-162 f14 mr5'></i> Download PDF </button>
                        </div>
                    </div>
                    <div className='panel-body'>
                        <div className='row mt25'>
                            <center><i className='fa fa-spinner fa-spin fa-2x dark-blue' aria-hidden='true'></i></center>
                        </div>
                    </div>
                </div>
            )
        }

        return(
            <div className='panel'>
                <div className='panel-heading border pb45'>
                    <div className='pull-left mt7'>Purchase Orders List</div>
                    <div className='pull-right'>
                        <button className='btn btn-success btn-round btn-outline'><i className='icon-glyph-162 f14 mr5'></i> Download PDF </button>
                    </div>
                </div>
                <div className='panel-body'>
                    <div className='no-more-tables'>
                        <table className='table table-bordered table-striped mb0'>
                            <thead>
                                <tr className='bg-thead'>
                                    <th width='150'>PO Number</th>
                                    <th width='130'>PO Date</th>
                                    <th width='110'>Branch Name</th>
                                    <th width='150'>Supplier Name</th>   
                                    <th width='170'>Created by</th>
                                    <th width='100'>Status</th>   
                                    <th width='150'>Item Name</th>
                                    <th width='140'>Packaging</th>
                                    <th width='90'>Quantity</th>  
                                    <th width='100'>Item Price</th>                                                                                                                           
                                    <th width='110'>Total Price</th>
                                </tr>
                            </thead>
                                {this.renderInformation()}
                                {this.renderSum()}
                        </table>
                    </div>
                </div>
            </div>
        )
    }

    renderOptions(){
        return(          
            this.state.branches.map((br, index)=>{
                <option key={index} value={br}>{br}</option>
            })       
        )
    }

    renderSum(){
        if(this.state.searching && this.state.totalAmount){
            return(
                <tbody>
                    <tr className='total-amount'>
                        <td colSpan='9' data-title='Total Amount'>Total Amount</td>
                        <td colSpan='2' data-title='Total Amount'>{this.state.totalAmount}</td>
                    </tr>     
                </tbody>
            )
        }
    }

    renderInformation(){
        if(this.state.purchaseOrders.length === 0){
            return(
                <tbody>
                    <tr>
                        <td colSpan='7'>
                            <center>
                                <i>No record found                                
                                </i>
                            </center>
                        </td>
                    </tr>
                </tbody>
            )
        }
        if(this.state.searching){
            return(
                this.state.purchaseOrders.map((po, index) =>
                    <tbody key={index}>     
                        { po.po_items.map((poi, ind) =>
                            <tr key={ind}>
                                <td data-title='PO Number'>{po.po_number}</td>
                                <td data-title='PO date'>{po.po_date}</td>
                                <td data-title='Branch Name'>{po.branch.name}</td>
                                <td data-title='Supplier Name'>{po.supplier.name}</td>
                                <td data-title='Created by'>{po.user.first_name} {po.user.last_name}</td>
                                <td data-title='Status'>{po.status}</td>    
                                <td data-title='Item Name'>{poi.item.name}</td>      
                                <td data-title='Packaging'>{poi.packaging}</td>   
                                <td data-title='Quantity'>{poi.quantity}</td>    
                                <td data-title='Item Price'>{poi.price_selected}</td>      
                                <td data-title='Total Price'>{poi.total_price}</td>                            
                            </tr>  
                        )}                                    
                    </tbody>
                )
            )
        }
        return(
            this.state.purchaseOrders.map((po, index) =>
                <tbody key={index}>       
                    { po.po_items.map((poi, ind) =>
                        <tr key={ind}>
                            <td data-title='PO Number'>{po.po_number}</td>
                            <td data-title='PO date'>{po.po_date}</td>
                            <td data-title='Branch Name'>{po.branch.name}</td>
                            <td data-title='Supplier Name'>{po.supplier.name}</td>
                            <td data-title='Created by'>{po.user.first_name} {po.user.last_name}</td>
                            <td data-title='Status'>{po.status}</td>    
                            <td data-title='Item Name'>{poi.item.name}</td>      
                            <td data-title='Packaging'>{poi.packaging}</td>   
                            <td data-title='Quantity'>{poi.quantity}</td>    
                            <td data-title='Item Price'>{poi.price_selected}</td>      
                            <td data-title='Total Price'>{poi.total_price}</td>                            
                        </tr>    
                    )}                                
                    <tr key={index} className='total-amount'>
                        <td colSpan='9' data-title='Total Amount'>Total Amount</td>
                        <td colSpan='2' data-title='Total Amount'>{po.total_amount}</td>
                    </tr>          
                </tbody>
            )
        )
    }

    renderItemHeader(){
        if(this.state.item.length === 0){ return }
        return <th width='130'>Item Name</th>
    }

    renderItemName(){
        if(this.state.item.length === 0){ return }
        var items = this.state.item.map( x => x.label)
        return <td data-title='Item Name'>{}</td>
    }

    fetchPurchaseOrders(){
        $.ajax({
            url: '/api/purchase_orders.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchaseOrders: data.purchase_orders, fetching: false
                })
            }
        })
    }
    
}