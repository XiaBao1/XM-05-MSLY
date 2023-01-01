// pages/goods/goods.js
let getCookie = require("../../../utils/util.js")['getCookie'];
let sortName = 'ddlTime';
let curIdx = 0;
Page({
  data: {
    todoList: []
  },
  onShow: function() {
    getCookie(this.getTodoList);
  },
  getTodoList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/usertodolist/todolist/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {orderByColumn: sortName, isAsc: 'asc'},
      success: function(res) {
        console.log(res);
        that.setTodoList(res.data.rows)
      }
    });
  },
  setTodoList: function(data){
    this.setData({
      todoList: data
    })
  },
  orderDDLClicked: function() {
    sortName = 'ddlTime';
    getCookie(this.getTodoList);
  },
  orderStatusClicked: function() {
    sortName = 'status';
    getCookie(this.getTodoList);
  },
  addClicked: function() {
    wx.navigateTo({
      url: './add/add_todo',
    })
  },
  statisticsClicked: function() {
    let numTodo = this.data.todoList.length;
    let numDone = 0;
    for (let i = 0; i < numTodo; i++) {
      if (this.data.todoList[i].status == "1") {
        numDone++
      }
    }
    wx.navigateTo({
      url: './statistics/todo_statistics?doneRatio=' + (numDone / numTodo),
    })
  },
  deleteTodoClicked: function(e) {
    curIdx = e.currentTarget.dataset.idx;
    getCookie(this.deleteTodo)
  },
  deleteTodo: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/usertodolist/todolist/remove',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {ids: this.data.todoList[curIdx].id},
      success: function(res) {
        console.log(res);
        that.onShow()
      }
    });
  },
  modifyTodoClicked: function(e) {
    let idx = e.currentTarget.dataset.idx;
    wx.navigateTo({
      url: './modify/modify_todo?item=' + JSON.stringify(this.data.todoList[idx]),
    })
  }
})