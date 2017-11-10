var SalesChart = {
    init: function(){ 
    
    $('#from').val() === '' || $('#to').val() === '' ? $('#save-report').hide() : $('#save-report').show()

    $('#from').datepicker({}).on('change', function(evt){
        evt.stopPropagation();
        evt.preventDefault();
        if($(this).val() === '' || $(this).val() > $('#to').val())
            {   
                $('#to').val('');
                $('#save-report').hide();
                $('#reset').hide()     
            }
        else {
                dfrom = $(this).val();
                dto = $('#to').val();
                $('#sales-chart').addClass('blurry');           
                $.ajax({
                    url: '/charts/get_dates?from='+dfrom+'&to='+dto,
                    method: 'GET',
                    success: function(data) {
                        $('#sales-label').text(data.label);
                        $('#average-per-date').text(data.title);                     
                        $('#reset').show();
                        $('#save-report').show(); 
                    }
                });

                $.ajax({
                    url: '/charts/get_average?from='+dfrom+'&to='+dto,
                    method: 'GET',
                    success: function(data) {
                    new Chartkick.LineChart("sales-chart", "/charts/daily_sales?from="+dfrom+'&to='+dto, {"colors": Array.from(data.colours) ,"min":100,"max":100000});
                    $('#sales-chart').removeClass('blurry');
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
        }
    });

    $('#to').datepicker({}).on('change',function(evt){
        evt.stopPropagation();
        evt.preventDefault();
        if($(this).val() === '' || $('#from').val() === '' || $(this).val() < $('#from').val())
            { 
                alert("Please make sure your 'From' field has value and less than the other.")
                $(this).val('');
                $('#save-report').hide()
            }
        else {    
            dfrom = $('#from').val();
            dto = $(this).val();
            name = $('.branch').text()
            $('.centered').addClass('show');
            $('#sales-chart').addClass('blurry');                                              
            $.ajax({
                url: '/charts/get_dates?from='+dfrom+'&to='+dto,
                method: 'GET',
                success: function(data) {
                    $('#sales-label').text(data.label);
                    $('#average-per-date').text(data.title);                     
                    $('#reset').show(); 
                    $('#save-report').show();
                }
            });
            
            $.ajax({
                url: '/charts/get_average?from='+dfrom+'&to='+dto,
                method: 'GET',
                success: function(data) {
                new Chartkick.LineChart("sales-chart", "/charts/daily_sales?from="+dfrom+'&to='+dto, {"colors": Array.from(data.colours) ,"min":100,"max":100000});
                $.each(data.branches, function(i, branch){
                    $('.centered').removeClass('show');
                    $('#sales-chart').removeClass('blurry');   
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
        }        
        
    });

    
    }
}

$(document).ready(SalesChart.init)
$(document).on('turbolinks:load', SalesChart.init)
    