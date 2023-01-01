// pages/goods/goods.js
let getCookie = require("../../../utils/util.js")['getCookie'];
let sortName = 'sale';
Page({
  data: {
    HouseList: []
  },
  onLoad: function() {
    getCookie(this.getHouseList);
  },
  getHouseList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_landlord/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {orderByColumn: sortName, isAsc: 'desc'},
      success: function(res) {
        console.log(res);
        that.setHouseList(res.data.rows)
      }
    });
  },
  setHouseList: function(data){
    this.setData({
      houseList: data
    })
  },
  houseClicked: function(e) {
    let id = e.currentTarget.dataset.id;
    let data = this.data.houseList[id];
    wx.navigateTo({
      url: './house_detail?houseInfo=' + JSON.stringify(data),
    })
  },
  saleOrderClicked: function() {
    sortName = 'sale';
    getCookie(this.getHouseList);
  },
  scoreOrderClicked: function() {
    sortName = 'score';
    getCookie(this.getHouseList);
  }
})