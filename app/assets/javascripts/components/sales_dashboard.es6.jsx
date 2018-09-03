class SalesDashboard extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            thisMonthSales: 0,  
            thisWeekSales: 0, 
            thisYearSales: 0,
            thisYearAverage: 0,
            salesPercentage: 0,
            date: '--/--/----'
        }
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/sales/get_sales_averages.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    thisMonthSales: data.this_month_sales_ave,
                    thisWeekSales: data.this_week_sales_ave,
                    thisYearAverage: data.this_year_sales_ave,
                    //thisYearSales: data.this_year_sales_total,
                    date: data.month,
                    fetching: false
                })
            }
        })
    }
    render(){
        return(
            <div className='panel green'>
                <div className='panel-heading mt5' >
                    <div className='pull-left white-border'> Sales Average</div>
                    
                    <br/>
                </div>
                <div className={`panel-body ${this.state.fetching ? 'blurry' : ''}`}>
                    <div className='col-xs-12'>
                        <div className="row mb5">
                            <div className="pull-left">
                                <label className="dashboard">This Week's Average</label>
                            </div>
                            <div className="pull-right">
                                <p className="dashboard">{this.state.thisWeekSales}</p>
                            </div>
                        </div>
                        <div className="row mb5">
                            <div className="pull-left">
                                <label className="dashboard">This Month's Average</label>
                            </div>
                            <div className="pull-right">
                                <p className="dashboard">{this.state.thisMonthSales}</p>
                            </div>                    
                        </div>
                        <div className="row mb10">
                            <center>
                                <p className="percentage"><span className="space"></span>{this.state.thisYearAverage}</p>
                                <label className="dashboard"> Daily Sales Average as of {this.state.date}</label>
                            </center>
                        </div>
                    </div>
                </div>
                
            </div>
        )
    }

}