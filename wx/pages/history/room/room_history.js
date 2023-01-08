let getCookie = require("../../../utils/util.js")['getCookie'];
let curIdx = 0;
Page({
  /**
   * 页面的初始数据
   */
  data: {
    filterdata:{},  //筛选条件数据
    showfilter:false, //是否显示下拉筛选
    showfilterindex:null, //显示哪个筛选类目
    sortindex:0,  //排序索引
    sortid:0,  //排序id
    filter:{},
    returnData: [],
    returnDataSta: "",
    servicelist:[],
  },

  onShow(options) {
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getRoomOrder
    });
    that.fetchFilterData();
  },

  fetchFilterData:function(){ //获取筛选条件
    this.setData({
      filterdata:{
        "sort": [
            {
                "id": 0,
                "title": "下单时间最近"
            },
            {
                "id": 1,
                "title": "订单未支付优先"
            },
            {
                "id": 2,
                "title": "订单未完成优先"
            },
        ]
      }
    })
  },

  toStatistics: function(){
    let that = this;
    wx.getStorage({
      key: "cookies",
      success: that.getRoomOrderSta
    });
    wx.navigateTo({
      url: './statistics/sta_room_history',
    })
  },
  getRoomOrderSta: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/clienthomeorder/homeorder/eCharts',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      success: function(res) {
        console.log(res);
        console.log('set storage');
        wx.setStorage({
          key:"RoomOrderSta",
          data: res.data
        });
      }
    });
  },
  getRoomOrder: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/clienthomeorder/homeorder/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded', 'x-requested-with': 'XMLHttpRequest',},
      // 为什么？？？为什么必须要设houseName？？？null请求动作就结束，必须是空字符串？？？有点鬼畜了。。。
      data: {houseName:'',orderByColumn: 'buyTime', isAsc: 'desc', pageSize: 1000},
      method: "post",
      success: function(res) {
        console.log(res);
        that.handleGetRoomOrderData(res.data);
      }
    });
  },  
  handleGetRoomOrderData(data){
    let _this = this;
    wx.showToast({
      title: '加载中',
      icon: 'loading'
    })
    let newlist = [];
    let newlist0 = [];
    for(var i=0;i<data.rows.length;i++){
      let id=data.rows[i].id;
      let houseName=data.rows[i].houseName;
      let path=data.rows[i].path;
      let buyTime=data.rows[i].buyTime;
      let checkInDate=data.rows[i].checkInDate;
      let checkOutDate=data.rows[i].checkOutDate;
      let isDone=data.rows[i].isDone;
      let isPaid=data.rows[i].isPaid;
      let price=data.rows[i].price;
      let reserveInDate=data.rows[i].reserveInDate;
      let reserveOutDate=data.rows[i].reserveOutDate;
      let roomId=data.rows[i].roomId;
      let roomNumber=data.rows[i].roomNumber;
      let score=data.rows[i].score;
      newlist.push({
        "id":id,
        "houseName":houseName,
        "path":path,
        "buyTime":buyTime,
        "checkInDate":checkInDate,
        "checkOutDate":checkOutDate,
        "isDone":isDone,
        "isPaid":isPaid,
        "price":price,
        "reserveInDate":reserveInDate,
        "reserveOutDate":reserveOutDate,
        "roomId":roomId,
        "roomNumber":roomNumber,
        "score":score
      });
      newlist0.push({
        "id":id,
        "houseName":houseName,
        "path":path,
        "buyTime":buyTime,
        "checkInDate":checkInDate,
        "checkOutDate":checkOutDate,
        "isDone":isDone,
        "isPaid":isPaid,
        "price":price,
        "reserveInDate":reserveInDate,
        "reserveOutDate":reserveOutDate,
        "roomId":roomId,
        "roomNumber":roomNumber,
        "score":score
      });
    }
    setTimeout(()=>{
     _this.setData({
       servicelist:newlist,
       returnData:newlist0
     })
    },1500)
  },
  setFilterPanel: function(e){ //展开筛选面板
    const d = this.data;
    const i = e.currentTarget.dataset.findex;
    if(d.showfilterindex == i){
      this.hideFilter();
    }else{
      this.setData({
        showfilter: true,
        showfilterindex:i,
      })
    }
  },
  setSort:function(e){ //选择排序方式
    const d= this.data;
    const dataset = e.currentTarget.dataset;
    this.setData({
      sortindex:dataset.sortindex,
      sortid:dataset.sortid
    })
    console.log('排序方式id：'+this.data.sortid);
    this.goSort();
    this.hideFilter();
  },
  hideFilter: function(){ //关闭筛选面板
    this.setData({
      showfilter: false,
      showfilterindex: null
    })
  },
  goSort:function() {
    var newlist;
    if(this.data.sortid=='0') {
      newlist=JSON.parse(JSON.stringify(this.data.returnData));
    }
    else {
      if(this.data.sortid=='1') {
        newlist=this.data.servicelist.sort(function(obj1, obj2) {
          var lhs1 = obj1["isPaid"];
          var rhs1 = obj2["isPaid"];
          return lhs1 - rhs1;
        });
      }
      else {
        newlist=this.data.servicelist.sort(function(obj1, obj2) {
          var lhs1 = obj1["isDone"];
          var rhs1 = obj2["isDone"];
          return lhs1 - rhs1;
        });
      }
    }
    console.log(newlist);
    setTimeout(()=>{
      this.setData({
        servicelist:newlist
      })
     },1500)
  },

  toAdd: function(){
    wx.navigateTo({
      url: './add/add_room_history'
    })
  },

  onDeleteTap:function(e) {
    curIdx = e.currentTarget.dataset.itemid;
    console.log('删除'+curIdx);
    getCookie(this.deleteById);
  },
  deleteById:function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/clienthomeorder/homeorder/remove',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {ids: curIdx},
      success: function(res) {
        console.log(res);
        that.onShow();
      }
    });
  },
  onModifyTap:function(e) {
    curIdx = e.currentTarget.dataset.idx;
    console.log('修改index'+curIdx);
    console.log(this.data.servicelist[curIdx])
    wx.setStorage({
      key: "roomorderdat",
      data: this.data.servicelist[curIdx]
    });
    wx.navigateTo({
      url: './modify/modify_room_history',
    });
  },

  onQueryCommentTap:function(e) {
    curIdx = e.currentTarget.dataset.itemid;
    console.log('查看评论'+curIdx);
    getCookie(this.queryCommentById);
  },
  queryCommentById:function(cookies){
    let that = this;
    wx.request({
      url: 'http://localhost/clienthomeorder/homeorder/appquerycomment',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {id: curIdx},
      success: function(res) {
        console.log(res);
        if(res.data[0].id == 0){
          console.log('无评论');
          wx.showToast({  
            title: '还没有评论',  
            icon: 'error',  
            duration: 3000  
          }) 
        }
        else {
          wx.setStorage({
            key:"querycommentdat",
            data: res.data[0]
          });
          wx.navigateTo({
            url: './comment/cmt_room',
          })
        }
      }
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh:function(){ //下拉刷新
    this.setData({
      servicelist:[],
      sortindex: 0,
      sortid: 0
    })
    this.onShow();
    setTimeout(()=>{
      wx.stopPullDownRefresh()
    },1000)
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})