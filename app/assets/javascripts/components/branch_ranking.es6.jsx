class BranchRanking extends React.Component{
    constructor(props){
        super(props)
        this.state = { data: {}, fetching: false }
    }


    getHeight(height){
        return height <= 5 ? 400 : height <= 10 ? 550 : height <= 15 ? 700 : height <= 20 ? 850 : height <= 25 ? 1000 
        : height <= 30 ? 1150 : height <= 35 ? 1300 : 1450
    }

    componentDidMount(){
      $('#branch-ranking-panel').on('mouseenter', function(){
        $(this).css('overflow-y', 'auto');
      })
      $('#branch-ranking-panel').on('mouseleave', function(){
          $(this).css('overflow-y', 'hidden');
      }) 
        this.setState({ fetching: true })
        $.ajax({
            url: "/api/dashboards/get_branches_ranking.json",
            method: "GET",
            dataType: "JSON",
            success: (data) => {
                this.setState({
                    data: data,
                    fetching: false,
                })
            }
        })
    }

    render(){
        return( 
            <div className='panel' id='branch-ranking-panel'>
                <div className='panel-body'>
                  <div id="bar-chart-for-branches">
                      <ReactFC 
                          dataSource={this.state.data}
                          id="bar-chart-branches-ranking"
                          renderAt="bar-chart-for-branches"
                          type="bar2d"
                          width="100%"
                          height={this.getHeight(this.props.count)}
                          dataFormat="json"
                      />
                  </div>
                </div>
            </div>
        )
    }

}