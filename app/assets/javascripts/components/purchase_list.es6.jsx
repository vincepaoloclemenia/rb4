class PurchaseList extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            suppliers: [],
            categories: [],
            categoryIds: [],
            branches: [],
            items: [],
            invoice: '',
            purchases: [],
            category: [],
            item: [],
            branch: [],
            supplier: [],
            nextPage: null,
            searching: false,
            itemTotalVat: null,
            itemTotalAmount: null,
            itemTotalNet: null,
        }
    }

    searchPurchases(){
        this.setState({ fetching: true, searching: true })
        $.ajax({
            url: '/api/purchases/searched_purchases.json',
            method: 'GET',
            data: { 
                date: $("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - "),
                suppliers: this.state.supplier.map( x => x.input ),
                branches: this.state.branch.map( x => x.input ),
                purchase_items: this.state.item.map( x => x.input ),
                invoice_number: this.state.invoice
            },
            success: (data) => {
                this.setState({ 
                    purchases: data.purchases, 
                    fetching: false, 
                    nextPage: data.next_page,
                    itemTotalAmount: data.total_amount,
                    itemTotalNet: data.total_net,
                    itemTotalVat: data.total_vat
                })
            }
        })
    }

    resetEverything(){
        this.fetchData()
    }

    handleNextPurchaseOrders(){
        this.setState({ fetching: true })
        if(this.state.searching){
            $.ajax({
                url: `/api/purchases/searched_purchases.json?page=${this.state.nextPage}`,
                method: 'GET',
                data: { 
                    date: $("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - "),
                    suppliers: this.state.supplier.map( x => x.input ),
                    branches: this.state.branch.map( x => x.input ),
                    purchase_items: this.state.item.map( x => x.input ),
                    invoice_number: this.state.invoice
                },
                success: (data) => {
                    this.setState({
                        purchases: [...this.state.purchases, ...data.purchases], nextPage: data.next_page, fetching: false
                    })
                }
            })
        }else{
            $.ajax({
                url: `/api/purchases.json?page=${this.state.nextPage}`,
                method: 'GET',
                success: (data) => {
                    this.setState({
                        purchases: [...this.state.purchases, ...data.purchases], nextPage: data.next_page, fetching: false
                    })
                }
            })
        }
    }

    searchForItem(value){
        this.setState({ category: value })
        var ids = []
        value.map( x => ids.push(x.input))
        $.ajax({
            url: `/api/purchases.json`,
            data: { category: ids },
            method: 'GET',
            success: (data) => {
                this.setState({ items: data.items })
            }
        })
    }

    downloadExcel(event){
        $.ajax({
            url: `/api/purchases/searched_purchases.json?page=${this.state.nextPage}`,
            method: 'GET',
            data: { 
                date: $("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - "),
                suppliers: this.state.supplier.map( x => x.input ),
                branches: this.state.branch.map( x => x.input ),
                purchase_items: this.state.item.map( x => x.input ),
                invoice_number: this.state.invoice
            },
            success: (data) => {
                console.log(data.purchases)
            }
        })
        /*if(this.state.searching){
            event.target.target = "_blank"
            event.target.href = '/api/purchases/searched_purchases.xlsx'
        }else{
            event.target.target = "_blank"
            event.target.href = '/api/purchases.xlsx'
        }*/
    }

    componentDidMount(){
        $('.drp').daterangepicker({
            
        });
        $('.chosen').chosen({
            width: '100%'
        });
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/purchases.json',
            method: 'GET',
            success: (data) => {
                this.setState({ 
                    nextPage: data.next_page, 
                    fetching: false, 
                    purchases: data.purchases, 
                    suppliers: data.suppliers, 
                    items: data.items, 
                    branches: data.branches,
                    categories: data.categories 
                })
            }
        })
    }

    render(){
        return(    
            <div>
                <div className='panel'>
                    <div className='panel-heading pb20'>
                        <div className='pull-left mt7'>Search Filter</div>                       
                    </div>
                    <div className='panel-body ml15 mr15'>
                        
                        <div className='row'> 
                            <div className='row pb10'>
                                <div className='col-md-6 col-xs-6 mb5'>
                                    <label htmlFor='category'>Category</label>
                                    <Select.Creatable
                                        multi={true}
                                        name='category'
                                        optionClassName='form-control'
                                        options={this.state.categories}
                                        onChange={ this.searchForItem.bind(this) }
                                        value={this.state.category}               
                                    /> 
                                </div>
                                <div className='col-xs-6 mb5'>
                                    <label htmlFor='q[item]'>Items</label>
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
                            <div className='row pb10'>
                                
                                <div className='col-md-6 col-xs-6 mb5'>
                                    <label htmlFor='date_range'>Branches</label>
                                    <Select.Creatable
                                        multi={true}
                                        name='supplier_names'
                                        optionClassName='form-control'
                                        options={this.state.branches}
                                        onChange={ value => this.setState({ branch: value }) }
                                        value={this.state.branch}               
                                    />        
                                </div>
                                <div className='col-md-6 col-xs-6 mb5'>
                                    <label htmlFor='supplier_names'>Suppliers</label>
                                    <Select.Creatable
                                        multi={true}
                                        name='supplier_names'
                                        optionClassName='form-control'
                                        options={this.state.suppliers}
                                        onChange={ value => this.setState({ supplier: value }) }
                                        value={this.state.supplier}               
                                    /> 
                                </div>
                            </div>
                            <div className='row pb10'>
                                <div className='col-md-6 col-xs-6 mb5'>
                                    <label htmlFor='date_range'>Date</label>
                                    <input className="form-control drp" placeholder="Search" type="text" name="date_range" id="q_purchase_date_cont"/>         
                                </div>
                                <div className='col-md-6 col-xs-6 mb5'>
                                    <label htmlFor='invoice_no'>Invoice No.</label>
                                    <input className='form-control' placeholder='Input invoice' value={this.state.invoice} onChange={ (e) => this.setState({ invoice: e.target.value })} />
                                </div>                              
                            </div>
                            <div className='row pb10'>
                                <div className='row mb10' style={{ marginRight: '15px' }}>
                                    <div className='col-xs-12'>
                                        <div className='pull-right'>
                                            <button onClick={this.searchPurchases.bind(this)} className='btn btn-primary' type='button'><i className='fa fa-search' aria-hidden='true'></i><span className='gap1'></span>Search</button>
                                            {this.displayResetButton()}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>           
                    </div>
                </div>
                <div className='panel'>
                    <div className='panel-heading border pb45'>
                        <div className='pull-left mt7'>Purchase List</div>
                        <div className='pull-right'>
                            <button onClick={this.downloadExcel.bind(this)} className='btn btn-success btn-round btn-outline'><i className='icon-glyph-162 f14 mr5'></i> Download Excel </button>
                        </div>
                    </div>
                    <div className='panel-body'>
                        <div className='no-more-tables'>
                            <table className='table table-bordered table-striped mb0'>
                                <thead>
                                    <tr className='bg-thead'>
                                        <th width='150'>Invoice Number</th>
                                        <th width='130'>Date</th>
                                        <th width='110'>Branch</th>
                                        <th width='150'>Supplier</th>   
                                        <th width='170'>Item</th>
                                        <th width='170'>Category</th>
                                        <th width='170'>VAT Amount</th>
                                        <th width='170'>Net Amount</th>
                                        <th width='170'>Total Amount</th>
                                    </tr>
                                </thead>
                                {this.renderData()}
                                {this.renderTotalsWhenItemSearch()}
                            </table>
                            <ul>
                                <li><center>{this.renderButton()}</center></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    displayResetButton(){
        if(this.state.searching && ( this.state.branch.length > 0 || this.state.supplier.length > 0 || this.state.invoice !== '' || this.state.item.length > 0 || $("#q_purchase_date_cont").val() !== '')){ 
            return(
                <button onClick={this.resetEverything.bind(this)} className='btn btn-default'>Reset</button>            
            )
        }
    }

    renderButton(){
        if(this.state.fetching){
            return(
                <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>
            )
        }
        if(this.state.purchases.length === 0) {
            return( <i>No Records Found</i>)
        }
        if(!this.state.nextPage){ return }
        return(          
            <a className='view-more' onClick={this.handleNextPurchaseOrders.bind(this)}>See more..</a>              
        )
        
    }

    renderTotalsWhenItemSearch(){
        if(this.state.searching){ 
            return(
                <tbody>
                    <tr className='bg-total'>
                        <td className='text-right label-total' colSpan="7">Total VAT</td>
                        <td className='label-total-num' colSpan="2">{this.state.itemTotalVat}</td>
                    </tr>
                    <tr className='bg-total'>
                        <td className='text-right label-total' colSpan="7">Total Net</td>
                        <td className='label-total-num' colSpan="2">{this.state.itemTotalNet}</td>
                    </tr>
                    <tr className='bg-total'>
                        <td className='text-right label-total' colSpan="7">Total Amount</td>
                        <td className='label-total-num' colSpan="2">{this.state.itemTotalAmount}</td>
                    </tr>
                </tbody>
            ) 
        }
    }
    
    renderData(){
        if(this.state.fetching){ return }
        if(this.state.searching){
            return(
                this.state.purchases.map((purchase, index) => 
                    <tbody key={index}>
                        { purchase.purchase_items.map((purchase_item, index) =>
                            <tr key={index}>
                                <td>{purchase.invoice_number}</td>
                                <td>{purchase.purchase_date}</td>
                                <td>{purchase.branch.name}</td>
                                <td>{purchase.supplier.name}</td>
                                <td>{purchase_item.item.name}</td>
                                <td>{purchase_item.category}</td>
                                <td>{purchase_item.item_total_vat}</td>
                                <td>{purchase_item.item_total_net}</td>
                                <td>{purchase_item.item_total_amount}</td>
                            </tr> 
                        )}   
                    </tbody>                         
                )
            )
        }
        return(     
                this.state.purchases.map((purchase, index) => 
                    <tbody key={index}>
                        { purchase.purchase_items.map((purchase_item, index) =>
                            <tr key={index}>
                                <td>{purchase.invoice_number}</td>
                                <td>{purchase.purchase_date}</td>
                                <td>{purchase.branch.name}</td>
                                <td>{purchase.supplier.name}</td>
                                <td>{purchase_item.item.name}</td>
                                <td>{purchase_item.category}</td>
                                <td>{purchase_item.item_total_vat}</td>
                                <td>{purchase_item.item_total_net}</td>
                                <td>{purchase_item.item_total_amount}</td>
                            </tr> 
                        )}   
                        <tr className='bg-total'>
                            <td className='text-right label-total' colSpan="7">Total VAT</td>
                            <td className='label-total-num' colSpan="2">{purchase.total_vat}</td>
                        </tr>
                        <tr className='bg-total'>
                            <td className='text-right label-total' colSpan="7">Total Net</td>
                            <td className='label-total-num' colSpan="2">{purchase.total_net}</td>
                        </tr>
                        <tr className='bg-total'>
                            <td className='text-right label-total' colSpan="7">Total Amount</td>
                            <td className='label-total-num' colSpan="2">{purchase.total_amount}</td>
                        </tr>
                    </tbody>                         
                )
            
        )
    }

    fetchData(){
        $("#q_purchase_date_cont").val('')
        this.setState({
            fetching: true,
            branch: [],
            item: [],
            invoice: '',
            supplier: [],
            category: [],
            searching: false
        })
        $.ajax({
            url: '/api/purchases.json',
            method: 'GET',
            success: (data => {
                this.setState({ items: data.items, purchases: data.purchases, fetching: false, nextPage: data.next_page })
            })
        })
    }
}