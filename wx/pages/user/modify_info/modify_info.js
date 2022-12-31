// pages/realName/realName.js
let getCookie = require("../../../utils/util.js")['getCookie'];

Page({

  /**
   * 页面的初始数据
   */
  data: {
    id: 1,
    loginName: "",
    userName: "",
    phonenumber: "",
    email: "",
    sex: "0",
    province: ""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let userData =  JSON.parse(options.data);
    console.log(userData);
    this.setData({
      id: userData.userId,
      loginName: userData.loginName,
      userName: userData.userName,
      phonenumber: userData.phonenumber,
      email: userData.email,
      sex: userData.sex,
      province: userData.province
    })
  },
  inputName: function(e) {
    this.setData({
      userName: e.detail.value
    });
  },
  inputPhone: function(e) {
    this.setData({
      phonenumber: e.detail.value
    })
  },
  inputEmail: function(e) {
    this.setData({
      email: e.detail.value
    })
  },  
  inputProvince: function(e) {
    this.setData({
      province: e.detail.value
    })
  },
  radioChange: function(e) {
    this.setData({
      sex: e.detail.value
    })
  },

  submitBtnClicked: function() {
    getCookie(this.submitForm);
  },
  submitForm: function(cookies) {
    let that = this;
    console.log(this.data)
    
    wx.request({
      url: 'http://localhost/system/user/profile/update',
      header: {'cookie': cookies.data.substring(0, 48), 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      method: "post",
      data: this.data,
      success: function(res) {
        console.log("modify return")
        console.log(res);
        wx.reLaunch({
          url: '../center/self_center',
        })
      }
    });

  }

});