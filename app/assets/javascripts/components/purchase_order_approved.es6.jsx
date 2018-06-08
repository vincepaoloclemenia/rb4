class PurchaseOrderApproved extends React.Component{
    constructor(props){
        super(props)
        this.state = { searching: false, purchaseOrders: [], fetching: false, nextPage: null, suppliers: [], branches: [], supplier: null, branch: null }
    }

    searchPurchaseOrders(){
        this.setState({ fetching: true, searching: true })
        $.ajax({
            url: '/api/purchase_order_summary.json',
            method: 'GET',
            data: {
                search: { 
                    branch: this.state.branch ? [this.state.branch.input] : [] , 
                    supplier: this.state.supplier ? [this.state.supplier.input] : [], 
                    date: $("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - ") 
                },
            },
            success: (data) => {
                this.setState({
                    purchaseOrders: data.approved_purchase_orders,
                    nextPage: data.next_page,
                    fetching: false
                })
            }
        })
    }

    componentDidMount(){
        $('.drp').daterangepicker({ });
        this.fetchData()
    }

    handleNextPurchaseOrders(){
        this.setState({ fetching: true })
        if(this.state.searching){
            $.ajax({
                url: `/api/purchase_order_summary.json`,
                method: 'GET',
                data: {
                    search: { 
                        branch: this.state.branch ? [this.state.branch.input] : [] , 
                        supplier: this.state.supplier ? [this.state.supplier.input] : [], 
                        date: $("#q_purchase_date_cont").val() === '' ? [] : $("#q_purchase_date_cont").val().split(" - ") 
                    },
                    page: this.state.nextPage
                },
                success: (data) => {
                    this.setState({
                        fetching: false,
                        nextPage: data.next_page,
                        purchaseOrders: [ ...this.state.purchaseOrders, ...data.approved_purchase_orders ]
                    });
                }
            })
        }else{
            $.ajax({
                url: `/api/purchase_order_summary.json?page=${this.state.nextPage}`,
                method: 'GET',
                success: (data) => {
                    this.setState({
                        fetching: false,
                        nextPage: data.next_page,
                        purchaseOrders: [ ...this.state.purchaseOrders, ...data.approved_purchase_orders ]
                    });
                }
            })
        }
    }

    resetEverything(){
        $("#q_purchase_date_cont").val('') 
        this.setState({ searching: false, branch: null, supplier: null })
        this.fetchData()
    }

    render(){
        return(       
            <div>    
                <div className='row ml15 mb10'>
                    <div className='col-md-4'>
                        <label htmlFor='supplier_names'>Suppliers</label>
                        <Select.Creatable
                            name='supplier_names'
                            optionClassName='form-control'
                            options={this.state.suppliers}
                            onChange={ value => this.setState({ supplier: value }) }
                            value={this.state.supplier}               
                        />          
                    </div>
                    <div className='col-md-4'>
                        <label htmlFor='branch_names'>Branches</label>
                        <Select.Creatable
                            name='branch_names'
                            optionClassName='form-control'
                            options={this.state.branches}
                            onChange={ value => this.setState({ branch: value }) }
                            value={this.state.branch}               
                        />          
                    </div>
                    <div className='col-md-4'>
                        <label htmlFor='date_range'>Date</label>
                        <input className="form-control drp" placeholder="Search" type="text" name="date_range" id="q_purchase_date_cont"/>         
                    </div>
                </div>
                <div className='row ml15 mb30'>               
                    <div className='col-xs-12'>
                        <div className='pull-right'>
                            <button onClick={this.searchPurchaseOrders.bind(this)} className='btn btn-primary' type='button'><i className='fa fa-search' aria-hidden='true'></i><span className='gap1'></span>Search</button>
                            {this.displayResetButton()}
                        </div>
                    </div>
                </div>

                <div className='no-more-tables'>
                    <table className='table table-bordered table-striped mb0'>
                        <thead>
                            {this.renderHeader()}
                        </thead>
                        <tbody style={{ fontSize: '13px' }}>
                            {this.renderTableDataForAdmins(this.state.purchaseOrders)}
                        </tbody>
                    </table>
                    <ul>
                        <li><center>{this.renderButton()}</center></li>
                    </ul>
                </div>  
            </div>       
        )
    }

    displayResetButton(){
        if(this.state.searching){
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
        if(this.state.purchaseOrders.length === 0){
            return(
                <p className='text-center mt5'>No Records Found</p>
            )
        }
        if(!this.state.nextPage){ return }
        return(          
            <a className='view-more' onClick={this.handleNextPurchaseOrders.bind(this)}>See more..</a>              
        )
        
    }

    renderHeader(){
        return(
            <tr className="bg-thead">
                <th width="120">Branch</th>
                <th data-sortable="false" width="130">PR Number</th>
                <th width="120">PR Date</th>
                <th width="160">Supplier</th>
                <th width="160">PO Number</th>
                <th width="160">PO Date</th>            
                <th width="160">Status</th>        
                <th width="140">Action</th>       
            </tr>
        )
    }

    renderTableDataForAdmins(purchaseOrders){
        if(purchaseOrders.length > 0){
            return(
                purchaseOrders.map((po, index) => 
                    <tr key={index}>    
                        <td data-title='Branch'>{po.branch.name}</td>
                        <td data-title='PR No.'>{po.pr_number}</td>
                        <td data-title='PR Date'>{po.pr_date ? po.pr_date : '---' }</td>
                        <td data-title='Supplier.'>{po.supplier.name}</td>
                        <td data-title='PO No.'>{po.po_number ? po.po_number : '---' }</td>
                        <td data-title='PO Date'>{po.po_date ? po.po_date : '---' }</td>
                        <td data-title='Status'>{po.status} --- {po.sent ? <span className='green'>Sent {po.date_sent}</span> : <span className='red'>Unsent</span> }</td>
                        <td className='action' data-title='Action'>
                            <a className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="View" href={`/purchase_orders/${po.id}/purchase_order_items`}><i className='icon-glyph-41 f14'></i></a>
                            {this.renderAdminDeleteButton(po)}
                        </td>
                    </tr>
                )
            )
        }
    }

    renderAdminDeleteButton(po){
        if(po.client_and_sent){
            return(
                <a onClick={() => this.fetchData() } className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href={`/purchase_orders/${po.id}`}><i className="icon-glyph-76 f14"></i></a>                
            )
        }
    }

    fetchData(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/purchase_order_summary.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchaseOrders: data.approved_purchase_orders, fetching: false, nextPage: data.next_page, branches: data.branches, suppliers: data.suppliers
                })
            }
        })
    }

}