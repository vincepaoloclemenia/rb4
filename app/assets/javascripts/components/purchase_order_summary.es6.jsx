class PurchaseOrderSummary extends React.Component{
    constructor(props){
        super(props)
        this.state = { purchaseOrders: [] }
    }

    componentDidMount(){
        this.fetchData()
    }

    render(){
        return(           
            <div className='no-more-tables'>
                <table className='table table-bordered table-striped mb0'>
                    <thead>
                        {this.renderHeader(this.props.role)}
                    </thead>
                    <tbody style={{ fontSize: '13px' }}>
                        {this.props.role ? this.renderTableDataForAdmins(this.state.purchaseOrders) : this.renderTableForBranchUsers(this.state.purchaseOrders)}
                    </tbody>
                </table>
            </div>         
        )
    }

    renderHeader(role){
        if(role){
            return(
                <tr className="bg-thead">
                    <th width="120">Branch</th>
                    <th data-sortable="false" width="130">PR Number</th>
                    <th width="120">PR Date</th>
                    <th width="160">PO Number</th>
                    <th width="160">PO Date</th>
                    <th width="160">Supplier</th>
                    <th width="160">Status</th>             
                    <th width="140">Action</th>
                </tr>
            )
        }
        return(
            <tr className="bg-thead">
                <th data-sortable="false" width="130">PR Number</th>
                <th width="120">PR Date</th>
                <th width="160">PO Number</th>
                <th width="160">PO Date</th>
                <th width="160">Supplier</th>
                <th width="160">Status</th>        
                <th width="140">Action</th>       
            </tr>
        )
    }

    renderTableForBranchUsers(purchaseOrders){
        if(purchaseOrders){
            return(
                purchaseOrders.map((po, index) => 
                    <tr key={index}>
                        <td data-title='PR No.'>{po.pr_number}</td>
                        <td data-title='PR Date'>{po.pr_date}</td>
                        <td data-title='PO No.'>{po.po_number ? '---' : po.po_number}</td>
                        <td data-title='PO Date'>{po.pr_date ? '---' : po.po_date}</td>
                        <td data-title='Supplier.'>{po.supplier.name}</td>
                        <td data-title='Status'>{po.status}</td>
                        <td className='action' data-title='Action'>
                            <a onClick={() => this.fetchData() } className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href={`/purchase_orders/${po.id}`}><i className="icon-glyph-76 f14"></i></a>
                        </td>
                    </tr>
                )
            )
        }
        return(
            <tr>
                <td colSpan='8'><p className='text-center mt5'>No Records Found</p></td>
            </tr>
        )
    }

    renderTableDataForAdmins(purchaseOrders){
        if(purchaseOrders){
            return(
                purchaseOrders.map((po, index) => 
                    <tr key={index}>
                        <td data-title='PO No.'>{po.pr_number}</td>
                        <td data-title='PO Date'>{po.pr_date ? '---' : po.pr_date}</td>
                        <td data-title='Supplier.'>{po.supplier.name}</td>
                        <td data-title='Status'>{po.status}</td>
                        <td className='action' data-title='PO No.'>{po.po_number ? '---' : po.po_number}</td>
                        <td className='action' data-title='Action'>
                            <a className="btn btn-default btn-xs mb10 mr2 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href={`/purchase_orders/${po.id}`}><i className="icon-glyph-76 f14"></i></a>
                        </td>
                    </tr>
                )
            )
        }
        return(
            <tr>
                <td colSpan='8'><p className='text-center mt5'>No Records Found</p></td>
            </tr>
        )
    }

    fetchData(){
        if (this.props.role){
            if(this.props.typeOfPos === 'approved'){
                $.ajax({
                    url: '/api/purchase_order_summary.json',
                    method: 'GET',
                    success: (data) => {
                        this.setState({
                            purchaseOrders: data.approved_purchase_orders
                        })
                    }
                })
            }
            if(this.props.typeOfPos === 'onHold'){
                $.ajax({
                    url: '/api/purchase_order_summary/get_on_hold_pos.json',
                    method: 'GET',
                    success: (data) => {
                        this.setState({
                            purchaseOrders: data.on_hold_pos
                        })
                    }
                })
            }
            $.ajax({
                url: '/api/purchase_order_summary/get_rejected_pos.json',
                method: 'GET',
                success: (data) => {
                    this.setState({
                        purchaseOrders: data.rejected_pos
                    })
                }
            })
        }
        $.ajax({
            url: '/api/purchase_order_summary/get_purchase_orders.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    purchaseOrders: data.purchase_orders
                })
            }
        })
    }

}