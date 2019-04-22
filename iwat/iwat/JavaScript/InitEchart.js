function InitEchart() {
    let date = [];
    let weight = [];
    $.ajax({
        type: "POST",
        url: "/ashx/InitEchart.ashx",
        success: function (res) {
            let tempRes = JSON.parse(res);
            for (let item of tempRes) {
                date.push(item.time);
                weight.push(item.weight);
            }
        }
    });
    console.log(date);
    console.log(weight);
    // 基于准备好的dom，初始化echarts图表

    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        title: {
            text: "小妮子体重监测",
            subtext: "一定会瘦",
            subtextStyle: {
                color: "rgb(88, 91, 109)",
                fontStyle: "oblique"
            }
        },
        tooltip: {
            trigger: "axis",
            formatter: "时间：{b} <br>{a}：{c}kg "
        },
        legend: {
            data: ["体重"]
        },
        dataZoom: {
            show: true,
            start: 70
        },
        toolbox: {
            show: true,
            feature: {
                mark: {
                    show: true
                },
                dataView: {
                    show: true,
                    readOnly: true
                },
                magicType: {
                    show: false,
                    type: ["line", "bar"]
                },
                restore: {
                    show: true
                },
                saveAsImage: {
                    show: true
                }
            }
        },
        //calculable: true,
        xAxis: [
            {
                type: "category",
                boundaryGap: false,
                data: date,
                name: "时间",
                axisTick: {
                    show: true
                },
                axisLabel: {
                    show: true,
                    rotate: 40,
                    margin: 6
                }
            }
        ],
        yAxis: [
            {
                type: "value",
                name: "体重/kg",
                axisLabel: {
                    textStyle: {
                        fontStyle: "normal"
                    }
                },
                axisTick: {
                    show: false
                }
            }
        ],
        series: [
            {
                name: "体重",
                type: "line",
                data: weight,
                itemStyle: {
                    normal: {
                        areaStyle: {
                            type: "default"
                        }
                    }
                }
            }
        ]
    };

    // 为echarts对象加载数据 
    myChart.setOption(option); 
}