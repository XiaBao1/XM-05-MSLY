
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    id:0,
    commentList: [],
    count:0

  },
  onLoad(options) {
    console.log(options);
    let id = options.id;
    this.setData({
      id:id
    })
    console.log(this.data.id);
    getCookie(this.getAllComment);

  },
  getAllComment: function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/system/buySpecialty/getComment',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data:{id:that.data.id},
      success: function(res) {
        console.log(res);
        that.setAllComment(res.data)
      },
    })
  },
  setAllComment:function(data){
    console.log(data);
    this.setData({
      count:data.scoreNumber,
      commentList: data.allComment
    })
  },

})