var SalesChart = {
    init: function(){ 

    $('#from').datepicker({}).on('change', function(){
        if($(this).val() === '' || $(this).val() > $('#to').val())
            {   $('#to').val('')    }
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

    $('#to').datepicker({}).on('change',function(){

        if($(this).val() === '' || $('#from').val() === '' || $(this).val() < $('#from').val())
            { 
                alert("Please make sure your 'From' field has value and less than the other.")
                $(this).val('');
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

    $('#reset').on('click',function(){             
        $('#average-per-date').text('Average Sales Per Date Range (Current Week)')
        $('#reset').hide();
        $('#to').val('');
        $('#from').val(''); 
        $('#sales-chart').addClass('blurry');
        $.ajax({
            url: '/charts/get_average',
            method: 'GET',
            success: function(data) {
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
            success: function(data) {
                $('#sales-label').text(data.title)
                $('#sales-chart').removeClass('blurry');
            }
        })
    })
    }
}

$(document).ready(SalesChart.init)
$(document).on('turbolinks:load', SalesChart.init)
    