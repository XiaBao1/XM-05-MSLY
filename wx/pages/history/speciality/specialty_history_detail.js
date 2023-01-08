// pages/history/speciality/specialty_history_detail.js
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    orderdata:{},
    sumMoney:0,
    imageUrl:''

  },
  onLoad(options) {
    let specialtyHistoryInfo = JSON.parse(options.specialtyHistoryInfo);
    this.setData({
      orderdata:specialtyHistoryInfo
    })
    let sumMoney = this.data.orderdata.quantity * this.data.orderdata.price;
    this.setData({
      sumMoney:sumMoney
    })
    console.log(this.data.orderdata);
    getCookie(this.getSpecialtyImage);

  },
  getSpecialtyImage: function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_speciality/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        that.setSpecialtyImage(res.data)
      },
    })
  },
  setSpecialtyImage:function(data){
    console.log(data);
    let id = this.data.orderdata.specialtyId;
    for(let i = 0;i < data.total;i++){
      if(data.rows[i].id == id){
        this.setData({
          imageUrl:data.rows[i].imageUrl
        })
        console.log(this.data.imageUrl);
        break;
      }
    }
  },
  allComment:function(e) {
    // let id = this.data.orderdata.id;
    let data = this.data.orderdata;
    wx.navigateTo({
      url: './specialty_all_comment?orderdata=' + JSON.stringify(data),
    })
  },
 
})