class SaveButton extends React.Component{
    constructor(props){
        super(props)
        this.state = { status: 'Save Report', show: false,  sale_report: null, title: '' }
    }

    render(){
        return(
            <div className="button-container">
                <button className="btn btn-default" id="reset" onClick={this.resetAll.bind(this)} data-tt="tooltip" data-original-title="Reset">
                    Reset
                </button>
                <span className="gap05"></span>
                {this.renderButton()}
                {this.renderSaleReportLink()}
            </div>       
        )
    }

    renderButton(){
        if (this.state.status === 'Saving' || this.state.status === 'Saved'){
            return(
                <button disabled='true' id='save-report' onClick={this.saveReport.bind(this)} className='btn btn-primary'>
                    {this.renderLabel()}<span className='gap05'></span>
                    {this.renderIcon()}
                </button>
            )
        }
        return(
            <button id='save-report' onClick={this.saveReport.bind(this)} className='btn btn-primary'>
                {this.renderLabel()}<span className='gap05'></span>
                {this.renderIcon()}
            </button>
        )
    }
    
    saveReport(event){
        var date_from = document.getElementById('from').value;
        var date_to = document.getElementById('to').value;
        this.setState({ status: 'Saving', show: true })
        $.ajax({
            url: '/api/sale_reports?from='+date_from+'&to='+date_to,
            method: 'POST',
            success: (data) =>{
                this.setState({
                    status: 'Saved',
                    show: false,
                    sale_report: data.saleReport, 
                    title: data.title
                })
            }
        })
        $('#from').hide();
        $('#to').hide();
    }

    resetAll(evt){
        evt.stopPropagation();
        evt.preventDefault();
        $('#sales-chart').addClass('blurry');
        $.ajax({
            url: '/charts/get_average',
            method: 'GET',
            success: (data) => {
            new Chartkick.LineChart("sales-chart", "/charts/daily_sales", {"colors": Array.from(data.colours) ,"min":100,"max":100000});  
            $.each(data.branches, function(i, branch){
                    $('td#'+branch.reverse).text(branch.average)
                    if(branch.status === "Good"){
                        $('td#'+branch.reverse).addClass("fine");
                        $('td#'+branch.reverse).removeClass("fail");
                    }else if(branch.status === "Unwell"){
                        $('td#'+branch.reverse).addClass("fail");
                        $('td#'+branch.reverse).removeClass("fine");
                    }else{
                        $('td#'+branch.reverse).removeClass("fine");
                        $('td#'+branch.reverse).removeClass("fail");
                    }
                })
            }
        })
        $.ajax({
            url: 'charts/get_dates',
            method: 'GET',
            success: (data) => {
                $('#sales-label').text(data.title)
                $('#sales-chart').removeClass('blurry');
                $('#save-report').hide()             
                $('#average-per-date').text('Average Sales Per Date Range (Current Week)')    
                $('#to').val('');
                $('#from').val('');
                $('#reset').hide(); 
            }
        })
        this.setState({
            status: 'Save Report',
            sale_report: null
        })
        $('#from').show();
        $('#to').show();
    }

    renderSaleReportLink(){
        if(this.state.sale_report === null || this.state.status === 'Save Report') { return }
        return(
            <p className='sale-report show-link' >{this.state.sale_report ? <SaleReportLink saleReport={this.state.sale_report}/>: `No existing Sales for ${this.state.title}`}</p>
        )
    }

    renderIcon(){
        return(
            <i className={`fa ${this.state.show ? 'fa-spinner fa-spin fa-1x fa-fw' : ''}`}></i>
        )
    }
    renderLabel(){
        switch (this.state.status){
            case 'Save Report':
                return 'Get Report';
            case 'Saving':
                return 'Retrieving Information';
            case 'Saved':
                return this.state.sale_report ? 'Report is Ready' : 'No Record Found'
        }
    }

}