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
                text: '购买情况统计',
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
                    color: '#666',
                    interval:0,//横轴信息全部显示
						        rotate:-45,//-30度角倾斜显示
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
                data: res.data.record
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
