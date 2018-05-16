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
            branch: [],
            lwRange: '',
            tmRange: '',
            lastWeekTotal: '',
            lastMonthTotal: '',
            overAll: '',
        }
    }

    render(){
        return(
            <div></div>
        )
    }
}