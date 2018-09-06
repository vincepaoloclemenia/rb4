class BranchRanking extends React.Component{
    constructor(props){
        super(props)
        this.state = { data: {}, fetching: false }
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/dashboards/get_branches_ranking.json",
            method: "GET",
            dataType: "JSON",
            success: (data) => {
                this.setState({
                    data: data,
                    fetching: false
                })
            }
        })
    }

    render(){
        return( 
            <div className='panel' id='branch-ranking-panel'>
                <div id="bar-chart-for-branches">
                    <ReactFC 
                        dataSource={this.state.data}
                        id="bar-chart-branches-ranking"
                        renderAt="bar-chart-for-branches"
                        type="bar2d"
                        width="100%"
                        height={500}
                        dataFormat="json"
                    />
                </div>
            </div>
        )
    }

}