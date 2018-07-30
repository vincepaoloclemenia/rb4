class AdminsPerRole extends React.Component{
    constructor(props){
        super(props)
    }
    render(){
        if(this.props.status){
            return(                
                    <center><i className="fa fa-spinner fa-spin fa-2x fa-fw"></i></center>               
            )
        }
        return(
            this.props.users.map((user, index)  => 
                <div style={{ borderLeft: `3px solid ${user.color}`, backgroundColor: "#F1EEEE", borderRight: "15px solid white" }} key={index} className='col-xs-12 col-sm-6 col-lg-4 mb10'>
                    <div className='col-lg-3 col-xs-3' style={{ marginTop: "20px" }}>
                        <div className='row'>
                            <span dangerouslySetInnerHTML={{ __html: user.avatar}} /> 
                        </div>
                    </div>
                    <div className='col-lg-9 col-xs-9 mt5' >
                        <div className='row'>
                            <div className="col-lg-12">
                                <h4>{user.full_name}  <span style={{ float: "right", fontSize: "10px" }}>{user.last_sign_in}</span></h4>
                               
                            </div>
                        </div>
                        <div className='row'>
                            <div className="col-xs-12">
                                <ul className='user-credentials'>
                                    {this.renderBranch(user)}
                                    <li><i className="fa fa-address-card-o mr5" aria-hidden="true"></i>{user.email}</li>
                                    <li>
                                        <a className="btn btn-link btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Edit User" data-remote="true" href={`/company_users/${user.id}/edit`}>
                                            <i className="fa fa-pencil-square-o mr5" aria-hidden="true"></i> Edit Details
                                        </a>
                                        <span className='gap3'></span>
                                        <a className="btn btn-link red btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href={`/company_users/${user.id}`}>
                                            <i className="fa fa-trash mr5" aria-hidden="true"></i> Remove User
                                        </a>
                                    </li>
                                </ul>       
                            </div>
                        </div>   
                    </div>
                </div>
            )
        )           
    }

    renderBranch(user){
        if(user.obligation !== ''){
            return (
                <li><i className="fa fa-building mr5" aria-hidden="true"></i> {user.obligation}</li>
            )
        }
    }
    
}