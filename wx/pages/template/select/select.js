// pages/template/select/select.js
Component({
  lifetimes: {
      // 1.循环集合
      // 2.通过键遍历数据
      // 3.回显默认值以及设置对应的默认键

  },
  observers: {
      'defalutKey,propArray': function (defalutKey, propArray) {
          // 在 defalutKey 或者 propArray 被设置时，执行这个函数
          this.updateData();
      }
  },
  /**
   * 组件的属性列表
   */
  properties: {
      //原数据集合
      propArray: {
          type: Array,
      },
      //集合中对象的键属性
      arrayKeyStr: {
          type: String,
      },
      //集合中对象的值属性
      arrayValueStr: {
          type: String,
      },
      //默认的键
      defalutKey: {
          type: String,
      },
      //是否禁用
      isDisabled: {
          type: Boolean,
          value: false
      },
      //选项字体颜色
      selectColor: {
          type: String
      }
  },
  /**
   * 组件的初始数据
   */
  data: {
      selectShow: false, //初始option不显示
      nowText: "请选择", //初始内容
      animationData: {}, //右边箭头的动画
      selectData: {}, //选择的对象
      selectList: [], //选择的数据显示集合
      selectDataList: [] //选择的数据集合
  },
  /**
   * 组件的方法列表
   */
  methods: {
      updateData() {
          var selectList = [];
          var selectDataList = [];
          this.properties.propArray.forEach(element => {
              var map = {
                  'id': element[this.properties.arrayKeyStr],
                  'name': element[this.properties.arrayValueStr]
              }
              selectList.push(element[this.properties.arrayValueStr]);
              selectDataList.push(map);
          });
          this.setData({
              selectList: selectList,
              selectDataList: selectDataList
          })
          if (this.properties.propArray.length <= 0) {
              this.setData({
                  nowText: "请选择", //初始内容
              })
              return;
          }
          if (this.properties.arrayKeyStr == null || this.properties.arrayKeyStr == '') {
              console.log("解析结合的对象键不能为空");
              return;
          }
          if (this.properties.arrayValueStr == null || this.properties.arrayValueStr == '') {
              console.log("解析集合对象的值键不能为空");
              return;
          }
          if (this.properties.defalutKey != null && this.properties.defalutKey != '') {
              var index = 0
              this.properties.propArray.forEach(element => {
                  if (element[this.properties.arrayKeyStr] == this.properties.defalutKey) {
                      this.setData({
                          nowText: element[this.properties.arrayValueStr],
                          selectData: {
                              value: element[this.properties.arrayKeyStr],
                              label: element[this.properties.arrayValueStr]
                          },
                          index: index
                      })
                      return;
                  }
                  index++;
              });
          }
      },
      //option的显示与否
      selectToggle: function () {
          let that = this
          //创建动画
          var animation = wx.createAnimation({
              timingFunction: "ease"
          })
          this.animation = animation;
          animation.rotate(90).step();
          this.setData({
              animationData: animation.export()
          })
      },
      bindPickerChange: function (e) {
          console.log('picker发送选择改变，携带值为', e.detail.value)
          this.setText(e.detail.value)
      },
      //设置内容
      setText: function (index) {
          var nowData = this.properties.propArray; //当前option的数据是引入组件的页面传过来的，所以这里获取数据只有通过this.properties
          var nowIdx = index; //当前点击的索引
          var nowValue = nowData[nowIdx].dictValue; //当前点击的值
          var nowText = nowData[nowIdx].dictLabel; //当前点击的内容
          //再次执行动画，注意这里一定，一定，一定是this.animation来使用动画
          this.animation.rotate(0).step();
          this.setData({
              selectShow: false,
              nowText: nowText,
              animationData: this.animation.export(),
              selectData: {
                  value: nowValue,
                  label: nowText
              }
          })
      },
      // 关闭 picker 触发的方法
      emitHideRegion: function () {
          //再次执行动画，注意这里一定，一定，一定是this.animation来使用动画
          this.animation.rotate(0).step();
          this.setData({
              animationData: this.animation.export()
          })
      },
      /**
       * 获取选择的对象
       */
      GetSelectValue() {
          return this.data.selectData
      }
  }
})