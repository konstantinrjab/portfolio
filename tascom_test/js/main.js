$(function () {
    if ($('#charts-container').length) {
        createChart(10, 'JUR', '2017-07-01', 'Открытие/закрытие клентов Юр.лиц по дням');
        createChart(10, 'FLP', '2017-07-01', 'Открытие/закрытие клентов Предпренимателей по дням');
    }
});

function build() {
    let days_count = $('#days_count').val();
    let date = $('#date').val();
    console.log(date);
    if (days_count > 100) {
        $('#days_count').val('100');
        alert('Думаю ста вам будет достаточно)');
        days_count = 100;
    }
    $('#charts-container').empty();
    createChart(days_count, 'JUR', date, 'Открытие/закрытие клентов Юр.лиц по дням');
    createChart(days_count, 'FLP', date, 'Открытие/закрытие клентов Предпренимателей по дням');
}

function createChart(days_count, forma, start_date, title) {
    //create element
    $('#charts-container').append('<div id="hightcharts-' + forma + '" style="min-width: 310px; height: 400px; margin: 0 auto"></div>');
    //get values
    $.ajax({
        url: 'backend/query.php',
        type: 'POST',
        dataType: 'json',
        data: {
            'start_date': start_date,
            'forma': forma,
            'days_count': days_count,
        },
        success: function (result) {
            //display values
            let chart = Highcharts.chart('hightcharts-' + forma, {
                chart: {
                    type: 'column'
                },
                title: {
                    text: title
                },
                xAxis: {
                    categories: result['categories']
                },
                yAxis: {
                    title: {
                        text: 'Количество клиентов'
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                },
                legend: {
                    align: 'right',
                    x: -25,
                    verticalAlign: 'top',
                    y: 30,
                    floating: true,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                    borderColor: '#CCC',
                    borderWidth: 1,
                    shadow: false,
                },
                tooltip: {
                    headerFormat: '<b>{point.x}</b><br/>',
                    pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    }
                },
                series: [
                    {
                        name: 'Открыли через сайт',
                        data: result['series_open_site']
                    },
                    {
                        name: 'Открыли через отделение',
                        data: result['series_open_branch']
                    },
                    {
                        name: 'Закрыли',
                        data: result['series_close']
                    }]
            })
        }
    });

}



