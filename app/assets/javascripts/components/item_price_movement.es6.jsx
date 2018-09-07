class ItemPriceMovement extends React.Component{
    constructor(props){
        super(props)
        this.state = { data: {} }
    }

    componentDidMount(){
        $.ajax({
            url: `/api/dashboards/price_movement.json?item_id=${this.props.itemId}`,
            method: "GET",
            dataType: "JSON",
            success: (data) => {
                this.setState({
                    data: data,
                })
            }
        })
    }


    render(){
        return(
            <div id={`chart-ipm-${this.props.itemId}`}>
                <ReactFC 
                    dataSource={this.state.data}
                    id={`item-price-movement-container-${this.props.itemId}`}
                    renderAt={`price-movement-container-${this.props.itemId}`}
                    type="spline"
                    width="100%"
                    height={150}
                    dataFormat="json"
                />
            </div>
        )
    }

}