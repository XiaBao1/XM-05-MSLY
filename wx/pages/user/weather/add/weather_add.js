// pages/user/weather/add/weather_add.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    weatherData: {
      id: 1,
      city: '',
      windDirection: '北',
      dayType: '',
      highT: null,
      lowT: null,
      humidity: null,
      nightType: '',
      weatherDate: '',
      windScale: null,
      windSpeed: null,
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
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
    
    // wx.request({
    //   url: 'http://localhost/system/user/profile/update',
    //   header: {'cookie': cookies.data.substring(0, 48), 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    //   method: "post",
    //   data: this.data,
    //   success: function(res) {
    //     console.log("modify return")
    //     console.log(res);
    //     wx.reLaunch({
    //       url: '../center/self_center',
    //     })
    //   }
    // });

  }

});