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
            item: [],
            searching: false,
            totalAmount: null,
            nextPage: null,
            loading: false,
        }
        this.items = []
    }

    searchPurchaseOrder(){       
        if( $('#date_range').val() === '' && this.state.poNumber === '' && this.state.status === '' && this.state.creator === '' && this.state.branch.length === 0 && this.state.supplier.length === 0 && this.state.item.length === 0 ){ return }       
        this.setState({ fetching: true }) 
        $.ajax({
            url: `/api/purchase_orders/get_pos.json`,
            method: 'GET',
            data: {
                po_number: this.state.poNumber,
                status: this.state.status,
                creator: this.state.creator,
                branches: this.state.branch.map( x => x.value ),
                suppliers: this.state.supplier.map( x => x.value ),
                items: this.state.item.map( x => x.value ),
                date: $("#date_range").val() === '' ? [] : $("#date_range").val().split(" - ")
            },
            success: (data) => {
                this.setState({ 
                    purchaseOrders: data.purchase_orders, fetching: false, 
                    searching: true,
                    totalAmount: data.total_amount,
                    nextPage: data.next_page
                })
            }
        })                  
    }

    resetEveything(){
        $("#date_range").val('')
        this.setState({
            searching: false, supplier: [], branch: [], poNumber: '', status: '', creator: '', fetching: true, item: []
        })
        this.fetchPurchaseOrders()
    }

    handleNextPurchaseOrders() {
        this.setState({ loading: true })
        if( $('#date_range').val() === '' && this.state.poNumber === '' && this.state.status === '' && this.state.creator === '' && this.state.branch.length === 0 && this.state.supplier.length === 0 && this.state.item.length === 0 ){ 
            $.ajax({
                url: `/api/purchase_orders.json?page=${this.state.nextPage}`,
                method: 'GET',
                success: (data) => {    
                    this.setState({
                        purchaseOrders: [...this.state.purchaseOrders, ...data.purchase_orders], nextPage: data.next_page, loading: false
                    })
                }
            })
        }else{
            $.ajax({
                url: `/api/purchase_orders/get_pos.json?page=${this.state.nextPage}`,
                method: 'GET',
                data: {
                    po_number: this.state.poNumber,
                    status: this.state.status,
                    creator: this.state.creator,
                    branches: this.state.branch.map( x => x.value ),
                    suppliers: this.state.supplier.map( x => x.value ),
                    items: this.state.item.map( x => x.value ),
                    date: $("#date_range").val() === '' ? [] : $("#date_range").val().split(" - ")
                },
                success: (data) => {
                    this.setState({ 
                        purchaseOrders: [...this.state.purchaseOrders, ...data.purchase_orders], fetching: false, 
                        searching: true,
                        totalAmount: data.total_amount,
                        nextPage: data.next_page,
                        loading: false 
                    })
                }
            })    
        }
    }
    downloadExcel(event){    
        var items = this.state.item.map( x => `&items%5B%5D=${x.value}` ).toString()
        var branches = this.state.branch.map( x => `&branches%5B%5D=${x.value}`).toString()
        var suppliers = this.state.supplier.map ( x => `&suppliers%5B%5D=${x.value}`).toString()
        var dates = $("#date_range").val().split(" - ").map( x => `&date%5B%5D=${x}` ).toString()
        if(this.state.searching){
            event.target.target = "_blank"
            event.target.href = `/api/purchase_orders/get_pos.xlsx?po_number=${this.state.poNumber}&status=${this.state.status}&creator=${this.state.creator}${$("#date_range").val() === '' ? [] : dates.replace(/,/, '') }${this.state.item.length === 0 ? '' : items.replace(/,/, '') }${this.state.branch.length === 0 ? '' : branches.replace(/,/,'')}${this.state.supplier.length === 0 ? '' : suppliers.replace(/,/,'')}&page=${this.state.nextPage ? this.state.nextPage - 1 : 1}` 
        }else{
            event.target.target = "_blank"
            event.target.href = '/api/purchase_orders.xlsx'
        }
    }


    componentDidMount(){
        $('.drp').daterangepicker({ });
        this.setState({ fetching: true })        
        $.ajax({
            url: '/api/purchase_orders.json',
            method: 'GET',
            success: (data) => {    
                this.setState({
                    purchaseOrders: data.purchase_orders, items: data.items, branches: data.branches, suppliers: data.suppliers, fetching: false, nextPage: data.next_page
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

                                <div className='col-md-6 mb5'>
                                    <label >Date Filter</label>
                                    <input className="form-control drp" placeholder="Search" type="text" name="date_range" id="date_range"/>  
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
        if(this.state.searching)
        return(
            <button type='button' onClick={this.resetEveything.bind(this)} className='btn btn-default'>Reset</button>            
        )
    }

    displayPanel(){
        if (this.state.fetching){
            return(
                <div className='panel'>
                    <div className='panel-heading border pb45'>
                        <div className='pull-left mt7'>Purchase Orders List</div>
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
                        {this.renderDownloadButton()}
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
                        <ul>
                            <li><center>{this.renderButton()}</center></li>
                        </ul>
                    </div>
                </div>
            </div>
        )
    }

    renderSum(){
        if(this.state.searching && this.state.totalAmount){
            return(
                <tbody>
                    <tr className='total-amount'>
                        <td colSpan='9' data-title='Total Amount'>Total Amount</td>
                        <td className='text-pull-right' colSpan='2' data-title='Total Amount'>{this.state.totalAmount}</td>
                    </tr>     
                </tbody>
            )
        }
    }

    renderDownloadButton(){
        if(this.state.purchaseOrders){
            return(
                <a onClick={this.downloadExcel.bind(this)} className='btn btn-success btn-round btn-outline'><i className='icon-glyph-162 f14 mr5'></i> Download Excel File </a>
            )
        }
    }

    renderButton(){
        if (this.state.loading){
            return(
                <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>
            )
        }
        if (this.state.nextPage){
            return(          
                <a className='view-more' onClick={this.handleNextPurchaseOrders.bind(this)}>See more..</a>              
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
                                <td className='text-centered' data-title='Quantity'>{poi.quantity}</td>    
                                <td className='text-pull-right' data-title='Item Price'>{poi.price_selected}</td>      
                                <td className='text-pull-right' data-title='Total Price'>{poi.total_price}</td>                            
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
                            <td className='text-centered' data-title='Quantity'>{poi.quantity}</td>    
                            <td className='text-pull-right' data-title='Item Price'>{poi.price_selected}</td>      
                            <td className='text-pull-right' data-title='Total Price'>{poi.total_price}</td>                            
                        </tr>    
                    )}                                
                    <tr key={index} className='total-amount'>
                        <td colSpan='9' data-title='Total Amount'>Total Amount</td>
                        <td className='text-pull-right' colSpan='2' data-title='Total Amount'>{po.total_amount}</td>
                    </tr>          
                </tbody>
            )
        )
    }

    fetchPurchaseOrders(){
        $.ajax({
            url: '/api/purchase_orders.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchaseOrders: data.purchase_orders, fetching: false, nextPage: data.next_page
                })
            }
        })
    }
    
}