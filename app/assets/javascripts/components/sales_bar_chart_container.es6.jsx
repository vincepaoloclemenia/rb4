class SalesBarChartContainer extends React.Component{
    constructor(props){
        super(props)
        this.state = { fetching: false, weekly: true, salesPerWeekBar: null, salesPerMonthBar: null, salesPerWeekPie: null, salesPerMonthPie: null }
    }

    componentDidMount(){
        this.getSalesPerWeek()
        this.getSalesPerMonth()
    }

    showMonthly(e){
        e.preventDefault()
        this.setState({ weekly: false })
    }

    showWeekly(e){
        e.preventDefault()
        this.setState({ weekly: true })
    }

    getSalesPerMonth(){
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/sales/get_sales_per_month.json",
            method: "GET",
            success: (data) => {
                this.setState({
                    fetching: false,
                    salesPerMonthBar: { 
                        chart: data.chart,                       
                        categories: data.categories, 
                        dataset: data.dataset 
                    },
                    salesPerMonthPie: {
                        chart: data.piechart,
                        data: data.data
                    }
                })
            }
        })
    }

    render(){
        return(
            <div className='panel'>
                <div className='panel-heading border pt15'>Sales Data Representation</div>
                <div className='panel-body'>
                    <div className='pull-right mr5'><button type='button' onClick={this.showMonthly.bind(this)} className={this.state.weekly ? 'btn btn-link' : 'btn btn-grey'}>Monthly</button></div>
                    <div className='pull-right'><button type='button' onClick={this.showWeekly.bind(this)} className={this.state.weekly ? 'btn btn-grey' : 'btn btn-link'}>Weekly</button></div>
                </div>
                {this.renderPanelBody()}
            </div>
        )
    }

    getSalesPerWeek(){
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/sales/get_sales_per_week.json",
            method: "GET",
            success: (data) => {
                this.setState({ 
                    fetching: false, 
                    salesPerWeekBar: { 
                        chart: data.chart, 
                        categories: data.categories, 
                        dataset: data.dataset 
                    },
                    salesPerWeekPie: {
                        chart: data.piechart,
                        data: data.data
                    } 
                })
            }
        })
    }

    renderPanelBody() {
        if (this.state.fetching){
            return(
                <div className='panel-body'>
                    <div className='row mt25 mb25'>
                        <center><i className="fa fa-spinner fa-spin fa-lg fa-fw"></i> </center>
                    </div>
                </div>
            )
        }
        if(this.state.weekly){
            return(           
                <div className='panel-body'>
                    <div className='row'>
                        <div className='col-md-6'>
                            <SalesBarChart data={this.state.salesPerWeekBar} />
                        </div>
                        <div className='col-md-6'>
                            <SalesPieChart piechartData={this.state.salesPerWeekPie} />
                        </div>
                    </div>
                </div>    
            )
        }
        return(
            <div className='panel-body'>
                <div className='row'>
                    <div className='col-md-6'>
                        <SalesPerMonthBarChart data={this.state.salesPerMonthBar} />
                    </div>
                    <div className='col-md-6'>
                        <SalesPerMonthPieChart piechartData={this.state.salesPerMonthPie} />
                    </div>
                </div>
            </div>    
        )
    }
}