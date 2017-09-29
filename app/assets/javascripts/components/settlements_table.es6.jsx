class SettlementsTable extends React.Component{
    constructor(props){
        super(props)
        this.state = { settlements: [], nextPage: null, settlement: null }
    }

    componentWillMount(){
        this.fetchSettlements()       
    }

    render(){
        return(
            <div className="no-more-tables">    
                <table className="table table-bordered table-striped mb0" data-sortable="true">
                    <thead>
                        <tr className='bg-thead'>
                            <th width="260" >Name</th>
                            <th width="250" data-sortable="false" >Description</th>
                            <th width="200" >Complimentary</th>
                            <th width="200" >Status</th>
                            <th width="90" data-sortable="false" >Action</th>
                        </tr>                   
                    </thead>

                    {this.state.settlements.map ((settlement) => 
                        <tbody key={settlement.id}>
                            <tr className="settlement-row">
                                <td data-title="Name">{settlement.name}</td>
                                <td data-title="Description">{settlement.description}</td>
                                <td data-title="Complimentary">{settlement.is_complimentary ? 'Yes' : 'No'}</td>
                                <td data-title="Status"><span className={`${settlement.is_active ? 'label label-success ml2' : 'label label-default ml2'}`}>{settlement.is_active ? 'Active' : 'Deactivated'}</span></td>
                                <td className="action" data-title="Action">
                                    <a 
                                        className = "btn btn-default btn-xs mb10 mr2"
                                        data-tt = "tooltip"
                                        data-placement = "top"
                                        data-original-title = "Edit"
                                        data-toggle = "modal"
                                        onClick={() => this.setState({ settlement })}
                                        data-target = {`.edit-settlement-${settlement.id}`}
                                        href = "">
                                            <i className='icon-glyph f14'></i>
                                    </a>
                                    <a
                                        className = "btn btn-default btn-xs mb10 swal-warning-confirm"
                                        data-method = "delete"
                                        data-tt = "tooltip"
                                        data-placement = "top"
                                        data-original-title = "Delete"
                                        data-toggle = "modal"
                                        data-confirm = "Are you sure?"
                                        href = {`/settlements/${settlement.id}`}>
                                        <i className='icon-glyph-76 f14'></i>
                                    </a>
                                </td>                            
                            </tr>
                        </tbody>                        
                    )} 
                </table>
                {this.renderEditModal()}
                {this.loadMoreButton()}
            </div>
        )
    }

    renderEditModal(){
        if (this.state.settlement == null) { return }
        return(
            <SettlementsEditModal settlement={this.state.settlement} />
        )
    }

    fetchSettlements(){
        $.ajax({
            url: `/api/settlements/`,
            method: "GET",
            dataType: "JSON",
            success: (data) => {
                this.setState({
                    settlements: data.settlements,
                    nextPage: data.next_page
                })
            }
        })
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
        $.ajax({
            url: `/api/settlements.json/?page=${this.state.nextPage}`,
            method: 'GET',
            dataType: 'json',
            success: (data) => {
                this.fetching = false;
                this.setState({
                    nextPage: data.next_page,
                    settlements: [ ...this.state.settlements, ...data.settlements ]
                });
            }
        });
    }

}