class BranchSalesTable extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
            <table className="table table-bordered table-striped mb0" data-sortable="" data-sortable-initialized="true">
                <thead>
                    <tr className="bg-thead">
                        <th width="140">Date</th>
                        <th width="140">Branch</th>
                        <th width="130">Net Sales</th>
                        <th width="130">Vat</th>
                        <th width="190">Settlement Type Sales</th>
                        <th width="170">Cash for Deposits</th>
                        <th data-sortable="false" width="100">Action</th>
                    </tr>
                </thead>
                {this.renderTableData()}
            </table>
        )
    }

   

    renderTableData(){
        if(this.props.sales.length === 0){
            return(
                <tbody>
                    <tr><td colSpan='7'><center><i>No sales records found</i></center></td></tr>
                </tbody>
            )
        }
        return(            
            <tbody>
                {this.props.sales.map ((sale) =>
                    <tr className="animated-row" key={sale.id}>
                        <td data-title="Date">{sale.date}</td>
                        <td data-title="Branch">{sale.branch}</td>
                        <td className='align-right' data-title="Net Sales">{sale.net}</td>
                        <td className='align-right' data-title="Vat">{sale.vat}</td>
                        <td className='align-right' data-title="Settlement Type Sales">{sale.settlement}</td>
                        <td className='align-right' data-title="Cash for Deposits">{sale.deposits}</td>
                        <td className="action" data-sortable="false" data-title="Action">
                            <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="View Sales" href={`/sales/${sale.id}`}>
                                <i className="icon-glyph-41 f14"></i>
                            </a>
                            <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href={`/sales/${sale.id}`}>
                                <i className="icon-glyph-76 f14"></i>
                            </a>
                        </td>
                    </tr>
                )}
            </tbody>            
        )
    }

}