class SettlementsContainer extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
            <div className="panel panel-primary">
                <div className="panel-heading border pb45">
                    <div className="pull-left mt7">Settlements</div>
                        <div className="pull-right">
                            <a 
                                href="#"
                                className="btn btn-default btn-round btn-outline"
                                data-toggle="modal"
                                data-target=".create-settlement-modal">
                                <i className='icon-maxicons2-paste mr5'></i> Add Settlement
                            </a>
                        </div>
                </div>
                <div className="panel-body">
                    <SettlementsTable />
                </div>
            </div>
        )
    }
}