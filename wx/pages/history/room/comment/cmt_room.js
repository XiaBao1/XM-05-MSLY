// pages/history/room/comment/cmt_room.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    score: null,
    comment: '',
    photo: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    let that=this;
    wx.getStorage({
      key: 'querycommentdat',
      success: function(res) {
        console.log('get querycommentdat');
        console.log(res);
        that.setData({
          score: res.data.score,
          comment: res.data.comment,
          photo: res.data.photo
        });
        wx.removeStorage({
          key: 'querycommentdat',
          success: function() {
            console.log('清除 querycommentdat');
          }
        })
      }
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

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
  onPullDownRefresh() {

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