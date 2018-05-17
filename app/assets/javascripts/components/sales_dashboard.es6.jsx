class SalesDashboard extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            averageSales: 0, fetching: false, lastWeekSales: 0, salesPercentage: 0
        }
    }

    componentWillMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/sales/get_sales_averages.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    averageSales: data.sales_average,
                    lasWeekSales: data.last_week_sales,
                    salesPercentage: data.percentage,
                    fetching: false
                })
            }
        })
    }
    render(){
        return(
            <div className={`panel-body ${this.state.fetching ? 'blurry' : ''}`}>
                <div className="row mb5">
                    <div className="pull-left">
                        <label className="dashboard">Daily Average Sales</label>
                    </div>
                    <div className="pull-right">
                        <p className="dashboard">{this.state.averageSales}</p>
                    </div>
                </div>
                <div className="row mb5">
                    <div className="pull-left">
                        <label className="dashboard">Last Week's Sales</label>
                    </div>
                    <div className="pull-right">
                        <p className="dashboard">{this.state.lasWeekSales}</p>
                    </div>                    
                </div>
                <div className="row dpb25">
                    <center>
                        <p className="percentage"><i className="fa fa-usd" aria-hidden="true"></i><span className="space"></span>{this.state.salesPercentage} %</p>
                        <label className="dashboard">(Sales Percentage for last 7 days)</label>
                    </center>
                </div>
            </div>
        )
    }

}