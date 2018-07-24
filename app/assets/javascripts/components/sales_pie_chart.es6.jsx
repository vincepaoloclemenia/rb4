class SalesPieChart extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
            <div id="chart-container-last-week-vs-this-week">
                <ReactFC 
                    dataSource={this.props.piechartData}
                    id="last-week-vs-this-week"
                    renderAt="last-week-vs-this-week-container"
                    type="pie2d"
                    width="100%"
                    height={400}
                    dataFormat="json"
                />
            </div>
        )
    }

}