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
      success: that.getRoomOrder
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
  getRoomOrder: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/clienthomeorder/homeorder/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded', 'x-requested-with': 'XMLHttpRequest',},
      // 为什么？？？为什么必须要设houseName？？？null请求动作就结束，必须是空字符串？？？有点鬼畜了。。。
      data: {houseName:''},
      method: "post",
      success: function(res) {
        console.log(res);
        that.handleGetRoomOrderData(res.data);
        that.setData({
          returnData: res.data
        });
      }
    });
  },  
  handleGetRoomOrderData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    let newlist = [];
    for(var i=0;i<data.rows.length;i++){
      let id=data.rows[i].id;
      let houseName=data.rows[i].houseName;
      let path=data.rows[i].path;
      let buyTime=data.rows[i].buyTime;
      let checkInDate=data.rows[i].checkInDate;
      let checkOutDate=data.rows[i].checkOutDate;
      let isDone=data.rows[i].isDone;
      let isPaid=data.rows[i].isPaid;
      let price=data.rows[i].price;
      let reserveInDate=data.rows[i].reserveInDate;
      let reserveOutDate=data.rows[i].reserveOutDate;
      let roomId=data.rows[i].roomId;
      let roomNumber=data.rows[i].roomNumber;
      let score=data.rows[i].score;
      newlist.push({
        "id":id,
        "houseName":houseName,
        "path":path,
        "buyTime":buyTime,
        "checkInDate":checkInDate,
        "checkOutDate":checkOutDate,
        "isDone":isDone,
        "isPaid":isPaid,
        "price":price,
        "reserveInDate":reserveInDate,
        "reserveOutDate":reserveOutDate,
        "roomId":roomId,
        "roomNumber":roomNumber,
        "score":score
      })
    }
    newlist=newlist.sort(function(obj1, obj2) {
      var lhs1 = obj1["buyTime"];
      var rhs1 = obj2["buyTime"];
      return rhs1 - lhs1; // 购买时间升序
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