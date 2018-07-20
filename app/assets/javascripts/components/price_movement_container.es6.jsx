class PriceMovementContainer extends React.Component{
    constructor(props){
        super(props)
        this.state = { overAll: '---', beginningMonth: '...', totalWeek: '---', totalMonth: '---', items: [], fetching: false, lastWeekRange: '...', lastMonthRange: '...', today: '...' }
    }

    search(){
        var date = $('.form-control').val()
        if(date){
            this.setState({ fetching: true })
            $.ajax({
                url: '/api/reports.json',
                method: 'GET',
                data: { date: date },
                success: (data) => {
                    this.setState({ fetching: false, overAll: data.overall, beginningMonth: data.beginning, totalWeek: data.total_cost_for_week, totalMonth: data.total_cost_for_month, items: data.items, today: data.today, lastWeekRange: data.last_week_range, lastMonthRange: data.last_month_range })
                }
            })
        }
    }
    componentDidMount(){
        $('.form-control').datepicker({ 
            autoclose: true,
        })
        this.fetchDefault()
    }

    render(){
        return(
            <div className='panel'>
                <div className='panel-heading'>Price Movement Report
                    <div className='pull-right'>
                        <input className='form-control' name='date' type='text' placeholder='mm/dd/yyyy' />
                    </div>
                    <div className='pull-right'>
                        <button class='btn btn-link' type='button' onClick={this.search.bind(this)}><i className='fa fa-search fa-sm'></i></button>
                    </div>
                </div>
        
                <div className='panel-body'>
                    <div className='no-more-tables'>
                        <table className='table table-bordered table-striped mb0' data-sortable='true'>
                            <thead>
                                    <tr className='bg-thead'>
                                        <th style={{textAlign: 'center'}}>Item</th>
                                        <th style={{textAlign: 'center'}}>Unit</th>
                                        <th style={{textAlign: 'center'}}>Item Amount as of 
                                            <br/>
                                            <span style={{fontSize: '10px'}}>
                                                {this.state.today}
                                            </span>
                                        </th>
                                        <th style={{textAlign: 'center'}}>Last Week Price Movement
                                            <br/>
                                            <span style={{fontSize: '10px'}}>
                                                ({this.state.lastWeekRange})
                                            </span>
                                        </th>
                                        <th style={{textAlign: 'center'}}>( Last Week % )
                                            <br/>
                                            <span style={{fontSize: '10px'}}>
                                                ({this.state.lastWeekRange})
                                            </span>
                                        </th>
                                        <th style={{textAlign: 'center'}}>Last Month Price Movement
                                            <br/>
                                            <span style={{fontSize: '10px'}}>
                                                ({this.state.lastMonthRange})
                                            </span>
                                        </th>
                                        <th style={{textAlign: 'center'}}>( Last Month % )
                                            <br/>
                                            <span style={{fontSize: '10px'}}>
                                                ({this.state.lastMonthRange})
                                            </span>
                                        </th>                                       
                                    </tr>
                            </thead>
                            {this.renderTableData()}
                        </table>
                    </div>
                </div>
            </div>
        )
    }

    renderTableData(){
        if(this.state.fetching){
            return(
                <tbody>
                    <tr>
                        <td colSpan='7'>
                            <center><i className="fa fa-spinner fa-spin mr5"></i>Loading data. Please wait..</center>
                        </td>
                    </tr>
                </tbody>
            )
        }else{
            return(
                <tbody>
                    {
                        this.state.items.map((item, index) => 
                            <tr key={index}>
                                <td data-title='Item name'>{item.name}</td>
                                <td data-title='Unit name'>{item.unit}</td>
                                <td data-title='Recent amount'>{item.current_amount}</td>
                                {this.renderLastWeek(item)}
                                {this.renderLastMonth(item)}
                            </tr>
                        )} 
                    <tr className='bg-total'>
                        <td colSpan='6'>Total cost saved/spent from last week {this.state.lastWeekRange}</td>
                        <td data-title='Last Week Total' colSpan='2' className='label-total-num align-right'><span className={this.state.totalWeek.status ? 'red' : 'green'}>{this.state.totalWeek.value}</span></td>
                    </tr>
                    <tr className='bg-total'>
                        <td colSpan='6'>Total cost saved/spent from last month {this.state.lastMonthRange}</td>
                        <td data-title='Last Month Total' colSpan='2' className='label-total-num align-right'><span className={this.state.totalMonth.status ? `red` : 'green' }>{this.state.totalMonth.value}</span></td>
                    </tr>
                    <tr className='bg-total'>
                        <td colSpan='6'>Total cost saved/spent from {this.state.beginningMonth} - {this.state.today}</td>    
                        <td data-title='Overall' className='label-total-num align-right'><span className={this.state.overAll.status ? 'red':'green'} >{this.state.overAll.value}</span></td>
                    </tr>                                 
                </tbody>
            )
        }
    }

    renderLastWeek(item){
        if(item.last_week_found){
            return(
                <td colSpan='2' data-title='Price Movement & Percentage (Last Week)'><center><i>No purchased items found from last week</i></center></td>             
            )
        }else{  
            return(
                [
                    <td data-title='Price Movement (Last Week)'>{`${item.last_week_amount} `}<span style={{ float: 'right'}} className={ item.last_week_comparison ? 'red': 'green'}>({item.last_week_difference})</span></td>,
                    <td className='text-centered' data-title='Percentage Movement (Last Week)'><span className={ item.last_week_comparison ? 'red': 'green'}>{item.last_week_percentage}</span></td>
                ]
            )
        }
    }

    renderLastMonth(item){
        if(item.last_week_found){
            return(
                <td colSpan='2' data-title='Price Movement & Percentage (Last Month)'><center><i>No purchased items found from last month</i></center></td>             
            )
        }else{  
            return(
                [
                    <td data-title='Price Movement (Last Month)'>{`${item.last_month_amount} `}<span style={{ float: 'right'}} className={ item.last_month_comparison ? 'red': 'green'}>({item.last_month_difference})</span></td>,
                    <td className='text-centered' data-title='Percentage Movement (Last Month)'><span className={ item.last_month_comparison ? 'red': 'green'}>{item.last_month_percentage}</span></td>
                ]
            )
        }
    }

    fetchDefault(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/reports.json',
            method: 'GET',
            success: (data) => {
                this.setState({ fetching: false, overAll: data.overall, beginningMonth: data.beginning, totalWeek: data.total_cost_for_week, totalMonth: data.total_cost_for_month, items: data.items, today: data.today, lastWeekRange: data.last_week_range, lastMonthRange: data.last_month_range })
            }
        })
    }
}