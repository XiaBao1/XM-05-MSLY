// pages/mine/mine.js
let userData = null;
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    userName: "",
    avatar: "",
    money: -1,
    province: "",
  },
  onLoad: function() {
    getCookie(this.getProfile);
  },
  getProfile: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/wx/user/profile',
      header: {'cookie': cookies.data.substring(0, 48)},
      method: "post",
      success: function(res) {
        console.log(res);
        userData = res.data.data;
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

  userNameClicked: function() {
    wx.navigateTo({
      url: '../user_info/user_info?data=' + JSON.stringify(userData),
    })
  },
  modifyInfoClicked: function() {
    wx.navigateTo({
      url: '../modify_info/modify_info?data=' + JSON.stringify(userData),
    })
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