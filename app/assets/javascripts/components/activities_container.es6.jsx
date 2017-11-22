class ActivitiesContainer extends React.Component{
    constructor(props){
        super(props)
        this.state= { recentActivities: [], nextPage: null, fetchingData: false }
    }

    componentWillMount(){
        this.fetchActivities()
    }

    render(){
        return(
            <div className="activities-container">
                {this.listOfActivities()}
            </div>
        )
    }

    listOfActivities(){
        if(this.state.fetchingData){
            return(
                <div className="fetching-activities">
                    <i className="fa fa-spinner fa-spin fa-2x fa-fw"></i>
                </div>
            )
        }
        return(
            <ul className="activities-list" 
                ref={ (ref) => {this.activitysListRef = ref} } 
                onScroll={() => this.handleScroll()} >
                {this.renderActivityItem()}
                {this.loadMoreButton()}
            </ul>
        )
    }

    fetchActivities(){
        this.setState({ fetchingData: true })
        $.ajax({
            url: 'api/activities.json',
            method: 'GET',
            dataType: 'JSON',
            success: (data) => {
                this.setState({
                    recentActivities: data.activities,
                    nextPage: data.next_page,
                    fetchingData: false
                })
            }
        })
    }

    handleScroll() {
        let scrollHeight = $(this.activitysListRef)[0].scrollHeight;
        const OFFSET = 50;
        let scrollTop = $(this.activitysListRef).scrollTop();
        if (scrollHeight - (scrollTop + OFFSET) < $(this.activitysListRef).innerHeight()) {
          this.handleLoadMore();
        }
    }

    handleLoadMore() {
        if (this.fetching || !this.state.nextPage) { return; }
        this.fetching = true;
        $.ajax({
            url: `/api/activities.json/?page=${this.state.nextPage}`,
            method: 'GET',
            dataType: 'json',
            success: (data) => {
                this.fetching = false;
                this.setState({
                nextPage: data.next_page,
                recentActivities: [ ...this.state.recentActivities, ...data.activities ]
                });
            }
        });
    }

    loadMoreButton() {
        if (this.state.nextPage === null) {
            return;
        }
        return (
            <li className="load-more">
                <a onMouseOver={() => this.handleLoadMore()}>
                    <i className="fa fa-spinner fa-spin"></i>
                </a>
            </li>
        );
    }

    renderActivityItem(){
        if(!this.state.recentActivities.length){
            return(
                <div>
                    <p>Nothing happened yet</p>
                    <i className="fa fa-pencil-square-o" aria-hidden="true"></i>
                </div>
            )
        }
        return this.state.recentActivities.map(activity => {
            return (<ActivityItem key={activity.id} {...activity} />);
        });
    }
}