class ThisYearsSalesExpense extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            data: null
        }
    }

    componentDidMount(){
        $.ajax({
            url: "/api/dashboards/this_years_sales_expense.json",
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
            <div id="chart-container-this-year">
                <ReactFC 
                    dataSource={this.state.data}
                    id="this-years-sales-vs-expense"
                    renderAt="this-years-sales-vs-expense-container"
                    type="mscombi2d"
                    width="100%"
                    height={350}
                    dataFormat="json"
                />
            </div>
        )
    }
}