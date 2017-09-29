class SettlementsEditModal extends React.Component{
    constructor(props){
        super(props)
        this.state = { token:'', saved: false}
    }

    componentDidMout(){
        this.setState({ token: $('meta[name=csrf-token]').attr('content')})
    }
    render(){
        if(!this.state.saved){
        return(
            <div className={`modal edit-settlement-${this.props.settlement.id}`} tabIndex="-1" role="dialog" aria-hidden="true">
                <div className="modal-dialog">
                    <div className="modal-content">
                        <div className="modal-header">
                            <button className="close" type="button" data-dismiss="modal" aria-hidden="true">
                                <i className="icon-maxicons1-exit"></i>
                            </button>
                            <h4 className="modal-title">Edit Settlement</h4>
                        </div>
                        <div className="modal-body">
                            <form className="edit_settlement" id="edit_settlement_2" acceptCharset="UTF-8" method="post">
                            
                                <input name="utf8" type="hidden" value="✓"/>
                                <input type="hidden" name="_method" value="patch"/>
                                <input name="authenticity_token" type="hidden" value={this.state.token} />
                                <div className="row mb10">
                                    <div className="col-xs-12">
                                        <label htmlFor="settlement_name">Name<small className="field-req"> *</small></label>
                                        <input ref="name" className="form-control" type="text" defaultValue={this.props.settlement.name} name="settlement[name]" id="settlement_name"/>
                                    </div>
                                </div>

                                <div className="row mb10">
                                    <div className="col-xs-12">
                                        <label htmlFor="settlement_description">Description</label>
                                        <textarea ref="description" className="form-control" defaultValue={this.props.settlement.description} rows="2" name="settlement[description]" id="settlement_description"></textarea>
                                    </div>
                                </div>

                                <div className="row mb10">
                                    <div className="col-xs-6"><label htmlFor="settlement_is_complimentary">Complimentary</label>
                                        <br/>
                                            <input name="settlement[is_complimentary]" type="hidden" defaultValue={this.props.settlement.is_complimentary.to_i}/>
                                            <div className="toggle btn btn-default off android" data-toggle="toggle" style={{width: 110, height: 0}}>
                                                <input ref="complimentary" data-off="No" data-offstyle="default" data-on="Yes" data-onstyle="success" data-style="android" data-toggle="toggle" type="checkbox" defaultValue={this.props.settlement.is_complimentary} name="settlement[is_complimentary]" id="settlement_is_complimentary"/>
                                                <div className="toggle-group">
                                                    <label className="btn btn-success toggle-on">Yes</label>
                                                    <label className="btn btn-default active toggle-off">No</label>
                                                    <span className="toggle-handle btn btn-default"></span>
                                                </div>
                                            </div>
                                        <br/>
                                    </div>

                                    <div className="col-xs-6">
                                        <label htmlFor="settlement_is_active">Status</label>
                                            <br/>
                                                <input name="settlement[is_active]" type="hidden" defaultValue={this.props.settlement.is_active}/>
                                                <div className="toggle btn btn-default off android" data-toggle="toggle" style={{width: 110, height: 0}}>
                                                    <input ref="active" data-off="Deactivated" data-offstyle="default" data-on="Active" data-onstyle="success" data-style="android" data-toggle="toggle" type="checkbox" defaultValue={this.props.settlement.is_active} name="settlement[is_active]" id="settlement_is_active"/>
                                                    <div className="toggle-group">
                                                        <label className="btn btn-success toggle-on">Active</label>
                                                        <label className="btn btn-default active toggle-off">Deactivated</label>
                                                        <span className="toggle-handle btn btn-default"></span>
                                                    </div>
                                                </div>
                                            <br/>
                                        
                                    </div>
                                    
                                    <div className="row mb10">
                                        <div className="col-xs-12 mt20">
                                            (<small className="field-req"> *</small> )<i> indicates field is required</i></div>
                                        </div>
                                        <div className="modal-footer no-border">
                                            <span className="inline float-right"><a className="btn btn-default" data-dismiss="modal" href="#">Cancel</a>
                                                <button className="btn btn-primary" type="submit" onSubmit={() => this.editSettlement()}>Save Changes</button>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
        ) } else
        {
            return
        }
    }

    editSettlement(){
        var name = this.refs.name.value
        var description = this.refs.description.value
        var complimentary = this.refs.complimentary.value
        var active = this.refs.active.value

        $.ajax({
            url: `/api/settlements/${this.props.settlement.id}`,
            method: 'PUT',
            data: { settlement: { name: name, 
                                description: description, 
                                is_complimentary: complimentary,
                                is_active, active}},
            dataType: 'JSON',
            success: (res) => {
                this.setState({ saved: true })
            }
        })
    }
}