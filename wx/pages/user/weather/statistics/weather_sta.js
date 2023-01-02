import * as echarts from '../../../../ec-canvas/echarts';
function initChart(canvas, width, height, dpr) {
  var that=this;
  const chart = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // 解决小程序视图模糊的问题，必写
  });
  wx.getStorage({
    key: 'weatherSta',
    success: function(res) {
      console.log('get weatherSta');
      console.log(res);
      var monthLowT = res.data.slice(31,62);
      var monthHighT = res.data.splice(0,31);
      console.log('处理过');
      console.log(monthHighT);
      console.log(monthLowT);
      wx.removeStorage({
        key: 'weatherSta',
        success: function() {
          console.log('清除 weatherSta');
        }
      });
      canvas.setChart(chart);
      var option = {
        title: {
          text: '本月温度变化图',
          left: 'left'   // 设置标题位置
        },
        legend: {
            data:['高温','低温']
        },
        grid: {
          containLabel: true,
          x:45,
          x2:40,
          y2:24
        },
        tooltip: {
          show: true,
          trigger: 'axis',
          showDelay : 0,
          axisPointer:{
              type : 'cross',
              lineStyle: {
                  type : 'dashed',
                  width : 1
              }
          }
        },
        xAxis : [
          {
              type : 'category',
              boundaryGap : false,
              data : ['1日','2日','3日','4日','5日','6日','7日','8日','9日','10日',
                  '11日','12日','13日','14日','15日','16日','17日','18日','19日','20日'
                  ,'21日','22日','23日','24日','25日','26日','27日','28日','29日','30日','31日']
          }
      ],
      yAxis : [
          {
              type : 'value',
              axisLabel : {
                  formatter: '{value} °C'
              }
          }
      ],
      series : [
          {
              name:'最高气温',
              type:'line',
              //data:[11, 11, 15, 13, 12, 13, 10],
              data: monthHighT,
              markPoint : {
                  data : [
                      {type : 'max', name: '最大值'},
                      {type : 'min', name: '最小值'}
                  ]
              },
              markLine : {
                  data : [
                      {type : 'average', name: '平均值'}
                  ]
              }
          },
          {
              name:'最低气温',
              type:'line',
              //data:[1, -2, 2, 5, 3, 2, 0],
              data: monthLowT,
              markPoint : {
                  data : [
                      {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                  ]
              },
              markLine : {
                  data : [
                      {type : 'average', name : '平均值'}
                  ]
              }
          }
      ]
      };
    
      chart.setOption(option);
    }
  });
  return chart;
}

Page({
  data: {
    ec: {
      onInit: initChart
    }
  },
  onReady() {
  }
});
