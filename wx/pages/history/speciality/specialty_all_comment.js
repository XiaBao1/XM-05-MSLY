
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    orderdata:{},
    commentList: [],
    count:0

  },
  onLoad(options) {
    console.log(options);
    let orderdata = JSON.parse(options.orderdata);
    this.setData({
      orderdata:orderdata
    })
    console.log(this.data.orderdata);
    getCookie(this.getAllComment);

  },
  getAllComment: function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/clientspecialtyorder/clientorder/wxcommentlist',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data:{id:that.data.orderdata.id},
      success: function(res) {
        console.log(res);
        that.setAllComment(res.data)
      },
    })
  },
  setAllComment:function(data){
    console.log(data);
    this.setData({
      count:data.length,
      commentList: data
    })
  },

})