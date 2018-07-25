class ClientBrandSalesContainer extends React.Component{
    constructor(props){
        super(props)
        this.state = { fetching: false, branches: [], sales: [], nextPage: null, data: null }
    }

    componentDidMount(){
        $('.drp').daterangepicker({ });
        this.getBranches()
        $('#barchart').slideUp();
    }

    searchForSales(){
        if(this.state.branch){
            if($("#q_date_range").val() !== ''){ 
                $('#barchart').slideDown(); 
            }else{
                $('#barchart').slideUp(); 
            }
            this.setState({ fetching: true })
            $.ajax({
                url: "/api/sales.json",
                method: "GET",
                data: { 
                    date: $("#q_date_range").val(), 
                    branch_id: this.state.branch.value 
                },
                success: (data) => {
                    this.setState({ fetching: false, sales: data.sales, nextPage: data.next_page, data: { chart: data.chart, dataset: data.dataset, categories: data.categories } })
                    
                }
            })
        }
    }

    getBranches(){
        $.ajax({
            url: "/api/sales.json",
            method: "GET",
            success: (data) => {
                this.setState({ 
                    branches: data.branches
                })
            }
        })
    }

    render(){
        return(
            [
                <div key="sales-table" className='panel'>
                    <div className='panel-heading border pb15'>Sales Records</div>
                    <div className='panel-body'>
                        <div className='row mb10'>                 
                            <div className='col-md-6'>
                                <label htmlFor='branches'>Choose Branch</label>
                                <Select.Creatable
                                    multi={false}
                                    name='branches'
                                    optionClassName='form-control'
                                    options={this.state.branches}
                                    onChange={ value => this.setState({ branch: value }) }
                                    value={this.state.branch} 
                                />    
                            </div>
                            <div className='col-md-6'>
                                <label htmlFor='date_range'>Date Filter</label>
                                <input className='form-control drp' id="q_date_range" name='date_range' type='text' placeholder='Search sales by date range' />
                            </div>
                        </div>
                        <div className='row'>
                            <div className='col-md-12'>
                                <div className='pull-right'>
                                    <button onClick={this.searchForSales.bind(this)} className='btn btn-link' type='button'> <i className='fa fa-search' aria-hidden='true'></i><span className='gap1'></span>Search </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className='panel-body'>
                        <div className='no-more-tables'>
                            <BranchSalesTable sales={this.state.sales} />
                            <ul >
                                <li>
                                    <center>{this.loadMoreButton()}</center>
                                </li>
                            </ul>
                        </div>     
                    </div>
                </div>,
                <div id="barchart" key="sales-bar-chart-per-branch" className='panel'>
                    <div className='panel-heading border pb15'>Sales Bar Chart {this.state.branch ? `(${this.state.branch.label})` : ''}</div>
                    <div className='panel-body'>
                        <div className='row'>
                            <div className='col-md-12'>
                                <SalesBarChart data={this.state.data} />
                            </div>
                        </div>
                    </div>
                </div>
            ]
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

    handleLoadMore() {
        if (!this.state.nextPage) { return }
        this.setState({ fetching: true })
        $.ajax({
            url: `/api/sales.json/?page=${this.state.nextPage}&date=${$("#q_date_range").val()}&branch_id=${this.state.branch.value}`,
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
}