// pages/info/landlord/top_landlord.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
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