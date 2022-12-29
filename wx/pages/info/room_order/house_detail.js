// pages/finishDetails/finishDetails.js
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    //备注栏的高度
    remark_height: 180,
    // 服务热线的样式
    display: "fixed",
    height: "188rpx",

    houseId: -1,
    address: "",
    houseName: "",
    imageUrl: "",
    sale: 0,
    score: 0,

    roomList: []
  },
  onLoad: function (options) {
    let houseInfo = JSON.parse(options.houseInfo);
    console.log(houseInfo)
    this.setData({
      address: houseInfo.address,
      houseName: houseInfo.houseName,
      imageUrl: houseInfo.imageUrl,
      sale: houseInfo.sale,
      score: houseInfo.score,
      houseId: houseInfo.id
    })
    getCookie(this.getRoomList)
  },
  getRoomList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/system/buyroom/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {"houseId": this.data.houseId},
      success: function(res) {
        console.log(res);
        that.setRoomList(res.data.rows)
      }
    });
  },
  setRoomList: function(data){
    this.setData({
      roomList: data
    })
    console.log(data)
  },
  roomClicked: function(e) {
    let roomId = e.currentTarget.dataset.roomid;
    wx.navigateTo({
      url: './room_detail?id=' + roomId,
    })
  }
})