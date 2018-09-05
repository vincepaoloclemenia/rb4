class MonthlyCustomerCountChart extends React.Component{
    constructor(props){
        super(props)
        this.state = { fetching: false, data: {} }
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/dashboards/monthly_customer_count_average.json",
            method: "GET",
            dataType: "JSON",
            success: (data) => {
                this.setState({
                    data: data,
                    fetching: false
                })
            }
        })
    }

    render(){
        if (this.state.fetching){
            return(
                <div className='panel'>
                    <div className='panel-body'>
                        <div className='row mt25 mb25'>
                            <div className='col-xs-12'>
                                <center>
                                    <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            )
        }
        return(
            <div className='panel'>
                <div id="chart-container-this-month-customer-count">
                    <ReactFC 
                        dataSource={this.state.data}
                        id="monthyl-average-chart-customer-count"
                        renderAt="monthly-average-customer-count-chart"
                        type="angulargauge"
                        width="100%"
                        height={250}
                        dataFormat="json"
                    />
                </div>
            </div>
        )
    }
}