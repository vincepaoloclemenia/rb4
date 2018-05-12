class ItemAndCostAnalysis extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            fetching: false,
            display: 'week',
            purchasesLastWeek: [],
            purchaseLastMonth: [],
            purchases: [],
            branches: [],
            lwRange: '',
            tmRange: '',
            lastWeekTotal: '',
            lastMonthTotal: '',
            overAll: '',
        }
    }

    searchPurchases(){
        if(this.state.branches.length > 0 || $("#q_date_range").val() !== '' ){
            this.setState({ fetching: true })
            $.ajax({
                url: '/api/item_and_costs/filtered_records.json',
                method: 'GET',
                data: {
                    date: $("#q_date_range").val() === '' ? [] : $("#q_date_range").val().split(" - "),
                    branches: this.state.branch.map( x => x.value )
                },
                success: (data) => {
                    this.setState({
                        fetching: false,
                        purchases: data.purchases,
                        overAll: data.overall,
                        display: ''
                    })
                }
            })
        }
    }

    componentDidMount(){
        $('.drp').daterangepicker({
            
        });
        this.fetchDefaultData()
    }

    render(){
        return(      
            <div className='panel'>
                <div className='panel-heading border pb45'>
                    <div className='pull-left mt7'>ITEM COST ANALYSIS REPORT</div>
                    <div className='pull-right'>
                    </div>
                </div>
                <div className='panel-body'>
                    <div className='row pb20'>
                        <div className='col-xs-6'>
                            <Select.Creatable
                                multi={true}
                                name='supplier_names'
                                optionClassName='form-control'
                                options={this.state.branches}
                                placeholder='Select Branches'
                                onChange={ value => this.setState({ branch: value }) }
                                value={this.state.branch}               
                            /> 
                        </div>
                        <div className='col-xs-6'>
                            <div className='pull-right'>
                                <i onClick={this.searchPurchases.bind(this)} id='search' className='fa fa-search fa-sm' aria-hidden='true'></i>
                            </div>
                            <div className='pull-right'>
                                <input className="form-control drp" placeholder="Custom Search" type="text" id="q_date_range"/>     
                            </div>
                        </div>
                    </div>
                    
                    <div className='tab'>
                        <button type='button' onClick={() => this.setState({ display: 'week', purchases: [] })} className={this.state.display === 'week' ? 'tablinks active' : 'tablinks'}>This Week's ({this.state.lwRange})</button>
                        <button type='button' onClick={() => this.setState({ display: 'month', purchases: [] })} className={this.state.display === 'month' ? 'tablinks active' : 'tablinks'}>This Month's ({this.state.tmRange})</button>                               
                    </div>
                    
                    
                    <div className='no-more-tables'>
                        <table className='table table-bordered table-striped mb0'>
                            <thead>
                                <tr className='bg-thead'>
                                    <th colSpan='4'></th>
                                    <th colSpan='3' className='ica-primary-thead'>Beginning Inventory</th>
                                    <th colSpan='4' className='ica-primary-thead'>Total Purchases</th>
                                    <th colSpan='3' className='ica-primary-thead'>Ending Inventory</th>  
                                    <th colSpan='4' className='ica-primary-thead'>Cost of Goods Sold</th>  
                                </tr>
                                <tr className='bg-thead'>
                                    <th styles={{ width: '50px'}}>Category</th>
                                    <th width='100'>Sub Category</th>
                                    <th width='100'>Name</th>
                                    <th width='100'>Unit</th>
                                    <th width='90'>Qty</th>
                                    <th width='100'>Cost</th>   
                                    <th width='100'>Amount</th>
                                    <th width='90'>Qty</th>
                                    <th width='100'>Cost</th>
                                    <th width='100'>Amount</th>
                                    <th width='90'>%</th>
                                    <th width='90'>Qty</th>
                                    <th width='100'>Cost</th>   
                                    <th width='100'>Total</th>
                                    <th width='90'>Qty</th>
                                    <th width='100'>Cost</th>
                                    <th width='100'>Amount</th>
                                    <th width='90'>%</th>
                                </tr>
                            </thead>
                            {this.renderData()}
                        </table>
                        {this.renderSpinner()}
                    </div>
                </div>
            </div>     
        )
    }

    renderSpinner(){
        if(this.state.fetching){
            return(
                <div className='row pt20'>
                    <center><p><i className="fa fa-spinner fa-spin fa-2x fa-fw"></i></p></center>
                </div>
            )
        }
    }
    renderData(){
        if(this.state.fetching){ return }
        else{
            if(this.state.purchases.length === 0){
                if(this.state.display === 'week'){
                    return(
                        <tbody >
                            { this.state.purchasesLastWeek.map((purchase, index) => 
                                [
                                    <tr key={index}><td className='category' colSpan='1'>{purchase.parent_category}</td>
                                        <td className='category' colSpan='17'></td>
                                    </tr>,
                                    purchase.purchases.map((pur, i) => 
                                        [ 
                                            <tr key={i}>
                                                <td className='subcategory' colSpan='1'></td>
                                                <td className='subcategory' colSpan='1'>{pur.subcategory}</td>
                                                <td className='subcategory' colSpan='16'></td>
                                            </tr>,
                                            pur.purchase_items.map((purchase_item, item) =>       
                                                
                                                <tr key={item}>
                                                    <td></td>
                                                    <td></td>
                                                    <td>{purchase_item.item_name}</td>
                                                    <td>{purchase_item.unit}</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>{purchase_item.quantity}</td>
                                                    <td>{purchase_item.purchase_item_amount}</td>
                                                    <td>{purchase_item.item_total_net}</td>
                                                </tr>
                                            ),                                    
                                            <tr key={i+1} className='bg-total'>
                                                <td className='subcategory' colSpan="9">Total Per Sub Category: </td>
                                                <td className='label-total-num subcategory' colSpan="1">{pur.total_amount_per_category}</td>
                                                <td className='subcategory' colSpan="8"></td>
                                            </tr> 
                                        ]
                                    ),
                                    <tr key={index+1} className='bg-total'>
                                        <td className='category' colSpan="9">Total Amount Per Category</td>
                                        <td className='label-total-num category' colSpan="1">{purchase.total_amount_within_month}</td>
                                        <td className='category' colSpan="8"></td>
                                    </tr>   
                                ]
                            )}
                            <tr className='bg-total'>
                                <td className='total-overall' colSpan="9">Total</td>
                                <td className='label-total-num total-overall' colSpan="1">{this.state.lastWeekTotal}</td>
                                <td className='total-overall' colSpan="8"></td>
                            </tr>   
                        </tbody>
                    )
                }
                return(
                    <tbody >
                        { this.state.purchaseLastMonth.map((purchase, index) => 
                            [
                                <tr key={index}><td className='category' colSpan='1'>{purchase.parent_category}</td>
                                    <td className='category' colSpan='17'></td>
                                </tr>,
                                purchase.purchases.map((pur, i) => 
                                    [ 
                                        <tr key={i}>
                                            <td className='subcategory' colSpan='1'></td>
                                            <td className='subcategory' colSpan='1'>{pur.subcategory}</td>
                                            <td className='subcategory' colSpan='16'></td>
                                        </tr>,
                                        pur.purchase_items.map((purchase_item, item) =>       
                                            
                                            <tr key={item}>
                                                <td></td>
                                                <td></td>
                                                <td>{purchase_item.item_name}</td>
                                                <td>{purchase_item.unit}</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>{purchase_item.quantity}</td>
                                                <td>{purchase_item.purchase_item_amount}</td>
                                                <td>{purchase_item.item_total_net}</td>
                                            </tr>
                                        ),                                    
                                        <tr key={i+1} className='bg-total'>
                                            <td className='subcategory' colSpan="9">Total Per Sub Category: </td>
                                            <td className='label-total-num subcategory' colSpan="1">{pur.total_amount_per_category}</td>
                                            <td className='subcategory' colSpan="8"></td>
                                        </tr> 
                                    ]
                                ),
                                <tr key={index+1} className='bg-total'>
                                    <td className='category' colSpan="9">Total Amount Per Category</td>
                                    <td className='label-total-num category' colSpan="1">{purchase.total_amount_within_month}</td>
                                    <td className='category' colSpan="8"></td>
                                </tr>   
                            ]
                        )}
                        <tr className='bg-total'>
                            <td className='total-overall' colSpan="9">Total</td>
                            <td className='label-total-num total-overall' colSpan="1">{this.state.lastMonthTotal}</td>
                            <td className='total-overall' colSpan="8"></td>
                        </tr>   
                    </tbody>

                )
            }else{
                return(
                    <tbody >
                        { this.state.purchases.map((purchase, index) => 
                            [
                                <tr key={index}><td className='category' colSpan='1'>{purchase.parent_category}</td>
                                    <td className='category' colSpan='17'></td>
                                </tr>,
                                purchase.purchases.map((pur, i) => 
                                    [ 
                                        <tr key={i}>
                                            <td className='subcategory' colSpan='1'></td>
                                            <td className='subcategory' colSpan='1'>{pur.subcategory}</td>
                                            <td className='subcategory' colSpan='16'></td>
                                        </tr>,
                                        pur.purchase_items.map((purchase_item, item) =>       
                                            
                                            <tr key={item}>
                                                <td></td>
                                                <td></td>
                                                <td>{purchase_item.item_name}</td>
                                                <td>{purchase_item.unit}</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>{purchase_item.quantity}</td>
                                                <td>{purchase_item.purchase_item_amount}</td>
                                                <td>{purchase_item.item_total_net}</td>
                                            </tr>
                                        ),                                    
                                        <tr key={i+1} className='bg-total'>
                                            <td className='subcategory' colSpan="9">Total Per Sub Category: </td>
                                            <td className='label-total-num subcategory' colSpan="1">{pur.total_amount_per_category}</td>
                                            <td className='subcategory' colSpan="8"></td>
                                        </tr> 
                                    ]
                                ),
                                <tr key={index+1} className='bg-total'>
                                    <td className='category' colSpan="9">Total Amount Per Category</td>
                                    <td className='label-total-num category' colSpan="1">{purchase.total_amount_within_month}</td>
                                    <td className='category' colSpan="8"></td>
                                </tr>   
                            ]
                        )}
                        <tr className='bg-total'>
                            <td className='total-overall' colSpan="9">Total</td>
                            <td className='label-total-num total-overall' colSpan="1">{this.state.overAll}</td>
                            <td className='total-overall' colSpan="8"></td>
                        </tr>   
                    </tbody>
                )
            }
        }
    }

    fetchDefaultData(){
        this.setState({ fetching: true })
        $.ajax({
            url: `/api/item_and_costs.json`,
            method: 'GET',
            success: (data) => {
                this.setState({ 
                    fetching: false, 
                    purchaseLastMonth: data.purchase_items_within_month, 
                    purchasesLastWeek: data.purchase_items_last_week,
                    lwRange: data.last_week_range,
                    tmRange: data.this_month_range,
                    lastMonthTotal: data.last_month_total,
                    lastWeekTotal: data.last_week_total,
                    branches: data.branches
                })
            }
        })
    }
}