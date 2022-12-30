
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
      success: that.getToDo
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
  getToDo: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/usertodolist/todolist/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        that.handleGetToDoData(res.data);
        that.setData({
          returnData: res.data
        });
      }
    });
  },  
  handleGetToDoData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    let newlist = [];
    for(var i=0;i<data.rows.length;i++){
      let id=data.rows[i].id;
      let userName=data.rows[i].userName;
      let content=data.rows[i].content;
      let ddlTime=data.rows[i].ddlTime;
      let status=data.rows[i].status;
      //console.log(id+','+houseName+','+sale+','+score);
      newlist.push({
        "id":id,
        "content":content,
        "ddlTime":ddlTime,
        "status":status,
        "userName":userName,
        "imgUrl":status
      })
    }
    for(var i=0;i<newlist.length;i++){
      if(newlist[i].status=="0")newlist[i].status="待完成",newlist[i].imgUrl="../../../image/icon/todo.png";
      else newlist[i].status="已完成",newlist[i].imgUrl="../../../image/dui.png";
    }
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