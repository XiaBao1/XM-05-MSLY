// pages/loadEdit/loadEdit.js
let getCookie = require("../../../../utils/util.js")['getCookie'];
Page({
  data: {
    ddl: '2023-02-02',
    contents: '',
    id: -1,
    status: 0
  },
  onLoad: function (options) {
    let item = JSON.parse(options.item)
    this.setData({
      ddl: item.ddlTime,
      id: item.id,
      contents: item.content,
      status: item.status,
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
  statusChange: function(e) {
    this.setData({
      status: e.detail.value
    })
  },
  commitClicked: function() {
    getCookie(this.commitModify)
  },
  commitModify: function(cookies) {
    let that = this;
    let data = {
      id: this.data.id,
      content: this.data.contents,
      ddlTime: this.data.ddl,
      status: this.data.status
    }
    wx.request({
      url: 'http://localhost/usertodolist/todolist/edit',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: data,
      success: function(res) {
        console.log(res)
        wx.navigateBack()
      }
    });
  },
})