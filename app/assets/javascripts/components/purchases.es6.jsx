class Purchases extends React.Component{
    constructor(props){
        super(props)
        this.state = { 
            fetching: false,
            searching: false,
            purchases: [],
            suppliers: [],
            branches: [],
            invoice: '',
            supplier: [],
            branch: [],
            nextPage: null
        }
    }

    searchPurchases(){
        if(this.state.invoice || this.state.branch.length > 0 || this.state.supplier.length > 0 || $("#q_purchase_date_cont").val() !== ''){
            this.setState({ fetching: true, searching: true })
            if(this.props.branchUser){
                $.ajax({
                    url: `/api/purchases/purchased_items.json`,
                    method: 'GET',
                    data: {
                        search: {
                            suppliers: this.state.supplier.map( x => x.input ),
                            invoice: this.state.invoice,
                            date:$("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - ")
                        }
                    },
                    success: (data) => {
                        this.setState({
                            fetching: false,
                            purchases: data.purchases,
                            nextPage: data.next_page
                        })
                    }
                })
            }else{
                $.ajax({
                    url: `/api/purchases/purchased_items.json`,
                    method: 'GET',
                    data: {
                        search: {
                            suppliers: this.state.supplier.map( x => x.input ),
                            branches: this.state.branch.map( x => x.input ),
                            invoice: this.state.invoice,
                            date:$("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - ")
                        }
                    },
                    success: (data) => {
                        this.setState({
                            fetching: false,
                            purchases: data.purchases,
                            nextPage: data.next_page
                        })
                    }
                })
            }
        }
    }

    resetEverything(){
        this.fetchData()
        this.setState({ supplier: [], branch: [], invoice: '', searching: false })
        $("#q_purchase_date_cont").val('')
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $('.drp').daterangepicker({});
        $.ajax({
            url: '/api/purchases/purchased_items.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchases: data.purchases, fetching: false, nextPage: data.next_page, branches: data.branches, suppliers: data.suppliers
                })
            }
        })
    }

    handleNextPurchases(){
        this.setState({ fetching: true })
        if(this.state.searching){
            if(this.props.branchUser){
                $.ajax({
                    url: `/api/purchases/purchased_items.json?page=${this.state.nextPage}`,
                    method: 'GET',
                    data: {
                        search: {
                            suppliers: this.state.supplier.map( x => x.input ),
                            invoice: this.state.invoice,
                            date:$("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - ")
                        }
                    },
                    success: (data) => {
                        this.setState({
                            fetching: false,
                            nextPage: data.next_page,
                            purchases: [ ...this.state.purchases, ...data.purchases ]
                        });
                    }
                })
            }else{
                $.ajax({
                    url: `/api/purchases/purchased_items.json?page=${this.state.nextPage}`,
                    method: 'GET',
                    data: {
                        search: {
                            suppliers: this.state.supplier.map( x => x.input ),
                            branches: this.state.branch.map( x => x.input ),
                            invoice: this.state.invoice,
                            date:$("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - ")
                        }
                    },
                    success: (data) => {
                        this.setState({
                            fetching: false,
                            nextPage: data.next_page,
                            purchases: [ ...this.state.purchases, ...data.purchases ]
                        });
                    }
                })
            }
        }else{
            $.ajax({
                url: `/api/purchases/purchased_items.json?page=${this.state.nextPage}`,
                method: 'GET',
                success: (data) => {
                    this.setState({
                        fetching: false,
                        nextPage: data.next_page,
                        purchases: [ ...this.state.purchases, ...data.purchases ]
                    });
                }
            })
        }
    }

    render(){
        return(
            [
                <div key='search' className='panel'>
                    <div className='panel-heading border pb45'>
                        <div className='pull-left mt7'>Search Filter</div>
                        
                    </div>
                    {this.renderPurchaseSetup()}
                    <div className='panel-body ml15 mr15'>
                        <div className='row pb10'>
                            <div className='col-md-6'>                              
                                <label htmlFor='search[branches]'>Invoice Number</label>
                                <input className='form-control' placeholder='Input invoice' value={this.state.invoice} onChange={ (e) => this.setState({ invoice: e.target.value })} />                                 
                            </div>
                            <div className='col-md-6'>                              
                                <label htmlFor='date_range'>Date</label>
                                <input className="form-control drp" placeholder="Search" type="text" name="date_range" id="q_purchase_date_cont"/>                                    
                            </div>
                        </div>
                        <div className='row pb10'>                          
                            <div className='col-md-6'>                              
                                <label htmlFor='search[suppliers]'>Suppliers</label>
                                <Select.Creatable
                                    multi={true}
                                    name='search[suppliers]'
                                    optionClassName='form-control'
                                    options={this.state.suppliers}
                                    onChange={ value => this.setState({ supplier: value }) }
                                    value={this.state.supplier}               
                                />                                     
                            </div>
                            {this.renderBranchFilter()}
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
                ,
                <div key='table' className='panel'>
                    <div className='panel-heading border pb45'>
                        <div className='pull-left mt7'>Purchases</div>
                        <div className='pull-right'>
                            <a className="btn btn-success btn-round btn-outline" data-remote="true" href="/purchases/new">
                                <i className="icon-glyph-164 mr5 f14"></i> Create Purchase
                            </a>
                        </div>
                    </div>
                    
                    <div className='panel-body'>
                        <div className='no-more-tables'>
                            <table className='table table-bordered table-striped mb0'>
                                <thead>
                                    {this.renderHeader()}
                                </thead>
                                <tbody style={{ fontSize: '13px' }}>
                                    {this.renderTableDataForAdmins(this.state.purchases)}
                                </tbody>
                            </table>
                            <ul>
                                <li><center>{this.renderButton()}</center></li>
                            </ul>
                        </div>   
                    </div>
                </div>
            ]
        )
    }

    displayResetButton(){
        if(this.state.searching){
            return(
                <button onClick={this.resetEverything.bind(this)} className='btn btn-default'>Reset</button>            
            )
        }
    }

    renderPurchaseSetup(){
        if(this.props.clientOrBrandAdmin){
            return(
                <div className='pull-right'>
                    <a className="btn btn-setting" data-tt="tooltip" data-placement="top" data-original-title="Purchases Setting" data-remote="true" href="/purchases/edit_purcahse_limit">
                        <i className="fa icon-glyph-90 f20 mr5"></i> Purchase Setup
                    </a>
                </div>
            )
        }
    }

    renderBranchFilter(){
        if(this.props.branchUser){ return }
        return(
            <div className='col-md-6'>                              
                <label htmlFor='search[branches]'>Branches</label>
                <Select.Creatable
                    multi={true}
                    name='search[branches]'
                    optionClassName='form-control'
                    options={this.state.branches}
                    onChange={ value => this.setState({ branch: value }) }
                    value={this.state.branch}               
                />                                     
            </div>
        )
    }

    renderButton(){
        if(this.state.fetching){
            return(
                <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>
            )
        }
        if(this.state.purchases.length === 0){
            return(
                <p className='text-center mt5'>No Records Found</p>
            )
        }
        if(!this.state.nextPage){ return }
        return(          
            <a className='view-more' onClick={this.handleNextPurchases.bind(this)}>See more..</a>              
        )
        
    }

    renderHeader(){
        return(
            <tr className="bg-thead">
                <th data-sortable="false" width="130">Invoice Number</th>
                <th data-sortable="false" width="130">Date</th>
                <th width="120">Branch</th>
                <th width="160">Supplier</th>
                <th width="160">Net<br/>Amount</th>
                <th width="160">VAT<br/>Amount</th>            
                <th width="160">Total<br/>Amount</th>        
                <th width="120" data-sortable="false">Action</th>       
            </tr>
        )
    }

    renderTableDataForAdmins(purchases){
        if(purchases.length === 0){ return }
        return(
            purchases.map((purchase, index) => 
                <tr key={index}>    
                    <td data-title='Invoice No.'>{purchase.invoice_number}</td>
                    <td data-title='Date'>{purchase.purchase_date}</td>
                    <td data-title='Branch'>{purchase.branch_name}</td>
                    <td data-title='Supplier.'>{purchase.supplier_name}</td>
                    <td className='text-pull-right' data-title='Net Amount'>{purchase.total_net}</td>
                    <td className='text-pull-right' data-title='Vat Amount'>{purchase.total_vat }</td>
                    <td className='text-pull-right' data-title='Total Amount'>{purchase.total_amount}</td>
                    <td className='action' data-title='Action'>
                        <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="View Purchase Items" href={`/purchases/${purchase.slug}/purchase_items`}><i className="icon-glyph-41 f14"></i></a>
                        {this.renderActionButtons(purchase)}
                    </td>
                </tr>
            )
        )  
    }

    renderActionButtons(purchase){
        if(this.props.branchUser){
            if(purchase.unable_to_modify){ return }
            return(
                <span>
                    <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Edit Purchase" data-remote="true" href={`/purchases/${purchase.id}/edit`}><i className="icon-glyph f14"></i></a>
                    <a onClick={() => this.fetchData() } className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href={`/purchases/${purchase.id}`}><i className="icon-glyph-76 f14"></i></a>
                </span>
            )          
        }else{
            return(
                <span>
                    <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Edit Purchase" data-remote="true" href={`/purchases/${purchase.id}/edit`}><i className="icon-glyph f14"></i></a>
                    <a onClick={() => this.fetchData() } className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href={`/purchases/${purchase.id}`}><i className="icon-glyph-76 f14"></i></a>
                </span>
            )
        }
    }

    fetchData(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/purchases/purchased_items.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchases: data.purchases, fetching: false, nextPage: data.next_page
                })
            }
        })
    }
}