// pages/mine/mine.js
Page({
  data: {
    userName: "",
    avatar: "",
    money: -1,
    province: "",
  },
  onLoad: function() {
    this.getCookie(this.getProfile);
  },
  getProfile: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/wx/user/profile',
      header: {'cookie': cookies.data.substring(0, 48)},
      method: "post",
      success: function(res) {
        console.log(res);
        that.setProfile(res.data.data)
      }
    });
  },
  setProfile: function(data) {
    let avatar = data.avatar;
    let money = data.money;
    let province = data.province;
    if (avatar == "") {
      avatar = "/image/pic.png";
    }
    this.setData({
      userName: data.userName,
      avatar: avatar,
      money: money,
      province: province
    })
  },
  getCookie: function(callback) {
    wx.getStorage({
      key: "cookies",
      success: callback
    });
  },
  //退出登录
  signOutClicked(){
    this.getCookie(this.logout);
  },
  logout: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/logout',
      header: {'cookie': cookies.data.substring(0, 48)},
      method: "get",
      success: function(res) {
        console.log(res);
        wx.reLaunch({
          url: '../login/login',
        })
      }
    });
  },
})