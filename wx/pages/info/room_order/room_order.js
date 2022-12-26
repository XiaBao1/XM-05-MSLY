// pages/goods/goods.js
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({

  /**
   * 页面的初始数据
   */
  data: {
    //页面切换
    //待入仓数据
    loadList:[
      {id:1,num:"D19060122",time:"2019-03-02"},
      { id: 2, num: "D19060123", time: "2019-03-02" }
    ],
    HouseList: []
  },
  onLoad: function() {
    getCookie(this.getHouseList);
  },
  getHouseList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_landlord/list',
      header: {'cookie': cookies.data.substring(0, 48)},
      method: "post",
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
  }
})