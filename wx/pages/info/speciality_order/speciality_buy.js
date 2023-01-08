// pages/info/speciality_order/speciality_buy.js
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id : 0,
    houseId : 0,
    houseName : '',
    specialtyName : '',
    price : 0,
    imageUrl : '',
    inventory : 0,
    mailbox : '',
    phone : '',
    buyNumber : 1,
    buyNumberList: [...Array(30).keys()]
    
  },

  onLoad(options) {
    this.setData({
      id:options.id
    })
    console.log(this.data.id);
    getCookie(this.getSpecialtyInfo)
  },
  getSpecialtyInfo: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/system/buySpecialty/getSpecialtyInfo',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {"id": this.data.id},
      success: function(res) {
        console.log(res);
        that.setSpecialtyInfo(res.data);
      }
    });
  },
  setSpecialtyInfo: function(data) {
    this.setData({
      houseId : data.houseId,
      houseName : data.houseName,
      specialtyName : data.specialtyName,
      price : data.price,
      imageUrl : data.imageUrl,
      inventory : data.inventory,
      mailbox : data.mailbox,
      phone : data.phone,
    })
  },
  bindBuyNumberChange: function(e) {
    this.setData({
      buyNumber: e.detail.value
    })
  },
  commitOrderClicked: function() {
    getCookie(this.commitOrder)
  },
  commitOrder: function(cookies) {
    let that = this;
    let data = {
      id: parseInt(that.data.id),
      buyNumber: parseInt(that.data.buyNumber),
      pwd: 123456
    }
    console.log(JSON.stringify(data))
    wx.request({
      url: 'http://localhost/system/buySpecialty/pay',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: data,
      success: function(res) {
        console.log(res)
        if(res.data.result_msg == '当前余额不足'){
          wx.showToast({
            title: '当前余额不足',
            icon: 'error',
            duration: 2000
           })
        }else if(res.data.result_msg == '当前库存不足'){
          wx.showToast({
            title: '当前库存不足',
            icon: 'error',
            duration: 2000
           })
        }else if(res.data.result_msg == '请填写正确的支付密码'){
          wx.showToast({
            title: '请填写正确的支付密码',
            icon: 'error',
            duration: 2000
           })
        }else{
          wx.showToast({
            title: '订购成功',
            icon: 'success',
            duration: 2000
           })
          wx.reLaunch({
            url: 'specialty_order_view?id='+that.data.id,
          })
        }
        
      }
    });
  },

})