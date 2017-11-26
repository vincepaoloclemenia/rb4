
class ActivityItem extends React.Component{
    constructor(props){
        super(props)
    }

    

    render(){
        var borderStyles = { borderLeft: `5px solid ${this.props.color}` }
        return(
            <div className='activit-item'>
                <li
                    className='activity-item-link'
                    style={borderStyles}
                    onClick={() => this.handleMarkAsRead()}>
                    <a href={this.props.url}>
                        <span dangerouslySetInnerHTML={{ __html: this.props.avatar}} />
                        <div className="activity-metadata">
                            {this.activityContent()}
                            <br/>
                            <small>{this.activityIcon()} {this.props.time_ago}</small>
                        </div>
                    </a>
                </li>
            </div>
        )
    }

    activityContent() {
        const { doer, action, type } = this.props;
        switch (type) {
            case 'sale':
                return ` ${doer} ${action}`;
        }
    }

    activityIcon() {
        switch(this.props.type) {
            case 'sale':
                return <i className="fa fa-usd"></i>;
        }
    }


}