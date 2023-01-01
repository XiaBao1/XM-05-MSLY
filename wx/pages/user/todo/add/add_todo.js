// pages/loadEdit/loadEdit.js
let getCookie = require("../../../../utils/util.js")['getCookie'];
Page({
  data: {
    ddl: '2023-02-02',
    contents: '',

    curDate: '2022-12-31'
  },
  onLoad: function (options) {
    this.setData({
      curDate: new Date().toJSON().substring(0, 10)
    })
  },
  bindDDLChange: function(e) {
    this.setData({
      ddl: e.detail.value
    })
  },
  inputContents: function(e) {
    this.setData({
      contents: e.detail.value
    })
  },
  commitClicked: function() {
    getCookie(this.commitAdd)
  },
  commitAdd: function(cookies) {
    let that = this;
    let data = {
      content: this.data.contents,
      ddlTime: this.data.ddl,
      status: 0
    }
    console.log(JSON.stringify(data))
    wx.request({
      url: 'http://localhost/usertodolist/todolist/add',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: data,
      success: function(res) {
        console.log(res)
        wx.navigateBack({
          delta: 0,
        })
      }
    });
  },
})