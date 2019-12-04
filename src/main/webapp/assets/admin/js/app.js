$(function() {
    // 读取body data-type 判断是哪个页面然后执行相应页面方法，方法在下面。
    var dataType = $('body').attr('data-type');
    console.log(dataType);
    for (key in pageData) {
        if (key == dataType) {
            pageData[key]();
        }
    }
    //     // 判断用户是否已有自己选择的模板风格
    //    if(storageLoad('SelcetColor')){
    //      $('body').attr('class',storageLoad('SelcetColor').Color)
    //    }else{
    //        storageSave(saveSelectColor);
    //        $('body').attr('class','theme-black')
    //    }

    autoLeftNav();
    $(window).resize(function() {
        autoLeftNav();
        console.log($(window).width())
    });

    //    if(storageLoad('SelcetColor')){

    //     }else{
    //       storageSave(saveSelectColor);
    //     }
})

// 侧边菜单开关
function autoLeftNav() {

    $('.tpl-header-switch-button').on('click', function() {
        if ($('.left-sidebar').is('.active')) {
            if ($(window).width() > 1024) {
                $('.tpl-content-wrapper').removeClass('active');
            }
            $('.left-sidebar').removeClass('active');
        } else {

            $('.left-sidebar').addClass('active');
            if ($(window).width() > 1024) {
                $('.tpl-content-wrapper').addClass('active');
            }
        }
    })

    if ($(window).width() < 1024) {
        $('.left-sidebar').addClass('active');
    } else {
        $('.left-sidebar').removeClass('active');
    }
}


// 侧边菜单
$('.sidebar-nav-sub-title').on('click', function() {
    $(this).siblings('.sidebar-nav-sub').slideToggle(80)
        .end()
        .find('.sidebar-nav-sub-ico').toggleClass('sidebar-nav-sub-ico-rotate');
})


// 页面数据
var pageData = {
    // ===============================================
    // 首页
    // ===============================================
    'index': function chartData() {
        $('#example-r').DataTable({

            bInfo: false, //页脚信息
            dom: 'ti'
        });
        // ==========================
        // 百度图表A http://echarts.baidu.com/
        // ==========================

        var echartsC = echarts.init(document.getElementById('tpl-echarts-C'));
        optionC = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['最大工作量', '最小工作量']
            },
            xAxis: [{
                type: 'category',
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            }],
            yAxis: [{
                type: 'value',
                name: '工作量',
                min: 0,
                max: 250,
                interval: 50,
                axisLabel: {
                    formatter: '{value} 件'
                }
            }
            ],
            series: [{
                name: '最大工作量',
                type: 'bar',
                data: [130, 50, 100, 70, 60, 50, 150, 110, 120, 200, 190, 180]
            },
                {
                    name: '最小工作量',
                    type: 'bar',
                    data: [30, 20, 10, 30, 10, 10, 50, 10, 20, 20, 90, 80]
                }
            ]
        };
        echartsC.setOption(optionC);

        var echartsRSCDAY = echarts.init(document.getElementById('tpl-echarts-rsc-day'));
        option = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['发件量', '收件量', '故障件数']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                data: day
            }],
            yAxis: [{
                type: 'value'
            }],
            series: [{
                name: '发件量',
                type: 'line',
                data: send_byday,
                itemStyle: {
                    normal: {
                        color: '#59aea2'
                    }

                }
            },
                {
                    name: '收件量',
                    type: 'line',
                    data: get_byday,
                    itemStyle: {
                        normal: {
                            color: '#32c5d2'
                        }
                    }
                },
                {
                    name: '故障件数',
                    type: 'line',
                    data: dis_byday,
                    itemStyle: {
                        normal: {
                            color: '#e7505a'
                        }
                    }
                }
            ]
        };
        echartsRSCDAY.setOption(option);

        var echartsRSCMONTH = echarts.init(document.getElementById('tpl-echarts-rsc-month'));
        option = {
            tooltip: {
                trigger: 'axis',
            },
            legend: {
                data: ['发件量', '收件量', '故障件数']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                data: month
            }],
            yAxis: [{
                type: 'value'
            }],
            series: [{
                name: '发件量',
                type: 'line',
                data: send_bymonth,
                itemStyle: {
                    normal: {
                        color: '#59aea2'
                    }
                }
            },
                {
                    name: '收件量',
                    type: 'line',
                    data: get_bymonth,
                    itemStyle: {
                        normal: {
                            color: '#32c5d2'
                        }
                    }
                },
                {
                    name: '故障件数',
                    type: 'line',
                    data: dis_bymonth,
                    itemStyle: {
                        normal: {
                            color: '#e7505a'
                        }
                    }
                }
            ]
        };
        echartsRSCMONTH.setOption(option);
    },
    // ===============================================
    // 邮差管理页
    // ===============================================
    'postman': function chartData() {

        // ==========================
        // 百度图表A http://echarts.baidu.com/
        // ==========================

        var postmanechartswork = echarts.init(document.getElementById('postman-echarts-work'));
        optionWork = {
            legend: {
                data: ['在岗天数', '请假天数', '加班天数']
            },
            backgroundColor: '#4b5357',
            series : [
                {
                    name: '邮差某月工作情况',
                    type: 'pie',
                    radius: '50%',
                    data:[
                        {value:workday, name:'在岗天数'},
                        {value:leaveday, name:'请假天数'},
                        {value:overtimeday, name:'加班天数'}
                    ]
                }
            ]
        };
        postmanechartswork.setOption(optionWork);
    },
    // ===============================================
    // 查询邮差工作量
    // ===============================================
    'search': function chartData() {

        // ==========================
        // 百度图表A http://echarts.baidu.com/
        // ==========================

        var postmancount = echarts.init(document.getElementById('postman-work-count'));
        option = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['工作量']
            },
            xAxis: [{
                type: 'category',
                data: postmanName
            }],
            yAxis: [{
                type: 'value',
                name: '工作量',
                min: 0,
                max: 200,
                interval: 50,
                axisLabel: {
                    formatter: '{value} 件'
                }
            }
            ],
            series: [{
                name: '工作量',
                type: 'bar',
                data: workload,
                markPoint : {
                    data : [
                        {type : 'max', name: '最大工作量'},
                        {type : 'min', name: '最小工作量'}
                    ]
                }
            }
            ]
        };
        postmancount.setOption(option);
    }
}

// 按月或天分别统计RSC系统邮件发件量、收件量及故障件数。
window.onload=function(){
    $('#tpl-echarts-rsc-month').css("display","none");
};
$('#byday').on('click', function() {
    $(this).prop("class","purple-on");
    $('#bymonth').prop("class","green");
    $('#tpl-echarts-rsc-day').css("display","");
    $('#tpl-echarts-rsc-month').css("display","none");
})
$('#bymonth').on('click', function() {
    $(this).prop("class","green-on");
    $('#byday').prop("class","purple");
    $('#tpl-echarts-rsc-day').css("display","none");
    $('#tpl-echarts-rsc-month').css("display","");
})

// 风格切换
$('.tpl-skiner-toggle').on('click', function() {
    $('.tpl-skiner').toggleClass('active');
})

$('.tpl-skiner-content-bar').find('span').on('click', function() {
    $('body').attr('class', $(this).attr('data-color'))
    saveSelectColor.Color = $(this).attr('data-color');
    // 保存选择项
    storageSave(saveSelectColor);

})

