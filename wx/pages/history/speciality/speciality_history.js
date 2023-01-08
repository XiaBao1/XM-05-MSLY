let getCookie = require("../../../utils/util.js")['getCookie'];
let sortName = 'orderTime';
Page({
  data: {
    SpecialityList: []
  },
  onLoad: function() {
    getCookie(this.getSpecialityList);
  },
  getSpecialityList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/clientspecialtyorder/clientorder/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      //data: {orderByColumn: sortName, isAsc: 'desc'},
      data:{isAsc: 'desc',pageNum: 1,pageSize: 10,houseName:'',specialtyName:'',orderByColumn: sortName},
      success: function(res) {
        console.log(res);
        that.setSpecialityList(res.data.rows)
      }
    });
  },
  setSpecialityList: function(data){
    this.setData({
      SpecialityList: data
    })
  },
  SpecialityClicked:function(e) {
    console.log(e);
    let id = e.currentTarget.dataset.id;
    let data = this.data.SpecialityList[id];
    wx.navigateTo({
      url: './specialty_history_detail?specialtyHistoryInfo=' + JSON.stringify(data),
    })
  },
  orderTimeOrderClicked: function() {
    sortName = 'orderTime';
    getCookie(this.getSpecialityList);
  },
  quantityOrderClicked: function() {
    sortName = 'quantity';
    getCookie(this.getSpecialityList);
  }
})