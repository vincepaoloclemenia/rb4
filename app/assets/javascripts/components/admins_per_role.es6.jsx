class AdminsPerRole extends React.Component{
    constructor(props){
        super(props)
    }

    recognizeLength(){
        switch (this.props.admins.length){
            case 1:
                return 'col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xs-offset-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-4';
            case 2:
                return 'col-xs-12 col-sm-10 col-md-8 col-lg-6 col-xs-offset-0 col-sm-offset-1 col-md-offset-2 col-lg-offset-3';
            case 3:
                return 'col-xs-12 col-md-12 col-md-12 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-1';
            default:
                return 'col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1'; 
        }           
    }

    cardWidth(){
        switch (this.props.admins.length){
            case 1:
                return "col-xs-12 col-sm-10 col-md-10 col-lg-8 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 col-lg-offset-2";
            case 2:
                return "col-xs-6 col-sm-6 col-md-5 col-lg-5 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1";
            case 3:
                return "col-xs-4 col-sm-4 col-md-4 col-lg-4" 
            default:
                return "col-xs-6 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-0 col-lg-offset-0"; 
        }        
    }

    render(){
        if(this.props.status){
            return(                
                    <center><i className="fa fa-spinner fa-spin fa-2x fa-fw"></i></center>               
            )
        }
        return(
            <div className={this.recognizeLength()}>
                {this.props.admins.map((admin) => 
                    <div key={admin.id} className={this.cardWidth()}>
                        <div className="card" style={{backgroundColor: admin.color, color: 'white' }} >
                            <center><span dangerouslySetInnerHTML={{ __html: admin.avatar}} /></center>
                            <div className="card-container">
                                <center>        
                                    <h4>{admin.full_name}</h4> 
                                    <p style={{ color: 'white', fontSize: '13px' }}>{admin.obligation}</p>
                                    <p style={{ color: 'white', fontSize: '11px' }}>{admin.email}</p>
                                </center>
                                <center>
                                    <a className="btn btn-transparent btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Edit User" data-remote="true" href={`/company_users/${admin.id}/edit`}>
                                        <i className="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </a>
                                    <a className="btn btn-transparent btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href={`/company_users/${admin.id}`}>
                                        <i className="fa fa-trash" aria-hidden="true"></i>
                                    </a>
                                </center> 
                            </div>
                        </div>
                        <br/>
                    </div>
                )}                
            </div>
        )           
    }
    
}