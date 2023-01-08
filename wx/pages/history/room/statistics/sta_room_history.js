import * as echarts from '../../../../ec-canvas/echarts';
function initChart(canvas, width, height, dpr) {
  var that=this;
  const chart = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // 解决小程序视图模糊的问题，必写
  });
  wx.getStorage({
    key: 'RoomOrderSta',
    success: function(res) {
      console.log('get RoomOrderSta');
      console.log(res);
      canvas.setChart(chart);
    
      var option = {
        title: {
          text: '订单数按月统计图',
          left: 'left'   // 设置标题位置
        },
        legend: {
          data: ['订单数'],
          right: 'right'
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
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
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
          name: '订单数',
          type: 'bar',
          smooth: true,
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
      wx.removeStorage({
        key: 'RoomOrderSta',
        success: function() {
          console.log('清除缓存 RoomOrderSta');
        }
      });
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
