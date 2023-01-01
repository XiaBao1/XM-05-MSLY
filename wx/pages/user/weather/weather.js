import util from './../../../utils/util.js';
Page({
  data: {
    filterdata:{},  //筛选条件数据
    showfilter:false, //是否显示下拉筛选
    showfilterindex:null, //显示哪个筛选类目
    sortindex:0,  //排序索引
    sortid:0,  //排序id
    filter:{},
    returnData: "",
    returnDataSta: "",
    servicelist:[],
  },
  onLoad(options) { //加载数据渲染页面
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.fetchWeatherData
    });
    that.fetchSortData();
  },
  fetchSortData:function(){ //获取筛选条件
    this.setData({
      "sort": [
          {
              "id": 0,
              "title": "时间最近"
          },
          {
              "id": 1,
              "title": "低温最低"
          },
          {
              "id": 2,
              "title": "高温最高"
          },
      ]
    })
  },
  fetchWeatherData: function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/weather/weather/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        that.handleWeatherData(res.data);
        that.setData({
          returnData: res.data
        });
      }
    });
  },
  handleWeatherData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    let newlist = [];
    for(var i=0;i<data.rows.length;i++){
      let id=data.rows[i].id;
      let city=data.rows[i].city;
      let windDirection=data.rows[i].windDirection;
      let dayType=data.rows[i].dayType;
      let highT=data.rows[i].highT;
      let humidity=data.rows[i].humidity;
      let lowT=data.rows[i].lowT;
      let nightType=data.rows[i].nightType;
      let weatherDate=data.rows[i].weatherDate;
      let windScale=data.rows[i].windScale;
      let windSpeed=data.rows[i].windSpeed;
      newlist.push({
        "id":id,
        "city":city,
        "windDirection":windDirection,
        "dayType":dayType,
        "highT":highT,
        "lowT":lowT,
        "humidity":humidity,
        "nightType":nightType,
        "weatherDate":weatherDate,
        "windScale":windScale,
        "windSpeed":windSpeed
      })
    }
    newlist=newlist.sort(function(obj1, obj2) {
      var lhs1 = obj1["weatherDate"];
      var rhs1 = obj2["weatherDate"];
      return lhs1 - rhs1;
    });
    setTimeout(()=>{
     _this.setData({
       servicelist:_this.data.servicelist.concat(newlist)
     })
    },5000)
  },
  setSortBy:function(e){ //选择排序方式
    const d= this.data;
    const dataset = e.currentTarget.dataset;
    this.setData({
      sortindex:dataset.sortindex,
      sortid:dataset.sortid
    })
    console.log('排序方式id：'+this.data.sortid);
  },
  setStatusClass:function(e){ //设置状态颜色
    console.log(e);
  },
  scrollHandle:function(e){ //滚动事件
    this.setData({
      scrolltop:e.detail.scrollTop
    })
  },
  goToTop:function(){ //回到顶部
    this.setData({
      scrolltop:0
    })
  },
  scrollLoading:function(){ //滚动加载
    this.fetchConferenceData();
  },
  onPullDownRefresh:function(){ //下拉刷新
    this.setData({
      page:0,
      activitylist:[]
    })
    this.fetchConferenceData();
    this.fetchSortData();
    setTimeout(()=>{
      wx.stopPullDownRefresh()
    },1000)
  }
})