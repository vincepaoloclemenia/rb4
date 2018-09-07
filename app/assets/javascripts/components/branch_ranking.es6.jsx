class BranchRanking extends React.Component{
    constructor(props){
        super(props)
        this.state = { data: {}, fetching: false }
    }
    getHeight(height){
        if( height <= 5 ){ 
            return  400; 
        }
        else if(height <= 10 ){
            return 550;
        }
        else if (height <= 15 ) {
            return  700;
        }
        else if( height <= 20 ){
            return 850;
        }
        else if( height <= 25 ){
            return 1000; 
        }
        else if( height <= 30 ){
            return 1150; 
        }
        else if( height <= 35 ){
            return 1300; 
        }
        else{ return 1450; }
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