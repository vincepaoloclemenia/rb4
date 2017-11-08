class RevenuesDashboard extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            averageRevenues: 0, fetching: false, lastWeekRevenues: 0, revenuesPercentage: 0
        }
    }

    componentWillMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/sales/get_average_revenues.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    averageRevenues: data.ave_revenues,
                    lastWeekRevenues: data.last_week_revenues,
                    revenuesPercentage: data.percentage,
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
                        <label className="dashboard">Revenues Average</label>
                    </div>
                    <div className="pull-right">
                        <p className="dashboard">{this.state.averageRevenues}</p>
                    </div>
                </div>
                <div className="row mb5">
                    <div className="pull-left">
                        <label className="dashboard">Revenus for the Past Week</label>
                    </div>
                    <div className="pull-right">
                        <p className="dashboard">{this.state.lastWeekRevenues}</p>
                    </div>                    
                </div>
                <div className="row dpb25">
                    <center>
                        <p className="percentage"><i className="fa fa-money" aria-hidden="true"></i><span className="space"></span>{this.state.revenuesPercentage} %</p>
                        <label className="dashboard">(Revenue Percentage for last 7 days)</label>
                    </center>
                </div>
            </div>
        )
    }

}