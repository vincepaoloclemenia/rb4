class CustomerCountDashboard extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            averageCount: 0, fetching: false, lastWeekCount: 0
        }
    }

    componentWillMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/sales/get_customer_count.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    averageCount: data.customer_count,
                    lastWeekCount: data.average_count,
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
                        <label className="dashboard">Daily Customer's Count</label>
                    </div>
                    <div className="pull-right">
                        <p className="dashboard">{this.state.averageCount}</p>
                    </div>
                </div>
                <div className="row mb5">
                    <div className="pull-left">
                        <label className="dashboard">Customer Count (Last 7 Days)</label>
                    </div>
                    <div className="pull-right">
                        <p className="dashboard">{this.state.lastWeekCount}</p>
                    </div>                    
                </div>
            </div>
        )
    }

}