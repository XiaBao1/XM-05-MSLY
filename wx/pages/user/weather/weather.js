let getCookie = require("../../../utils/util.js")['getCookie'];
let curIdx = 0;
Page({
  data: {
    filterdata:{},  //筛选条件数据
    showfilter:false, //是否显示下拉筛选
    showfilterindex:null, //显示哪个筛选类目
    sortindex:0,  //排序索引
    sortid:0,  //排序id
    filter:{},
    returnData: [],
    returnDataSta: "",
    servicelist:[],
  },
  onLoad() { //加载数据渲染页面
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.fetchWeatherData
    });
    that.fetchFilterData();
  },
  fetchFilterData:function(){ //获取筛选条件
    this.setData({
      filterdata:{
        "sort": [
            {
                "id": 0,
                "title": "时间最近"
            },
            {
                "id": 1,
                "title": "温差最大"
            },
            {
                "id": 2,
                "title": "湿度最高"
            },
        ]
      }
    })
  },
  fetchWeatherData: function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/weather/weather/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {orderByColumn: 'weatherDate', isAsc: 'desc', pageSize: 1000},
      success: function(res) {
        console.log(res);
        that.handleWeatherData(res.data);
      }
    });
  },
  handleWeatherData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading',
    })
    let newlist = [];
    let newlist0=[];
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
      let collectTime=data.rows[i].collectTime;
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
        "windSpeed":windSpeed,
        "collectTime":collectTime
      })
      newlist0.push({
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
        "windSpeed":windSpeed,
        "collectTime":collectTime
      })
    }
    setTimeout(()=>{
      _this.setData({
        servicelist: newlist,
        returnData: newlist0
      })
    },1000)
  },
  toStatistics: function(){
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getWeatherSta
    });
    wx.navigateTo({
      url: './statistics/weather_sta',
    })
  },
  toAdd: function(){
    wx.navigateTo({
      url: './add/weather_add'
    })
  },
  getWeatherSta: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/weather/weather/statistics',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        console.log('set storage');
        wx.setStorage({
          key:"weatherSta",
          data: res.data
        });
      }
    });
  },
  setFilterPanel: function(e){ //展开筛选面板
    const d = this.data;
    const i = e.currentTarget.dataset.findex;
    if(d.showfilterindex == i){
      this.hideFilter();
    }else{
      this.setData({
        showfilter: true,
        showfilterindex:i,
      })
    }
  },
  setSort:function(e){ //选择排序方式
    const d= this.data;
    const dataset = e.currentTarget.dataset;
    this.setData({
      sortindex:dataset.sortindex,
      sortid:dataset.sortid
    })
    console.log('排序方式id：'+this.data.sortid);
    this.goSort();
    this.hideFilter();
  },
  hideFilter: function(){ //关闭筛选面板
    this.setData({
      showfilter: false,
      showfilterindex: null
    })
  },
  goSort:function() {
    var newlist;
    if(this.data.sortid=='0') {
      newlist=JSON.parse(JSON.stringify(this.data.returnData));
    }
    else {
      if(this.data.sortid=='1') {
        newlist=this.data.servicelist.sort(function(obj1, obj2) {
          var lhs1 = obj1["highT"]-obj1["lowT"];
          var rhs1 = obj2["highT"]-obj2["lowT"];
          return rhs1 - lhs1;
        });
      }
      else {
        newlist=this.data.servicelist.sort(function(obj1, obj2) {
          var lhs1 = obj1["humidity"];
          var rhs1 = obj2["humidity"];
          return rhs1 - lhs1;
        });
      }
    }
    console.log(newlist);
    setTimeout(()=>{
      this.setData({
        servicelist:newlist
      })
     },1500)
  },
  onPullDownRefresh:function(){ //下拉刷新
    this.setData({
      page:0,
      servicelist:[]
    })
    this.onLoad();
    setTimeout(()=>{
      wx.stopPullDownRefresh()
    },1000)
  },
  onDeleteTap:function(e) {
    curIdx = e.currentTarget.dataset.itemid;
    console.log('删除'+curIdx);
    getCookie(this.deleteById);
  },
  deleteById:function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/weather/weather/remove',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {ids: curIdx},
      success: function(res) {
        console.log(res);
        that.onLoad();
      }
    });
  },
  onModifyTap:function(e) {
    curIdx = e.currentTarget.dataset.idx;
    console.log('修改index'+curIdx);
    wx.setStorage({
      key: "modifyweatherdat",
      data: this.data.servicelist[curIdx]
    });
    wx.navigateTo({
      url: './modify/weather_modify',
    });
  },

})
