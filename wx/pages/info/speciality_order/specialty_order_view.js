const app = getApp()
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({
  data: {
    spacedata:{},
    spaceimgs:[],
    currentIndex:1,
    id:0,
  },
  onLoad: function (options) {
    console.log(options);
    this.setData({
      id:options.id,
    });
    getCookie(this.getSpecialtyOrderView);
    
  },
  goBuy: function(){
    let specialtyId = this.data.id;
    wx.navigateTo({
      url: 'speciality_buy?id=' + specialtyId,
      // url: './speciality_buy?specialtyInfo='+JSON.stringify(specialtyInfo),
    })
  },
  checkComment:function(){
    let specialtyId = this.data.id;
    wx.navigateTo({
      url: 'specialty_comment?id=' + specialtyId,
    })

  },
  getSpecialtyOrderView: function(cookies){
    let that = this;
    console.log("========================",that.data.id);
    wx.request({
      url: 'http://localhost/yk/top_speciality/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      // data: {"id":that.data.id},
      success: function(res) {
        console.log("从服务器收到的查询结果是："+JSON.stringify(res));
        that.handleGetDeviceRecordResult(res.data)
      },
      fail:function(res){
        console.log("服务器查询结果失败："+JSON.stringify(res.data));
      }
    })
  },
  handleGetDeviceRecordResult(data){
    console.log(data);
    let id = this.data.id;
    let lists = data.rows;
    let list = {};
    for(let i = 0;i < data.total;i++){
      if(lists[i].id == id){
        list = lists[i];
        break;
      }
    }
    console.log(list);
    let houseName = list.houseName;
    let address = list.address;
    let specialtyName = list.specialtyName;
    let price = list.price;
    let inventory = list.inventory;
    let houseId = list.houseId;
    let sale = list.sale;
    let imageUrl = list.imageUrl;
    let description = list.description;
    this.setData({
      spacedata:{
        "houseName":houseName,
        "address":address,
        "specialtyName":specialtyName,
        "price":price,
        "inventory":inventory,
        "houseId":houseId,
        "sale":sale,
        "imageUrl":imageUrl,
        "description":description
      }
    })
  }
})
