let getCookie = require("../../../utils/util.js")['getCookie'];
let sortName = 'orderTime';
Page({
  data: {
    SpecialityList: [],
    deletId : -1
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
  },
  statisticsClicked:function(){
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getStatistics
    });
    wx.navigateTo({
      url: 'statistics',
    })
  },
  getStatistics: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/clientspecialtyorder/clientorder/eCharts',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        wx.setStorage({
          key:"StatisticsData",
          data: res.data
        });
      }
    });
  },
  deletClicked:function(e) {
    console.log(e);
    let id = e.currentTarget.dataset.id;
    let data = this.data.SpecialityList[id].id;
    this.setData({
      deletId:data
    })
    getCookie(this.deletOrder);
  },
  deletOrder: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/clientspecialtyorder/clientorder/remove',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data:{ids:that.data.deletId},
      success: function(res) {
        console.log(res);
        that.onLoad();
      }
    });
  },
})