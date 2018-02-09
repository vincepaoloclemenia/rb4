class PurchaseOrderRejected extends React.Component{
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
                        {this.renderHeader()}
                    </thead>
                    <tbody style={{ fontSize: '13px' }}>
                        {this.renderTableDataForAdmins(this.state.purchaseOrders)}
                    </tbody>
                </table>
            </div>         
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

    fetchData(){
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

}