class PurchaseOrdersListing extends React.Component{
    constructor(props){
        super(props)
        this.state = { searching: false, fetching: false, branches: [], branch: null, purchaseOrders: [], date: '', nextPage: null }
    }

    componentDidMount(){
        $('.drp').daterangepicker({ });
        this.setState({ fetching: true})
        $.ajax({
            url: '/api/purchase_orders/summary.json',
            method: 'GET',
            success: (data) => {
                if(this.props.branchUser){
                    this.setState({ fetching: false, branches: data.branches, purchaseOrders: data.purchase_orders, date: data.date_range })
                }else{
                    this.setState({ fetching: false, branches: data.branches })                    
                }
            }
        })
    }

    searchPurchaseOrders(){
        if(this.props.branchUser){
            if($("#date_range").val() !== ''){
                this.setState({ fetching: true, searching: true })
                $.ajax({
                    url: '/api/purchase_orders/summary.json',
                    method: 'GET',
                    data: { 
                        date: $("#date_range").val() === '' ? [] : $("#date_range").val().split(" - ")
                    },
                    success: (data) => {
                        this.setState({ fetching: false, purchaseOrders: data.purchase_orders, date: data.date_range })
                    }
                })
            }
        }else{
            if($("#date_range").val() !== '' && this.state.branch ){
                this.setState({ fetching: true, searching: true })
                $.ajax({
                    url: '/api/purchase_orders/summary.json',
                    method: 'GET',
                    data: { 
                        date: $("#date_range").val() === '' ? [] : $("#date_range").val().split(" - "),
                        branch: this.state.branch.value
                    },
                    success: (data) => {
                        this.setState({ fetching: false, purchaseOrders: data.purchase_orders, date: data.date_range })
                    }
                })
            }
        }
    }

    downloadPdf(event){
        if(this.props.branchUser){
            if(this.state.searching){
                var dates = $("#date_range").val().split(" - ").map( x => `&date[]=${x}` ).toString()
                event.target.target = "_blank"
                event.target.href = `/api/purchase_orders/summary.pdf?${dates.replace(/,/, '')}`
            }else{
                event.target.target = "_blank"
                event.target.href = "/api/purchase_orders/summary.pdf"
            }
        }else{
            if(this.state.searching && this.state.branch && $("#date_range").val() !== ''){
                var dates = $("#date_range").val().split(" - ").map( x => `&date[]=${x}` ).toString()
                event.target.target = "_blank"
                event.target.href = `/api/purchase_orders/summary.pdf?${dates.replace(/,/, '')}&branch=${this.state.branch.value}`
            }
        }
    }

    render(){
        return(
            <div className='panel'>
                <div className='panel-heading pb20'>
                    <div className='pull-left'>Purchase Order Summary</div>
                </div>
                <div className='panel-body'>
                    {this.renderInformationBoard()}
                    <div className='row pb25'>
                        <div className='col-md-6'>
                            <label >Date Filter</label>
                            <input className="form-control drp" placeholder="Search Date Range" type="text" name="date_range" id="date_range"/>  
                        </div>
                        {this.renderBranchFilter()}
                    </div>
                    <div className='row'>               
                        <div className='col-xs-12'>
                            <div className='pull-left'>
                                <button onClick={this.searchPurchaseOrders.bind(this)} className='btn btn-primary' type='button'><i className='fa fa-search' aria-hidden='true'></i><span className='gap1'></span>Search</button>
                                <span className='space'></span>
                                {this.renderDownloadButton()}
                            </div>
                        </div>
                    </div>
                </div>
                <div className='panel-body'>
                    {this.renderDateSearched()}
                    <div className='no-more-tables'>
                        <table className='table table-bordered table-striped mb0'>
                            <thead>
                                <tr className='bg-thead'>
                                    <th width='100'>PO Number</th>
                                    <th width='100'>PO Date</th>
                                    <th width='100'>Remarks </th>
                                    <th width='90'>Item Name</th>
                                    <th width='100'>Item Brand</th>   
                                    <th width='100'>Packaging</th>
                                    <th width='100'>Quantity</th>
                                    <th width='100'>Unit</th>
                                    <th width='100'>Unit Price</th>
                                    <th width='90'>Total Price</th>
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
        )
    }

    renderDownloadButton(){
        if(this.state.searching || this.props.branchUser){
            return(
            <a className="btn btn-success btn-round btn-outline" onClick={this.downloadPdf.bind(this)} ><i className="icon-glyph-162 f14 mr5"></i> Download as PDF</a>            )
        }
    }
    renderTableData(){
        return(
            <tbody>
                {
                    this.state.purchaseOrders.map((poi, index) => 
                        [
                            <tr className='total-amount' key={index}>
                                <td style={{ textAlign: 'center' }} className='subcategory' colSpan='10' >{poi.supplier}</td>        
                            </tr>,
                            
                            poi.purchase_order_items.map((item, i) =>
                                <tr key={i}>
                                    <td>{item.po_number}</td>
                                    <td>{item.po_date}</td>
                                    <td>{item.remarks}</td>
                                    <td>{item.item}</td>
                                    <td>{item.po_number}</td>
                                    <td style={{ textAlign: 'center' }}>{item.packaging}</td>
                                    <td style={{ textAlign: 'center' }}>{item.quantity}</td>
                                    <td style={{ textAlign: 'center' }}>{item.unit}</td>
                                    <td className='text-pull-right'>{item.unit_price}</td>
                                    <td className='text-pull-right'>{item.total}</td>
                                </tr>
                            ),
                            <tr key={index+1}className='total-amount bg-total'>
                                <td style={{ textAlign: 'right' }} colSpan='9' data-title='Total Amount'>Total amount ordered from {poi.supplier}</td>
                                <td className='label-total-num text-pull-right' data-title='Total Amount'>{poi.over_all}</td>
                            </tr>         
                        ]
                    )
                }
            </tbody>
        )
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
        
    }

    renderDateSearched(){
        if(this.props.branchUser || this.state.searching){
            return(
                <div className='row ml15 mb25'>    
                    <div className='col-xs-12 ml15'>      
                        {this.state.date}  
                    </div>             
                </div>
            )
        }
    }

    renderInformationBoard(){
        if(this.props.branchUser){
            return(
                <div className='alert alert-info' role='alert'>
                    <div className='row'>
                        <div className='col-xs-1 text-right'>
                            <i className='icon-glyph-73 f25'></i>
                        </div>
                        <div className='col-xs-11'>
                            Please fill up the <b>date</b> field to search for specific date range.
                        </div>
                    </div>
                </div>
            )
        }else{
            return(
                <div className='alert alert-info' role='alert'>
                    <div className='row'>
                        <div className='col-xs-1 text-right'>
                            <i className='icon-glyph-73 f25'></i>
                        </div>
                        <div className='col-xs-11'>
                            Please fill up both the <b>branch and date</b> fields to search for specific date range and branch.
                        </div>
                    </div>
                </div>
            )
        }
    }

    renderBranchFilter(){
        if(this.props.branchUser){ return }
        return(
            <div className='col-xs-6 mb5'>
                <label htmlFor='q[item]'>Branch Filter</label>
                <Select.Creatable
                    name='branch'
                    optionClassName='form-control'
                    options={this.state.branches}
                    onChange={ value => this.setState({ branch: value }) }
                    value={this.state.branch}               
                />  
            </div>
        )
    }
}