class BranchSalesTable extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            sales: [], nextPage: null
        }
    }

    componentWillMount(){
        this.fetchSales()
    }

    render(){
        return(
            <div className="no-more-tables">
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
                { this.state.sales.length === 0 ? this.noData() : this.loadMoreButton()}
            </div>
        )
    }


    noData(){
        return(
            <center><p><i>No data to show</i></p></center>
        )
    }

    fetchSales(){
        if(this.props.branch_id === null) { return; }
        var branch = { branch_id: `${this.props.branch}` }
        $.ajax({
            url: '/api/sales.json',
            method: 'GET',
            data: branch,
            dataType: 'JSON',
            success: (data) =>{
                this.setState({
                    sales: data.sales,
                    nextPage: data.next_page
                })
            }
        })
    }

    renderTableData(){
        return(            
            <tbody>
                {this.state.sales.map ((sale) =>
                    <tr className="animated-row" key={sale.id}>
                        <td data-title="Date">{sale.date}</td>
                        <td data-title="Branch">{sale.branch}</td>
                        <td data-title="Net Sales">{sale.net}</td>
                        <td data-title="Vat">{sale.vat}</td>
                        <td data-title="Settlement Type Sales">{sale.settlement}</td>
                        <td data-title="Cash for Deposits">{sale.deposits}</td>
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

    loadMoreButton() {
        if (this.state.nextPage === null) {
            return;
        }
        return (
            <ul >
                <li>
                    <a className="see-more-table" onClick={() => this.handleLoadMore()}>See More
                        <i className={`fa ${this.fetching ? 'fa-spinnerfa-pulse': ''}`}></i>
                    </a>
                </li>
            </ul>
        );
    }

    handleLoadMore() {
        if (this.fetching || !this.state.nextPage) { return; }
        this.fetching = true;
        var branch = { branch_id: `${this.props.branch}` }
        $.ajax({
            url: `/api/sales.json/?page=${this.state.nextPage}`,
            method: 'GET',
            data: branch,
            dataType: 'json',
            success: (data) => {
                this.fetching = false;
                this.setState({
                    nextPage: data.next_page,
                    sales: [ ...this.state.sales, ...data.sales ]
                });
            }
        });
    }
}