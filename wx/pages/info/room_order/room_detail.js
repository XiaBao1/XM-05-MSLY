// pages/loadEdit/loadEdit.js
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    roomId: -1,
    houseName: "",
    imageUrl: "",
    isFree: 0,
    mailBox: "",
    phoneNumber: "",
    pricePerDay: -1,
    roomNumber: "",
    standard: ""
  },
  onLoad: function (options) {
    this.setData({
      roomId: options.id
    })
    getCookie(this.getRoomInfo)
  },  
  getRoomInfo: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/system/buyroom/getRoomInfo',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {"id": this.data.roomId},
      success: function(res) {
        console.log(res);
        that.setRoomInfo(res.data);
      }
    });
  },
  setRoomInfo: function(data) {
    this.setData({
      houseName: data.houseName,
      imageUrl: data.imageUrl,
      isFree: data.isFree,
      mailBox: data.mailBox,
      phoneNumber: data.phoneNumber,
      pricePerDay: data.pricePerDay,
      roomNumber: data.roomNumber,
      standard: data.standard
    })
  }
})