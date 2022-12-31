// pages/info/speciality/top_speciality.js
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
      success: that.getTopSpeciality
    });
    that.fetchFilterData();
  },
  toStatistics: function(){
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getTopSpecialitySta
    });
    wx.navigateTo({
      url: './statistics/statistics',
    })
  },
  getTopSpecialitySta: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_speciality/statistics',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        console.log('set storage');
        var specialityData = [];
        for (let i = 0; i < res.data.length; i += 2) {
          specialityData.push([res.data[i], res.data[i+1]]);
        }
        console.log('处理过')
        console.log(specialityData);
        wx.setStorage({
          key:"specialitySta",
          data: specialityData
        });
      }
    });
  },
  getTopSpeciality: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_speciality/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        that.handleGetSpecialityData(res.data);
        that.setData({
          returnData: res.data
        });
      }
    });
  },  
  handleGetSpecialityData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    let newlist = [];
    for(var i=0;i<data.rows.length;i++){
      let id=data.rows[i].id;
      let houseName=data.rows[i].houseName;
      let specialtyName=data.rows[i].specialtyName;
      let imageUrl=data.rows[i].imageUrl;
      let sale=data.rows[i].sale;
      let price=data.rows[i].price;
      let address=data.rows[i].address;
      let description=data.rows[i].description;
      let inventory=data.rows[i].inventory;
      //console.log(id+','+houseName+','+sale+','+score);
      newlist.push({
        "id":id,
        "houseName":houseName,
        "specialtyName":specialtyName,
        "sale":sale,
        "price":price,
        "imgurl":imageUrl,
        "address":address,
        "description":description,
        "inventory":inventory
      })
    }
    newlist=newlist.sort(function(obj1, obj2) {
      var lhs1 = obj1["sale"];
      var rhs1 = obj2["sale"];
      return rhs1 - lhs1;
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
                "title": "销量优先，价格由高到低"
            },
            {
                "id": 2,
                "title": "销量优先，价格由低到高"
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
        return rhs1 - lhs1;
      });
    }
    else {
      if(this.data.sortid=='1') {
        newlist=this.data.servicelist.sort(function(obj1, obj2) {
          var lhs1 = obj1["sale"];
          var rhs1 = obj2["sale"];
          var lhs2= obj1["price"];
          var rhs2= obj2["price"];
          if(lhs1-rhs1==0){
              return rhs2 - lhs2;
          }else{   
              return rhs1 - lhs1; // 年份升序
          }
        });
      }
      else {
        newlist=this.data.servicelist.sort(function(obj1, obj2) {
            var lhs1 = obj1["sale"];
            var rhs1 = obj2["sale"];
            var lhs2= obj1["price"];
            var rhs2= obj2["price"];
            if(lhs1-rhs1==0){
                return lhs2 - rhs2;
            }else{   
                return rhs1 - lhs1; // 年份升序
            }
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