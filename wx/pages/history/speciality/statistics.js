import * as echarts from '../../../ec-canvas/echarts';

let chartOption = {};

Page({
  data: {
    ec: {
      lazyLoad: true
    }
  },
  onLoad: function(options) {
    this.ecComponent = this.selectComponent("#mychart-dom-line")
    
    wx.getStorage({
          key: 'StatisticsData',
          success: function(res) {
            console.log(res);
            // canvas.setChart(chart);
          
            chartOption = {
              title: {
                text: '每月特产订单',
                left: 'left'   // 设置标题位置
              },
              legend: {
                data: ['数量']
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
                    color: '#666',
                    interval:0,//横轴信息全部显示
						        rotate:-60,//-30度角倾斜显示
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
                name: '数量',
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
          

          }
        });
    this.init();
  },
  init: function() {
    this.ecComponent.init((canvas, width, height, dpr) => {
      const chart = echarts.init(canvas, null, {
        width: width,
        height: height,
        devicePixelRatio: dpr // new
      });
      chart.setOption(chartOption)
      this.chart = chart;

      return chart;
    })
  }
});
