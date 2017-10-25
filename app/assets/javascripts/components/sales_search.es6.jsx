class SalesSearch extends React.Component{
    constructor(props){
        super(props)
    }

    render(){
        return(
            <div className="pull-right">
                <form action="/sales" acceptCharset="UTF-8" method="get">
                    <input name="utf8" type="hidden" value="✓"/>
                        <input 
                            className="form-control drp" 
                            data-provide="datepicker" 
                            id="search-date" 
                            name="search" 
                            placeholder="Search Sales"
                            onChange={(date) => this.getSales(date)}
                        />
                </form>
            </div>
        )
    }

    getSales(date){
        $.ajax({
            url: '/charts/daily_sales',
            method: 'GET',
            data: { search: date },
            success: console.log("success")
        })
    }
}