var SalesChart = {
    init: function(){ 
        $('.activities-container').on('mouseenter', function(){
            $('.activities-list').css('overflow-y', 'auto');
        })
        $('.activities-container').on('mouseleave', function(){
            $('.activities-list').css('overflow-y', 'hidden');
        })    
    }
}

$(document).ready(SalesChart.init)
$(document).on('turbolinks:load', SalesChart.init)
    