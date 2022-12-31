// pages/realName/realName.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    loginName: "",
    userName: "",
    phone: "",
    email: "",
    createTime: "",
    money: -1,
    province: "",
    sex: "0"
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let userData =  JSON.parse(options.data);
    console.log(userData)
    this.setData({
      loginName: userData.loginName,
      userName: userData.userName,
      phone: userData.phonenumber,
      email: userData.email,
      createTime: userData.createTime,
      money: userData.money,
      province: userData.province,
      sex: userData.sex
    })
  },

})