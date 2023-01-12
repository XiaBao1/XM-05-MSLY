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
    standard: "",

    date: '2023-02-02',
    time: '00:00',
    liveTime: 5,
    passwd: '',

    curDate: '2022-12-31',
    liveTimeList: [...Array(30).keys()]

  },
  onLoad: function (options) {
    this.setData({
      roomId: options.id,
      curDate: new Date().toJSON().substring(0, 10)
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
  },
  bindDateChange: function(e) {
    this.setData({
      date: e.detail.value
    })
  },
  bindTimeChange: function(e) {
    this.setData({
      time: e.detail.value
    })
  },
  bindLiveTimeChange: function(e) {
    this.setData({
      liveTime: e.detail.value
    })
  },
  inputPasswd: function(e){
    this.setData({
      passwd: e.detail.value
    })
  },
  commitOrderClicked: function() {
    getCookie(this.commitOrder)
  },
  commitOrder: function(cookies) {
    let that = this;
    let data = {
      id: parseInt(this.data.roomId),
      checkInDate: this.data.date + 'T' + this.data.time + ':00',
      last: parseInt(this.data.liveTime),
      pwd: 123456
    }
    console.log(JSON.stringify(data))
    wx.request({
      url: 'http://localhost/system/buyroom/pay',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: data,
      success: function(res) {
        console.log(res)
        wx.reLaunch({
          url: '../../user/center/self_center',
        })
      }
    });
  },
})