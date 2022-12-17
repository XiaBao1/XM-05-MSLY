// pages/info/index/info_index.js
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    returnData: "",

    indicatorDots: true,
    autoplay: true,
    interval: 3000,
    duration: 500,
    circular: true
  },

  onLoad: function() {
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getTopSpeciality
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
        that.setData({
          returnData: JSON.stringify(res.data)
        });
      }
    });
  },
  toTopLandlord:function() {
    wx.navigateTo({
      url: '../../info/landlord/top_landlord',
    });
  },
  toTodoList:function() {
    wx.navigateTo({
      url: '../../user/todo/todo',
    });
  },
  toTopSpeciality:function() {
    wx.navigateTo({
      url: '../../info/speciality/top_speciality',
    });
  },
  toRoomOrder:function() {
    wx.navigateTo({
      url: '../../info/room_order/room_order',
    });
  },
  toSpecialityOrder:function() {
    wx.navigateTo({
      url: '../../info/speciality_order/speciality_order',
    });
  },
  toWeather:function() {
    wx.navigateTo({
      url: '../../user/weather/weather',
    });
  },
changeIndicatorDots(e) {
    this.setData({
      indicatorDots: !this.data.indicatorDots
    })
  },
  changeAutoplay(e) {
    this.setData({
      autoplay: !this.data.autoplay
    })
  },
  intervalChange(e) {
    this.setData({
      interval: e.detail.value
    })
  },
  durationChange(e) {
    this.setData({
      duration: e.detail.value
    })
  },
  //存放
  order(){
    wx.navigateTo({
      url: '../order/order',
    })
  }
})