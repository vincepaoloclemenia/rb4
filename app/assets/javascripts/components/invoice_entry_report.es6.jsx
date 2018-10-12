class InvoiceEntryReport extends React.Component{
    constructor(props){
        super(props)
        this.state = { fetching: false, invoices: [], nextPage: null, suppliers: [], supplier: null }
        this.colsSize = this.props.branchAdmin ? "col-md-6" : "col-md-4"
    }

    componentDidMount(){
        $('.drp').daterangepicker({
            
        });
        this.fetchData()
    }

    searchPurchases(){
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/reports/get_invoices.json",
            method: 'GET',
            data: {
                invoice: {
                    supplier: this.state.supplier ? this.state.supplier.input : null,
                    branch: this.state.branch ? this.state.branch.input : null,
                    date_range: $("#q_purchase_date_cont").val()
                }
            },
            success: (data) => {
                this.setState({ fetching: false, nextPage: data.next_page, invoices: data.purchases })
            }
        })
    }

    handleNextPurchaseOrders(){
        this.setState({ fetching: true })
        $.ajax({
            url: `/api/reports/get_invoices.json?page=${this.state.nextPage}`,
            method: 'GET',
            data: {
                invoice: {
                    supplier: this.state.supplier ? this.state.supplier.input : null,
                    branch: this.state.branch ? this.state.branch.input : null,
                    date_range: $("#q_purchase_date_cont").val()
                }
            },
            success: (data) => {
                this.setState({ nextPage: data.next_page, fetching: false, invoices: [...this.state.invoices, ...data.purchases] })
            }
        })
    }

    fetchData(){
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/reports/get_invoices.json",
            method: 'GET',
            success: (data) => {
                this.setState({ nextPage: data.next_page, fetching: false, suppliers: data.suppliers, branches: data.branches, invoices: data.purchases })
            }
        })
    }

    render(){
        return(
            [
                <div key='panel-1' className="panel">
                    <div className="panel-heading">
                        Search Filter
                    </div>
                    <div className="panel-body">
                        <div className="row mb10">
                            {this.renderBranchFilter()}
                            <div className={this.colsSize}>                              
                                <label htmlFor='search[branches]'>Supplier</label>
                                <Select.Creatable
                                    name="search[suppliers]"
                                    optionClassName='form-control'
                                    options={this.state.suppliers}
                                    onChange={ value => this.setState({ supplier: value }) }
                                    value={this.state.supplier}               
                                />                                     
                            </div> 
                            <div className={this.colsSize}>
                                <label htmlFor='date_range'>Date</label>
                                <input readOnly="true" className="form-control drp" placeholder="Search" type="text" name="date_range" id="q_purchase_date_cont"/>         
                            </div>                            
                        </div>
                        <div className="row mb10 pull-right">
                            <div className="col-xs-12">
                                <button onClick={this.searchPurchases.bind(this)} className='btn btn-primary' type='button'><i className='fa fa-search' aria-hidden='true'></i><span className='gap1'></span>Search</button>
                                {this.displayResetButton()}
                            </div>
                        </div>
                    </div>
                </div>,
                <div className='panel' key="panel-2">
                    <div className="panel-heading">
                        Invoice Entry Report
                    </div>
                    <div className="panel-body">
                        <div className="no-more-tables">
                            <table className="table table-bordered table-striped mb0">
                                <thead>
                                    <tr className="bg-thead">
                                        <th className="text-center" width="140">Invoice No.</th>
                                        <th className="text-center" width="140">Invoice Date</th>
                                        <th className="text-center" width="130">Branch</th>
                                        <th className="text-center" width="190">Supplier</th>
                                        <th className="text-center" width="100">VAT Amount</th>
                                        <th className="text-center" width="100">Total Amount</th>
                                        <th className="text-center" width="100">Net Amount</th>
                                        <th className="text-center" width="100">Entry Date</th>
                                        <th className="text-center" width="100">Created By</th>
                                        <th className="text-center" width="50">History Log</th>
                                    </tr>
                                </thead>
                                {this.renderTableData()}
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

    renderBranchFilter(){
        if(this.props.branchAdmin){ return }
        return(
            <div className={this.colsSize}>                              
                <label htmlFor='search[branches]'>Branches</label>
                <Select.Creatable
                    name="search[branches]"
                    optionClassName='form-control'
                    options={this.state.branches}
                    onChange={ value => this.setState({ branch: value }) }
                    value={this.state.branch}               
                />                                     
            </div>
        )
    }

    displayResetButton(){

    }

    renderTableData(){
        return(
            <tbody>
                {this.state.invoices.map((invoice, index) => 
                    <tr key={index}>
                        <td data-title='Invoice No.'>{invoice.invoice_number}</td>
                        <td className='text-centered' data-title='Invoice Date'>{invoice.invoice_date}</td>
                        <td className='text-centered' data-title='Branch'>{invoice.branch}</td>
                        <td className='text-centered' data-title='Supplier'>{invoice.supplier}</td>
                        <td className='align-right' data-title='VAT Amount'>{invoice.vat_amount}</td>
                        <td className='align-right' data-title='Total Amount'>{invoice.total_amount}</td>
                        <td className='align-right' data-title='Net Amount'>{invoice.net_amount}</td>
                        <td className='text-centered' data-title='Entry Date'>{invoice.entry_date}</td>
                        <td className='text-centered' data-title='Created By'>{invoice.created_by}</td>
                        <td className="text-centered" data-title="History Log">
                            <a data-tt="tooltip" data-placement="top" data-original-title="History Log" className="btn btn-default btn-xs mb10" data-remote="true" href={`/purchases/${invoice.id}/view_history_log`}><i className="icon-glyph-78 f14"></i></a>
                        </td>
                    </tr> 
                )}
            </tbody>
        )
    }

    renderButton(){
        if(this.state.fetching){
            return(
                <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>
            )
        }
        if(this.state.invoices.length === 0) {
            return( <i>No Records Found</i>)
        }
        if(!this.state.nextPage){ return }
        return(          
            <a className='view-more' onClick={this.handleNextPurchaseOrders.bind(this)}>See more..</a>              
        )
        
    }
}