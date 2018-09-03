class RevenuesDashboard extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            thisMonthRevenues: 0,  
            thisWeekRevenues: 0, 
            thisYearRevenues: 0,
            thisYearAverage: 0,
            revenuesPercentage: 0,
            date: '--/--/----'
        }
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/sales/get_average_revenues.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    thisMonthRevenues: data.this_month_revenues_total,
                    thisWeekRevenues: data.this_week_revenues_total,
                    thisYearAverage: data.this_year_revenues_ave,
                    thisYearRevenues: data.this_year_revenues_total,
                    date: data.month,
                    fetching: false
                })
            }
        })
    }
    render(){
        return(
            <div className='panel red'>
                <div className='panel-heading mt5 border' >
                    <div className='pull-left white-border'> Revenues</div>
                    
                    <br/>
                
                    <div className={`panel-body ${this.state.fetching ? 'blurry' : ''}`}>
                        <div className="row mb5">
                            <div className="pull-left">
                                <label className="dashboard">This Week's Revenues</label>
                            </div>
                            <div className="pull-right">
                                <p className="dashboard">{this.state.thisWeekRevenues}</p>
                            </div>
                        </div>
                        <div className="row mb5">
                            <div className="pull-left">
                                <label className="dashboard">This Month's Revenues</label>
                            </div>
                            <div className="pull-right">
                                <p className="dashboard">{this.state.thisMonthRevenues}</p>
                            </div>                    
                        </div>
                        <div className="row mb5">
                            <div className="pull-left">
                                <label className="dashboard">This Year's Revenues</label>
                            </div>
                            <div className="pull-right">
                                <p className="dashboard">{this.state.thisYearRevenues}</p>
                            </div>                    
                        </div>
                        <div className="row dpb25">
                            <center>
                                <p className="percentage">{this.state.thisYearAverage}</p>
                                <label className="dashboard"> Daily Revenues Average </label>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

}