class PurchaseOrderOnhold extends React.Component{
    constructor(props){
        super(props)
        this.state = { purchaseOrders: [], fetching: false, nextPage: null }
    }

    componentDidMount(){
        this.fetchData()
    }

    handleNextPurchaseOrders(){
        this.setState({ fetching: true })
        $.ajax({
            url: `/api/purchase_order_summary/get_on_hold_pos.json?page=${this.state.nextPage}`,
            method: 'GET',
            success: (data) => {
                this.setState({
                    fetching: false,
                    nextPage: data.next_page,
                    purchaseOrders: [ ...this.state.purchaseOrders, ...data.on_hold_pos ]
                });
            }
        })
    }

    render(){
        return(           
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
        if(purchaseOrders.length != 0){
            return(
                purchaseOrders.map((po, index) => 
                    <tr key={index}>    
                        <td data-title='Branch'>{po.branch.name}</td>
                        <td data-title='PR No.'>{po.pr_number}</td>
                        <td data-title='PR Date'>{po.pr_date ? po.pr_date : '---' }</td>
                        <td data-title='Supplier.'>{po.supplier.name}</td>
                        <td data-title='PO No.'>{po.po_number ? po.po_number : '---' }</td>
                        <td data-title='PO Date'>{po.po_date ? po.po_date : '---' }</td>
                        <td data-title='Status'>{po.status}</td>
                        <td className='action' data-title='Action'>
                            <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="View purchase_order Items" href={`/purchase_orders/${po.id}/purchase_order_items`}><i className="icon-glyph-41 f14"></i></a>
                            <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Approve" data-remote='true' href={`/purchase_orders/${po.id}/purchase_order_items/approve_purchase_order`}><i className="fa green icon-glyph-26 f14"></i></a>
                            <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Reject" rel="nofollow" data-method="patch" href={`/purchase_orders/${po.id}/reject`}><i className="icon-glyph-27 f14"></i></a>
                            <a onClick={() => this.fetchData() } className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href={`/purchase_orders/${po.id}`}><i className="icon-glyph-76 f14"></i></a>
                        </td>
                    </tr>
                )
            )
        }
    }

    fetchData(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/purchase_order_summary/get_on_hold_pos.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchaseOrders: data.on_hold_pos, nextPage: data.next_page, fetching: false
                })
            }
        })
    }

}