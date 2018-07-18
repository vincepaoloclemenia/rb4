class ThisweekSalesVsExpense extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            data: null
        }
    }

    componentDidMount(){
        $.ajax({
            url: "/api/dashboards/this_week_sales_vs_expense.json",
            method: "GET",
            success: (data) => {
                this.setState({
                    data: { chart: data.chart, categories: data.categories, dataset: data.dataset }
                })
            }
        })
    }

    render(){
        return(
            <div id="chart-container-this-week">
                <ReactFC 
                    dataSource={this.state.data}
                    id="this-weeks-sales-vs-expense"
                    renderAt="this-weeks-sales-vs-expense-container"
                    type="mscombi2d"
                    width="100%"
                    height={400}
                    dataFormat="json"
                />
            </div>
        )
    }
}