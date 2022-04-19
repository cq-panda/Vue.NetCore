let
  options = {
    tree: [
      { "id": 1, "parentId": 0, "text": "北京市" },
      { "id": 2, "parentId": 1, "text": "西城区" },
      { "id": 3, "parentId": 1, "text": "东城区" },
      { "id": 5, "parentId": 0, "text": "西藏自治区" },
      { "id": 6, "parentId": 5, "text": "拉萨市" },
      { "id": 7, "parentId": 5, "text": "昌都市" },
      { "id": 8, "parentId": 7, "text": "丁青县" }
    ],
    //table数据
    tableData: [
      {
        code: "001",
        id: 1,//tree的id数据
        address: '海淀区',
        remark: '北京市-海淀区',
        enable: 1,
        createDate: '2020-04-01 20:00'
      }, {
        code: "001",
        id: 1,//tree的id数据
        address: '朝阳区',
        remark: '北京市-朝阳区',
        enable: 1,
        createDate: '2020-04-01 20:00'
      },{
      code: "001",
      id: 2,//tree的id数据
      address: '恭王府 ',
      remark: '世界最大的四合院除皇帝和家眷外，任何人是不得住进紫禁城的',
      enable: 1,
      createDate: '2020-04-01 20:00'
    },
    {
      code: "002",
      id: 3,//tree的id数据
      address: '白塔寺 ',
      remark: '妙应寺白塔位于阜城门内大街路北的妙应寺内。因寺内有通体涂以白垩的塔，故俗称“白塔寺”',
      enable: 0,
      createDate: '2020-04-01 20:00'
    }, {
      code: "004",
      id: 6,//tree的id数据
      address: '布达拉宫',
      remark: '布达拉宫不仅是西藏的象征，更是朝圣者心中的圣地',
      enable: 1,
      createDate: '2020-04-01 20:00'
    },
    {
      code: "005",
      id: 5,//tree的id数据
      address: '大昭寺',
      remark: '在藏民心中大昭寺在拉萨的中心地位',
      enable: 1,
      createDate: '2020-04-01 20:00'
    },
    {
      code: "007",
      id: 7,
      address: '测试 ',
      remark: '测试测试',
      enable: 1,
      createDate: '2020-04-01 20:00'
    },
    {
      code: "008",
      id: 5,
      address: '日客则 ',
      remark: '位于定日县境内的珠穆朗玛峰是世界第一高峰。峰顶常年积雪',
      enable: 0,
      createDate: '2020-04-01 20:00'
    }]
  }

export default options;
