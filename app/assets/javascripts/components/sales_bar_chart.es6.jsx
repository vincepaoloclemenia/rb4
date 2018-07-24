class SalesBarChart extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
            <div id="chart-container-sales-analysis">
                <ReactFC 
                    dataSource={this.props.data}
                    id="sales-analysis"
                    renderAt="sales-analysis-container"
                    type="mscombi2d"
                    width="100%"
                    height={400}
                    dataFormat="json"
                />
            </div>
        )
    }

}