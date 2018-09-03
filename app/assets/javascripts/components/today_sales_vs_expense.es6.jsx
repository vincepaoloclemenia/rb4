class TodaySalesVsExpense extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            myData: null
        }
    }
    componentDidMount(){
        $.ajax({
            url: "/api/dashboards.json",
            method: "GET",
            success: (data) => {
                this.setState({ myData: { chart: data.chart, data: data.data } })
            }
        })
    }

    render(){
        return(
            <div id="chart-container">
                <ReactFC 
                    dataSource={this.state.myData}
                    id="today-sales-vs-expense"
                    renderAt="today-sales-vs-expense-container"
                    type="pie2d"
                    width="100%"
                    height={350}
                    dataFormat="json"
                />
            </div>
        )
    }
}