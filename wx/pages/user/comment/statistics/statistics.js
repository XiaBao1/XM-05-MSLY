import * as echarts from '../../../../ec-canvas/echarts';
let chartOption = {};

Page({
  data: {
    ec: {
      lazyLoad: true
    }
  },
  onLoad: function(options) {
    this.ecComponent = this.selectComponent("#mychart-dom-line")
    chartOption = {
      title: {
        text: '平台反馈统计',
        left: 'center'
      },
      legend: {
        orient: 'vertical',
        left: 'left'
      },
      backgroundColor: "#ffffff",
      series: [{
        label: {
          normal: {
            fontSize: 14
          }
        },
        type: 'pie',
        center: '50%',
        radius: '50%',
        data: [{
          value: options.doneRatio,
          name: '已回复',
          itemStyle: {
            color:  '#aaff32'
          }
        }, {
          value: 1 - options.doneRatio,
          name: '未回复',
          itemStyle: {
            color:  '#ef4026'
          }
        }],
      }]
    };
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
