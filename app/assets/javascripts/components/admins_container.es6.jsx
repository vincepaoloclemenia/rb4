class AdminsContainer extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            companyAdmins: [],
            branchAdmins: [],
            brandAdmins: []
        }
    }

    componentWillMount(){
        this.fetchCompanyUsers()
    }

    render(){
        return(
            <div className="admins-container">

                {this.renderCompanyAdmins()}
                <br/>
                
                {this.renderBrandAdmins()}            
                <br/>
                                
                {this.renderBranchAdmins()}
                <br/>

            </div>
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
            dataType: 'JSON',
            success: (data) => {
                this.setState({
                   fetching: false,
                   companyAdmins: data.company_admins,
                   branchAdmins: data.branch_admins,
                   brandAdmins: data.brand_admins 
                })
            }
        })
    }
}