class SaleReportLink extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
                <a className="sale-report-link" href={`/sale_reports/${this.props.saleReport.id}`} data-remote="true" >View: {this.props.saleReport.title}</a>
        )
    }
}