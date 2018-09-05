class MonthlyAverageChart extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            data: null
        }
    }

    componentDidMount(){
        $.ajax({
            url: "/api/dashboards/monthly_sales_average.json",
            method: "GET",
            success: (data) => {
                this.setState({
                    data: data
                })
            }
        })
    }

    render(){
        return(
            <div className='panel'>
                <div id="chart-container-this-week">
                    <ReactFC 
                        dataSource={this.state.data}
                        id="monthyl-average-chart"
                        renderAt="monthly-average-chart"
                        type="line"
                        width="100%"
                        height={450}
                        dataFormat="json"
                    />
                </div>
            </div>
        )
    }
}