// pages/user/weather/modify/weather_modify.js
let getCookie = require("../../../../utils/util.js")['getCookie'];
Page({
  /**
   * 页面的初始数据
   */
  data: {
      id: 1,
      city: '',
      windDirection: '',
      dayType: '',
      highT: null,
      lowT: null,
      humidity: null,
      nightType: '',
      weatherDate: '',
      windScale: null,
      windSpeed: null,
      collectTime: null,
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let that=this;
    wx.getStorage({
      key: 'modifyweatherdat',
      success: function(res) {
        console.log('get modifyweatherdat');
        console.log(res);
        that.setData(res.data);
        wx.removeStorage({
          key: 'modifyweatherdat',
          success: function() {
            console.log('清除 modifyweatherdat');
          }
        })
      }
    });
  },
  inputCity: function(e) {
    this.setData({
      city: e.detail.value
    });
  },
  inputLowT: function(e) {
    this.setData({
      lowT: e.detail.value
    })
  },
  inputHighT: function(e) {
    this.setData({
      highT: e.detail.value
    })
  },  
  inputDayType: function(e) {
    this.setData({
      dayType: e.detail.value
    })
  },
  inputNightType: function(e) {
    this.setData({
      nightType: e.detail.value
    })
  },
  inputWindSpeed: function(e) {
    this.setData({
      windSpeed: e.detail.value
    })
  },
  inputWindScale: function(e) {
    this.setData({
      windScale: e.detail.value
    })
  },
  inputWindDirection: function(e) {
    this.setData({
      windDirection: e.detail.value
    })
  },
  inputHumidity: function(e) {
    this.setData({
      humidity: e.detail.value
    })
  },
  submitBtnClicked: function() {
    getCookie(this.submitForm);
  },
  submitForm: function(cookies) {
    console.log(this.data)
    wx.request({
      url: 'http://localhost/weather/weather/edit',
      header: {'cookie': cookies.data.substring(0, 48), 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      method: "post",
      data: this.data,
      success: function(res) {
        console.log("天气修改成功")
        console.log(res);
        wx.navigateBack();
      }
    });

  },
  bindDateChange: function(e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      weatherDate: e.detail.value
    })
  }

});