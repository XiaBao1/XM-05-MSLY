const app = getApp()
let getCookie = require("../../../utils/util.js")['getCookie'];
let sortName = 'sale';
Page({
  data: {
    SpecialityList: [],
    showsearch:true,   //显示搜索按钮
    searchtext:'',  //搜索文字
    scrolltop:null, //滚动位置
    page: 0,  //分页
    servicelist:[], //服务集市列表

  },
  onLoad: function() {
    getCookie(this.getSpecialityList);
  },
  getSpecialityList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/yk/top_speciality/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {orderByColumn: sortName, isAsc: 'desc'},
      success: function(res) {
        console.log("从服务器收到的查询结果是："+JSON.stringify(res));
        that.setSpecialityList(res.data)
      },
      fail:function(res){
        console.log("[onDeviceListTap]服务器查询结果失败："+JSON.stringify(res.data));
      }
    });
  },
  setSpecialityList: function(data){
    console.log(data);
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    this.setData({
      SpecialityList: data,
      page:this.data.page+1
    })
    let newlist = [];
    for (var i = 0; i < data.total; i++) {
      let id = data.rows[i].id;
      let houseName = data.rows[i].houseName;
      let specialtyName = data.rows[i].specialtyName;
      let price = data.rows[i].price;
      let sale = data.rows[i].sale;
      let imgurl = data.rows[i].imageUrl;
      console.log(price);
      newlist.push({
        "id":id,
        "houseName":houseName,
        "specialtyName":specialtyName,
        "price":price,
        "sale":sale,
        "imgurl":imgurl
      })
      console.log(newlist);
    }
    setTimeout(()=>{
      _this.setData({
        // servicelist:_this.data.servicelist.concat(newlist)
        servicelist:newlist
      })
      console.log(this.data.servicelist)
    },1500)
  
  },
  // inputSearch:function(e){  //输入搜索文字
  //   this.setData({
      
  //     searchtext:e.detail.value
  //   })
  // },
  // submitSearch:function(){  //提交搜索
  //     console.log(this.data.searchtext);
  //       //this.fetchServiceData();
  // },
  saleOrderClicked: function() {
    sortName = 'sale';
    getCookie(this.getSpecialityList);
  },
  priceOrderClicked: function() {
    sortName = 'price';
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
      url: 'http://localhost/system/buySpecialty/statistics',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        let name = [];
        let record = [];
        for(let i = 0;i<res.data.house.length;i++){
          name.push(res.data.house[i].name);
          record.push(res.data.house[i].record);
        }
        let list = {'name':name,'record':record};
        console.log(list)
        wx.setStorage({
          key:"StatisticsData",
          data: list
        });
      }
    });
  },

})