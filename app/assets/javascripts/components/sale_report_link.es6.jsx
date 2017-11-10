class SaleReportLink extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
            <a href={`/sale_reports/${this.props.saleReport.id}`} >{this.props.saleReport.title}</a>
        )
    }
}