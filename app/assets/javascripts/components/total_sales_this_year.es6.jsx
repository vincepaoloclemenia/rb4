class TotalSalesThisYear extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            totalThisYear: 0,  
            highestSale: 0, 
            lowestSale: 0,
            highestSaleDate: "--/--/----",
            lowestSaleDate: "--/--/----",
        }
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/dashboards/this_year_total_sales.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                    totalThisYear: data.this_years_sales_total,
                    highestSale: data.highest_sale,
                    highestSaleDate: data.highest_sale_date,
                    lowestSaleDate: data.lowest_sale_date,
                    lowestSale: data.lowest_sale,
                    fetching: false
                })
            }
        })
    }
    render(){
        return(
            <div className='panel red'>
                <div className={`panel-body ${this.state.fetching ? 'blurry' : ''}`}>
                    <div className='col-xs-12'>
                        <div className="row mb10 mt10">
                            <div className='col-xs-6'>
                                <label htmlFor="total_this_year" className="dashboard">This year's highest sales record</label>
                            </div>
                            <div className='col-xs-6'>
                                <div className="pull-right">
                                    <p className="dashboard">{this.state.highestSale}</p >
                                    <h6>{this.state.highestSaleDate}</h6>
                                </div>
                            </div>
                        </div>  
                        <div className="row mb10">
                            <div className='col-xs-6'>
                                <label htmlFor="total_this_year" className="dashboard">This year's lowest sales record</label>
                            </div>
                            <div className='col-xs-6'>
                                <div className="pull-right">   
                                    <p className="dashboard">{this.state.lowestSale}</p>
                                    <h6>{this.state.lowestSaleDate}</h6>
                                </div>
                            </div>
                        </div>      
                        <div className="row mb10">
                            <center>
                                <p className='percentage'>{this.state.totalThisYear}</p>
                                <label className="dashboard"> Total sales this year </label>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

}