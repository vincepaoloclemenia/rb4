class AdminsContainer extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            companyUsers: []
        }
    }

    componentWillMount(){
        this.fetchCompanyUsers()
    }

    render(){
        return(
            this.state.companyUsers.map((user, index) => 
                <div key={index} className='panel'>
                    <div className='panel-heading border pb15'>{user.role_name}</div>
                    <div className='panel-body'>
                        <div className='row'>
                            <div className='col-md-12'>
                                <AdminsPerRole status={this.state.fetching} users={user.users} />
                            </div>
                        </div>
                    </div>
                </div>
            )           
        )
    }

    renderCompanyAdmins(){
        return(
            <div className="row mb5">
                <center><h3>Company Administrators</h3></center>
                <br/>
                <AdminsPerRole status={this.state.fetching} admins={this.state.companyAdmins} />
            </div>
        )
    }

    renderBrandAdmins(){      
        return(
            <div className="row mb5">
                <center><h3>Brand Administrators</h3></center>
                <br/> 
                <AdminsPerRole status={this.state.fetching} admins={this.state.brandAdmins} />
            </div> 
        )              
    }

    renderBranchAdmins(){
        return(
            <div className="row mb5">
                <center><h3>Branch Administrators</h3></center>
                <br/> 
                <AdminsPerRole status={this.state.fetching} admins={this.state.branchAdmins} />
            </div> 
        )    
    }

    fetchCompanyUsers(){
        this.setState({ fetching: true })
        $.ajax({
            url: '/api/users.json',
            method: 'GET',
            success: (data) => {
                this.setState({
                   fetching: false,
                   companyUsers: data.company_users
                })
            }
        })
    }
}