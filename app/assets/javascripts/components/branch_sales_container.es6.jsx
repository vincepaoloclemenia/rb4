class BranchSalesContainer extends React.Component{
    constructor(props){
        super(props)
        this.state={ fetching: false, sales: [], nextPage: null }
    }

    componentDidMount(){
        $('.drp').daterangepicker({ });
        this.fetchSales()
    }

    searchPurchases(){
        if($("#q_date_range").val() !== ''){
            this.setState({ fetching: true })
            $.ajax({
                url: "/api/sales.json",
                method: "GET",
                data: { date: $("#q_date_range").val() },
                success: (data) => {
                    this.setState({ fetching: false, sales: data.sales, nextPage: data.next_page })
                }
            })
        }
    }

    handleLoadMore() {
        if (!this.state.nextPage) { return }
        this.setState({ fetching: true })
        $.ajax({
            url: `/api/sales.json/?page=${this.state.nextPage}&date=${$("#q_date_range").val()}`,
            method: 'GET',
            success: (data) => {
                this.setState({
                    fetching: false, 
                    nextPage: data.next_page,
                    sales: [ ...this.state.sales, ...data.sales ]
                });
            }
        });
    }

    fetchSales(){
        $.ajax({
            url: '/api/sales.json',
            method: 'GET',
            success: (data) =>{
                this.setState({
                    sales: data.sales,
                    nextPage: data.next_page
                })
            }
        })
    }

    render(){
        return(
            <div className='panel'>
                <div className='panel-heading border pb15'>Sales Record </div>
                <div className='row mb10 mt10'>
                    <div className='col-xs-offset-9 col-xs-3'>
                        <div className='input-group'>  
                            <input className='form-control drp' id="q_date_range" name='date' type='text' placeholder='Search sales by date range' />
                        
                            <span className='input-group-btn'>
                                <i onClick={this.searchPurchases.bind(this)} id='search' className='fa fa-search fa-sm' aria-hidden='true'></i>                 
                            </span>
                        </div>  
                    </div>
                </div>
                <div className='panel-body'>  
                    <div className="no-more-tables">
                        <BranchSalesTable sales={this.state.sales} />
                        <ul >
                            <li>
                                <center>{this.loadMoreButton()}</center>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        )

    }

    loadMoreButton() {
        if(this.state.fetching){    
            return(
                <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>      
            )         
        }
        if (this.state.nextPage) {
            return (
                <a className="view-more" onClick={() => this.handleLoadMore()}>See More </a>             
            );
        }
    }
}