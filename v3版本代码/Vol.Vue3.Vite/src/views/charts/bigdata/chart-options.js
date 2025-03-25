var echarts = require("echarts");
let chartLeft1 = {
  tooltip: {
    trigger: "axis",
    axisPointer: {
      type: "shadow"
    }
  },
  grid: {
    left: "0%",
    top: "10px",
    right: "0%",
    bottom: "4%",
    containLabel: true
  },
  xAxis: [
    {
      type: "category",
      data: [
        "商超门店",
        "教育培训",
        "房地产",
        "生活服务",
        "汽车销售",
        "旅游酒店",
        "五金建材"
      ],
      axisLine: {
        show: true,
        lineStyle: {
          color: "rgba(255,255,255,.1)",
          width: 1,
          type: "solid"
        }
      },

      axisTick: {
        show: false
      },
      axisLabel: {
        interval: 0,
        show: true,
        splitNumber: 15,
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: "12"
        }
      }
    }
  ],
  yAxis: [
    {
      type: "value",
      axisLabel: {
        show: true,
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: "12"
        }
      },
      axisTick: {
        show: false
      },
      axisLine: {
        show: true,
        lineStyle: {
          color: "rgba(255,255,255,.1	)",
          width: 1,
          type: "solid"
        }
      },
      splitLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)"
        }
      }
    }
  ],
  series: [
    {
      type: "bar",
      data: [200, 600, 300, 900, 1500, 1200, 600],
      barWidth: "35%",
      itemStyle: {
        normal: {
          color: "#2f89cf",
          opacity: 1,
          barBorderRadius: 5
        }
      }
    }
  ]
};


let chartLeft2 = {
  tooltip: {
    trigger: "axis",
    axisPointer: {
      type: "shadow"
    }
  },
  grid: {
    left: "0%",
    top: "10px",
    right: "0%",
    bottom: "4%",
    containLabel: true
  },
  xAxis: [
    {
      type: "category",
      data: [
        "07.01",
        "07.02",
        "07.03",
        "07.04",
        "07.05",
        "07.06",
      ],
      axisLine: {
        show: true,
        lineStyle: {
          color: "rgba(255,255,255,.1)",
          width: 1,
          type: "solid"
        }
      },
      axisTick: {
        show: false
      },
      axisLabel: {
        interval: 0,
        // rotate:50,
        show: true,
        splitNumber: 15,
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: "12"
        }
      }
    }
  ],
  yAxis: [
    {
      type: "value",
      axisLabel: {
        show: true,
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: "12"
        }
      },
      axisTick: {
        show: false
      },
      axisLine: {
        show: true,
        lineStyle: {
          color: "rgba(255,255,255,.1	)",
          width: 1,
          type: "solid"
        }
      },
      splitLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)"
        }
      }
    },
    {
      type: "value",
      axisLabel: {
        show: true,
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: "12"
        }
      },
      axisTick: {
        show: false
      },
      axisLine: {
        show: true,
        lineStyle: {
          color: "rgba(255,255,255,.1	)",
          width: 1,
          type: "solid"
        }
      },
      splitLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)"
        }
      }
    }
  ], series: [
    {
      type: "bar",
      name: "销量",
      data: [1200, 800, 300, 500, 560, 220],
      barWidth: "25%",
      itemStyle: {
        normal: {
          color: "#2f89cf",
          opacity: 1,
          barBorderRadius: 5
        }
      }
    }, {
      type: "bar",
      name: "订单",
      data: [1000, 750, 380, 450, 450, 120],
      barWidth: "25%",
      itemStyle: {
        normal: {
          color: "#46d000",
          opacity: 1,
          barBorderRadius: 5
        }
      }
    }
  ]
};

let chartLeft3 = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
      type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    }
  },
  grid: {
    left: "0%",
    top: "-5px",
    right: "3%",
    bottom: "4%",
    containLabel: true
  },
  xAxis: {
    type: 'value',
    axisLabel: {
      show: true,
      textStyle: {
        color: "rgba(255,255,255,.6)",
        fontSize: "12"
      }
    },
    axisTick: {
      show: false
    },
    axisLine: {
      show: true,
      lineStyle: {
        color: "rgba(255,255,255,.1	)",
        width: 1,
        type: "solid"
      }
    },
    splitLine: {
      lineStyle: {
        color: "rgba(255,255,255,.1)"
      }
    }
  },
  yAxis: {
    type: 'category',
    axisLabel: {
      show: true,
      textStyle: {
        color: "rgba(255,255,255,.6)",
        fontSize: "12"
      }
    },
    axisTick: {
      show: false
    },
    axisLine: {
      show: true,
      lineStyle: {
        color: "rgba(255,255,255,.1	)",
        width: 1,
        type: "solid"
      }
    },
    splitLine: {
      lineStyle: {
        color: "rgba(255,255,255,.1)"
      }
    },
    data: ['周一', '周二', '周三', '周四', '周五']
  },
  series: [
    {
      name: '直接访问',
      type: 'bar',
      stack: '总量',
      label: {
        show: true,
        position: 'insideRight'
      },
      barWidth: "55%",
      itemStyle: {
        normal: {
          color: "#2f89cf",
          opacity: 1,
          barBorderRadius: 5
        }
      },
      data: [120, 302, 400, 200, 700]
    }
  ]
};

let chartRight1 = {
  title: {},
  tooltip: {
    trigger: "axis",
    axisPointer: {
      type: "cross",
      label: {
        backgroundColor: "#6a7985"
      }
    }
  },

  color: ["#ffab6f", "#09b916", "#83cddc"], //图例颜色
  legend: {
    top: "0%",
    icon: "roundRect",
    data: ["销售订单", "退货订单", "折扣订单"],
    textStyle: {
      color: "rgba(255,255,255,.5)",
      fontSize: "12"
    }
  },
  toolbox: {
    feature: {}
  },
  grid: {
    left: "10",
    top: "20",
    right: "10",
    bottom: "10",
    containLabel: true
  },
  xAxis: [
    {
      type: "category",
      boundaryGap: false,
      axisLabel: {
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: 12
        }
      },
      axisLine: {
        lineStyle: {
          color: "rgba(255,255,255,.2)"
        }
      },
      data: [
        "2020.06.15",
        "2020.06.16",
        "2020.06.17",
        "2020.06.18",
        "2020.06.19",
        "2020.06.20",
        "2020.06.21",
        "2020.06.22"
      ]
    }
  ],
  yAxis: [
    {
      type: "value",
      axisTick: { show: false },
      minInterval: 60,
      axisLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)"
        }
      },
      axisLabel: {
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: 12
        }
      },

      splitLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)"
        }
      }
    }
  ],
  series: [
    {
      name: "销售订单",
      type: "line",
      smooth: true,
      lineStyle: {
        color: "#45d4ba",
        width: 1
      }, //线条的样式
      areaStyle: {
        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          {
            offset: 0,
            color: "#83cddc"
          },
          {
            offset: 1,
            color: "#bfdffbb5"
          }
        ])
      },
      data: [5, 22, 150, 54, 1, 230, 4, 1]
    },
    {
      name: "退货订单",
      type: "line",

      smooth: true,
      lineStyle: {
        color: "#04a710",
        width: 1
      }, //
      areaStyle: {
        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          {
            offset: 0,
            color: "#0cbf22"
          },
          {
            offset: 1,
            color: "#b8f7d1b5"
          }
        ])
      },
      data: [10, 150, 1, 250, 20, 100, 10, 150]
    },
    {
      name: "折扣订单",
      type: "line",

      lineStyle: {
        color: "#0864c3",
        width: 1
      }, //线条的样式
      smooth: true,
      areaStyle: {
        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          {
            offset: 0,
            color: "#29d7ff"
          },
          {
            offset: 1,
            color: "#34ccef85"
          }
        ])
      },
      data: [100, 2, 260, 1, 200, 30, 101, 40]
    }
  ]
};

var gauge = {
  series: [{
    radius: '90%',
    type: 'gauge',
    startAngle: 180,
    endAngle: 0,
    min: 0,
    max: 1,
    splitNumber: 8,
    axisLine: {
      lineStyle: {
        width: 3,
        color: [
          [0.25, '#FF6E76'],
          [0.5, '#FDDD60'],
          [0.75, '#58D9F9'],
          [1, '#7CFFB2']
        ]
      }
    },
    pointer: {
      icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
      length: '12%',
      width: 20,
      offsetCenter: [0, '-60%'],
      itemStyle: {
        color: 'auto'
      }
    },
    axisTick: {
      length: 12,
      lineStyle: {
        color: 'auto',
        width: 2
      }
    },
    splitLine: {
      length: 20,
      lineStyle: {
        color: 'auto',
        width: 5
      }
    },
    axisLabel: {
      color: '#464646',
      fontSize: 20,
      distance: -60,
      formatter: function (value) {
        if (value === 0.875) {
          return '优';
        }
        else if (value === 0.625) {
          return '中';
        }
        else if (value === 0.375) {
          return '良';
        }
        else if (value === 0.125) {
          return '差';
        }
      }
    },
    title: {
      offsetCenter: [0, '-20%'],
      fontSize: 20
    },
    detail: {
      fontSize: 30,
      offsetCenter: [0, '0%'],
      valueAnimation: true,
      formatter: function (value) {
        return Math.round(value * 100) + '分';
      },
      color: 'auto'
    },
    data: [{
      value: 0.70,
      name: '成绩评定'
    }]
  }]
}
export { chartLeft1, chartLeft2, chartLeft3, chartRight1, gauge }
