// pages/info/landlord/top_landlord.js
Page({
  /**
   * 页面的初始数据
   */
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

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getTopLandlord
    });
    that.fetchFilterData();
  },
  toStatistics: function(){
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getTopLandlordSta
    });
    wx.navigateTo({
      url: './statistics/statistics',
    })
  },
  getTopLandlordSta: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_landlord/statistics',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        // that.setData({
        //   returnDataSta: res.data
        // });
        //console.log(res.data.name);
        console.log('set storage');
        wx.setStorage({
          key:"landlordSta",
          data: res.data
        });
      }
    });
  },
  getTopLandlord: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_landlord/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        that.handleGetLandlordData(res.data);
        that.setData({
          returnData: res.data
        });
      }
    });
  },  
  handleGetLandlordData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    let newlist = [];
    for(var i=0;i<data.rows.length;i++){
      let id=data.rows[i].id;
      let houseName=data.rows[i].houseName;
      let imageUrl=data.rows[i].imageUrl;
      let sale=data.rows[i].sale;
      let score=data.rows[i].score;
      let address=data.rows[i].address;
      //console.log(id+','+houseName+','+sale+','+score);
      newlist.push({
        "id":id,
        "name":houseName,
        "sale":sale,
        "score":score,
        "imgurl":imageUrl,
        "address":address
      })
    }
    newlist=newlist.sort(function(obj1, obj2) {
      var lhs1 = obj1["sale"];
      var rhs1 = obj2["sale"];
      var lhs2= obj1["score"];
      var rhs2= obj2["score"];
      if(lhs1-rhs1==0){
          return rhs2 - lhs2;
      }else{   
          return rhs1 - lhs1; // 年份升序
      }
    });
    setTimeout(()=>{
     _this.setData({
       servicelist:_this.data.servicelist.concat(newlist)
     })
    },1500)
  },
  fetchFilterData:function(){ //获取筛选条件
    this.setData({
      filterdata:{
        "sort": [
            {
                "id": 0,
                "title": "销量优先"
            },
            {
                "id": 1,
                "title": "评分优先"
            },
        ],
      }
    })
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
  hideFilter: function(){ //关闭筛选面板
    this.setData({
      showfilter: false,
      showfilterindex: null
    })
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
  goSort:function() {
    var newlist;
    if(this.data.sortid=='0') {
      newlist=this.data.servicelist.sort(function(obj1, obj2) {
        var lhs1 = obj1["sale"];
        var rhs1 = obj2["sale"];
        var lhs2= obj1["score"];
        var rhs2= obj2["score"];
        if(lhs1-rhs1==0){
            return rhs2 - lhs2;
        }else{   
            return rhs1 - lhs1; // 年份升序
        }
      });
    }
    else {
      newlist=this.data.servicelist.sort(function(obj1, obj2) {
        var lhs1 = obj1["score"];
        var rhs1 = obj2["score"];
        var lhs2= obj1["sale"];
        var rhs2= obj2["sale"];
        if(lhs1-rhs1==0){
            return rhs2 - lhs2;
        }else{   
            return rhs1 - lhs1; // 年份升序
        }
      });
    }
    console.log(newlist);
    setTimeout(()=>{
      this.setData({
        servicelist:newlist
      })
     },1500)
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {
    this.setData({
      servicelist: []
    })
    this.onLoad();
    setTimeout(()=>{
      wx.stopPullDownRefresh()
    },1000)
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})