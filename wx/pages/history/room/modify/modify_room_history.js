// pages/history/room/modify/modify_room_history.js
let getCookie = require("../../../../utils/util.js")['getCookie'];
Page({
  /**
   * 页面的初始数据
   */
  data: {
    id: null,
    isDone: null
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let that=this;
    wx.getStorage({
      key: 'roomorderdat',
      success: function(res) {
        console.log('get roomorderdat');
        console.log(res);
        that.setData({
          id:res.data.id,
          isDone:res.data.isDone
        });
        wx.removeStorage({
          key: 'roomorderdat',
          success: function() {
            console.log('清除 roomorderdat');
          }
        })
      }
    });
  },
  isDoneTap: function() {
    let that=this;
    wx.showActionSheet({
      itemList: ['未完成', '已完成'],
      success (res) {
        console.log(res.tapIndex);
        that.setData({
          isDone: res.tapIndex
        })
      },
      fail (res) {
        console.log(res.errMsg)
      }
    })
  },
  submitBtnClicked: function() {
    getCookie(this.submitForm);
  },
  submitForm: function(cookies) {
    console.log(this.data)
    wx.request({
      url: 'http://localhost/clienthomeorder/homeorder/edit',
      header: {'cookie': cookies.data.substring(0, 48), 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      method: "post",
      data: this.data,
      success: function(res) {
        console.log("民宿订单修改成功")
        console.log(res);
        wx.navigateBack();
      }
    });

  }
});