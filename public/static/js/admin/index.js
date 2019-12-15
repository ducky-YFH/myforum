// 获取后台数据
let data = []
$.ajax({
  type: "get",
  url: "foruminfo",
  data: "",
  dataType: "JSON",
  success: function (response) {
    data = response
    console.log(data)
    barOption(data)
    pieOption(data)
  }
});
function barOption(data) {
  let xAxis = [];
  let seriesData = [];
  let colorList = [];
  data.forEach((item, index) => {
    xAxis.push(item.sname)
    seriesData.push(item.num)
    colorList.push(`#${Math.random().toString(16).slice(2, 8)}`)
  })
  console.log(colorList);
  // 指定图表的配置项和数据
  var barOption = {
    tooltip: {},
    legend: {
      data: ['销量']
    },
    xAxis: {
      data: xAxis
    },
    yAxis: {},
    series: [
      {
        type: 'bar',
        data: seriesData,
        itemStyle: {
          normal: {
            color: function (params) {
              return colorList[params.dataIndex]
            }
          }
        }
      }
    ],
  };
  var barChart = echarts.init(document.getElementById('bar'));
  barChart.setOption(barOption);
}
// 基于准备好的dom，初始化echarts实例
function pieOption(data) {
  let legend = [];
  let seriesData = [];
  data.forEach((item, index) => {
    legend.push(item.sname)
    seriesData.push({ value: item.num, name: item.sname })
  })
  var pieOption = {
    legend: {
      data: legend
    },
    series: [
      {
        name: '访问来源',
        type: 'pie',
        //饼状图
        // radius: ['50%', '70%'],
        avoidLabelOverlap: false,
        //标签
        label: {
          normal: {
            show: true,
            position: 'inside',
            formatter: '{d}%',//模板变量有 {a}、{b}、{c}、{d}，分别表示系列名，数据名，数据值，百分比。{d}数据会根据value值计算百分比

            textStyle: {
              align: 'center',
              baseline: 'middle',
              fontFamily: '微软雅黑',
              fontSize: 15,
              fontWeight: 'bolder'
            }
          },
        },
        data: seriesData
      }
    ]
  }
  var pieChart = echarts.init(document.getElementById('pie'));
  pieChart.setOption(pieOption);
}