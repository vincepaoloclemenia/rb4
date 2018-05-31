class Items extends React.Component{
    constructor(props){
        super(props)
        this.state = { 
            fetching: false,
            items: [],
            brandItems: [],
            nextPage: null
        }
    }

    componentDidMount(){
        this.setState({ fetching: true })
        $.ajax({
            url: `/api/items.json`,
            method: 'GET',
            success: (data) => {
                this.setState({ fetching: false, items: data.items, nextPage: data.next_page, brandItems: data.brand_items })
            }
        })
    }

    searchForItem(value){
        this.setState({ item: value, fetching: true }) 
        if(value){
            $.ajax({
                url: `/api/items.json?item=${value.input}`,
                method: 'GET',
                success: (data) => {
                    this.setState({ fetching: false, items: data.items, nextPage: data.next_page })
                }
            })
        }
        else{
            $.ajax({
                url: `/api/items.json`,
                method: 'GET',
                success: (data) => {
                    this.setState({ fetching: false, items: data.items, nextPage: data.next_page })
                }
            })
        }
    }

    handleNextPurchases(){
        this.setState({fetching: true})
        $.ajax({
            url: `/api/items.json?page=${this.state.nextPage}`,
            method: 'GET',
            success: (data) => {
                this.setState({ items: [...this.state.items, ...data.items] , fetching: false, nextPage: data.next_page})
            }
        })
    }


    render(){
        return(
            <div className='panel-body'>
                <div className='row mb15'>
                    <div className='col-md-offset-8 col-md-4'>        
                        <label htmlFor='items'>Search Item</label>         
                        <Select.Creatable
                            multi={false}
                            name='items'
                            optionClassName='form-control'
                            options={this.state.brandItems}
                            onChange={ this.searchForItem.bind(this) }
                            value={this.state.item} 
                        />                 
                    </div>
                </div>
                <div className='no-more-tables'>
                    <table className='table table-bordered table-striped mb0'>
                        <thead>
                            {this.renderHeader()}
                        </thead>
                        <tbody style={{ fontSize: '13px' }}>
                            {this.renderTableData(this.state.items)}
                        </tbody>
                    </table>
                    <ul>
                        <li><center>{this.renderButton()}</center></li>
                    </ul>
                </div>  
            </div>
        )
    }

    renderButton(){
        if(this.state.fetching){
            return(
                <i className="fa fa-spinner fa-spin fa-lg fa-fw"></i>
            )
        }
        if(this.state.items.length === 0){
            return(
                <p className='text-center mt5'>No Records Found</p>
            )
        }
        if(!this.state.nextPage){ return }
        return(          
            <a className='view-more' onClick={this.handleNextPurchases.bind(this)}>See more..</a>              
        )
        
    }

    renderHeader(){
        return(
            <tr className="bg-thead">
                <th data-sortable="false" width="130">Item</th>
                <th data-sortable="false" width="130">Category</th>
                <th width="120">Unit</th>
                <th width="160">Type</th>
                <th width="160">Track as Sales</th>
                <th width="160">Status</th>                   
                <th width="120" data-sortable="false">Action</th>       
            </tr>
        )
    }

    renderTableData(items){
        if(items.length === 0){ return }
        return(
            items.map((item, index) => 
                <tr key={index}>    
                    <td data-title='Invoice No.'>{item.name}</td>
                    <td data-title='Date'>{item.category}</td>
                    <td data-title='Branch'>{item.unit}</td>
                    <td data-title='Supplier.'>{item.item_type}</td>
                    <td data-title='Net Amount'>{item.track_as_sales}</td>
                    <td data-title='Vat Amount'>{item.active ? <span className='label label-success ml2'>Active</span> : <span className='label label-default ml2'>Deactivated</span>}</td>
                    <td className='action' data-title='Action'>
                        <a className="btn btn-default btn-xs mb10 mr2" data-tt="tooltip" data-placement="top" data-original-title="Edit" data-remote="true" href={`/items/${item.id}/edit`}><i className="icon-glyph f14"></i></a>
                        <a className="btn btn-default btn-xs mb10 swal-warning-confirm" data-tt="tooltip" data-placement="top" data-original-title="Delete" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href={`/items/${item.id}`}><i className="icon-glyph-76 f14"></i></a>
                    </td>
                </tr>
            )
        )  
    }
}