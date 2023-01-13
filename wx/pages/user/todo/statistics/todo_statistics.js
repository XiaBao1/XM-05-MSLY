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
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      title: {
        text: '待办事项统计',
        left: 'center'
      },
      backgroundColor: "#ffffff",
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      },
      series: [{
        label: {
          normal: {
            fontSize: 14
          }
        },
        type: 'pie',
        center: ['50%', '50%'],
        radius: ['20%', '40%'],
        data: [{
          value: options.doneRatio,
          name: '已完成'
        }, {
          value: 1 - options.doneRatio,
          name: '未完成'
        }]
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
