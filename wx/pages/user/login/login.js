// pages/mobileLog/mobileLog.js
let loginUrl = "http://localhost/login";

Page({
  /**
   * 页面的初始数据
   */
  data: {
    account: "admin",
    password: "admin123"
  },
  onLoad: function() {
  },
  inputAccount: function(e) {
    this.setData({
      account: e.detail.value
    });
  },
  inputPassword: function(e) {
    this.setData({
      password: e.detail.value
    });
  },
  //登录
  log(){
    wx.request({
      url: loginUrl,
      method: "POST",
      data:{"rememberMe": false, "username": this.data.account, "password": this.data.password},
      header: { "content-type": "application/x-www-form-urlencoded", "x-requested-with": "XMLHttpRequest",},    //主要是x-requested-with，要填点东西
      success: function(res) {
        wx.setStorage({
          key:"cookies",
          data: res.cookies[0],
          success: function(res) {
            console.log(res);
            wx.switchTab({
              url: '../../info/index/info_index',
            })
          }
        })
      }
    });


  }
})