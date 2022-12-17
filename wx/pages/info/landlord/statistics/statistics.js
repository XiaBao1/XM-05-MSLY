import * as echarts from '../../../../ec-canvas/echarts';
function initChart(canvas, width, height, dpr) {
  var that=this;
  const chart = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // 解决小程序视图模糊的问题，必写
  });
  wx.getStorage({
    key: 'landlordSta',
    success: function(res) {
      console.log('get landlordSta');
      console.log(res);
      canvas.setChart(chart);
    
      var option = {
        title: {
          text: '热门民宿统计图',
          left: 'left'   // 设置标题位置
        },
        legend: {
          data: ['销量']
        },
        grid: {
          containLabel: true
        },
        tooltip: {
          show: true,
          trigger: 'axis'
        },
        xAxis: [
          {
            type: 'category',
            axisTick: { show: false },
            data: res.data.name,
            axisLine: {
              lineStyle: {
                color: '#999'
              }
            },
            axisLabel: {
              color: '#666'
            }
          }
        ],
        yAxis: [
          {
            type: 'value',
            axisLine: {
              lineStyle: {
                color: '#999'
              }
            },
            axisLabel: {
              color: '#666'
            }
          }
        ],
        series: [{
          name: '销量',
          type: 'bar',
          smooth: true,
          label: {
            normal: {
              show: true,
              position: 'inside'
            }
          },
          data: res.data.sale
        }]
      };
    
      chart.setOption(option);
    }
  });
  return chart;
}

Page({
  data: {
    landlordname: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
    ec: {
      onInit: initChart
    }
  },
  onReady() {
  }
});
