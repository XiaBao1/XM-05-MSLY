import * as echarts from '../../../../ec-canvas/echarts';
function initChart(canvas, width, height, dpr) {
  var that=this;
  const chart = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // 解决小程序视图模糊的问题，必写
  });
  wx.getStorage({
    key: 'specialitySta',
    success: function(res) {
      console.log('get specialitySta');
      console.log(res);
      canvas.setChart(chart);
    
      var option = {
        title: {
          text: '特产价格与销量统计图',
          left: 'left'   // 设置标题位置
        },
        legend: {
          data: ['特产']
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
        xAxis: [
          {
            type: 'value',
            axisTick: { show: false },
            scale:true,
            axisLine: {
              lineStyle: {
                color: '#999'
              }
            },
            axisLabel: {
              color: '#666',
              formatter: '{value} 元'
            }
          }
        ],
        yAxis: [
          {
            type: 'value',
            scale:true,
            axisLine: {
              lineStyle: {
                color: '#999'
              }
            },
            axisLabel: {
              color: '#666',
              formatter: '{value} 个'
            }
          }
        ],
        series: [{
          name: '特产销量',
          type: 'scatter',
          label: {
            normal: {
              show: true,
              position: 'inside'
            }
          },
          data: res.data
        }]
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
