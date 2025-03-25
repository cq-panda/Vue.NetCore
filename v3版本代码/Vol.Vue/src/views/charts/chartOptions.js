let options= {
    bar: {
      color: ["#3398DB"],
      tooltip: {
        trigger: "axis",
        axisPointer: {
          // 坐标轴指示器，坐标轴触发有效
          type: "shadow" // 默认为直线，可选为：'line' | 'shadow'
        }
      },
      grid: {
        left: "3%",
        right: "4%",
        bottom: "3%",
        containLabel: true
      },
      xAxis: [
        {
          type: "category",
          data: [
            "1月",
            "2月",
            "3月",
            "4月",
            "5月",
            "6月",
            "7月",
            "8月",
            "9月",
            "10月",
            "11月",
            "12月"
          ],
          axisTick: {
            alignWithLabel: true
          }
        }
      ],
      yAxis: [
        {
          type: "value"
        }
      ],
      series: [
        {
          name: "直接访问",
          type: "bar",
          barWidth: "60%",
          data: [120, 80, 210, 110, 160, 200, 334, 390, 290, 220, 280, 140]
        }
      ]
    },
    pie: {
      tooltip: {
        trigger: "item",
        formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
        top: 20,
        // orient: "vertical",
        // right: 300,
        // top: 200,
        // bottom: 20,
        data: [
          "图例1",
          "图例2",
          "图例3",
          "图例4",
          "图例5",
          "图例6",
          "图例7"
        ]
      },
      series: [
        {
          name: "图例1",
          type: "pie",
          radius: "60%",
          selectedMode: "single",
          data: [
            {
              value: 2563,
              name: "图例1",
              itemStyle: {
                color: "rgb(45, 140, 240)"
              }
            },
            {
              value: 727,
              name: "图例2",
              itemStyle: {
                color: "rgb(92, 173, 255)"
              }
            },
            {
              value: 2182,
              name: "图例3",
              itemStyle: {
                color: "rgb(25, 190, 107)"
              }
            },
            {
              value: 1419,
              name: "图例4",
              itemStyle: {
                color: "#00e5ff"
              }
            },
            {
              value: 984,
              name: "图例5",
              itemStyle: {
                color: "#ff80ab"
              }
            },
            {
              value: 870,
              name: "图例6",
              itemStyle: {
                color: "rgb(237, 64, 20)"
              }
            },
            {
              value: 1670,
              name: "图例7",
              itemStyle: {
                color: "#ffb445"
              }
            }
          ]
        }
      ]
    },
    line: {
      legend: {
        data: ["邮件营销", "联盟广告"]
      },
      grid: {
        left: "3%",
        right: "4%",
        bottom: "3%",
        containLabel: true
      },
      toolbox: {
        feature: {
          saveAsImage: {}
        }
      },
      xAxis: {
        type: "category",
        boundaryGap: false,
        data: [
          "1月",
          "2月",
          "3月",
          "4月",
          "5月",
          "6月",
          "7月",
          "8月",
          "9月",
          "10月",
          "11月",
          "12月"
        ]
      },
      yAxis: {
        type: "value"
      },
      series: [
        {
          name: "邮件营销",
          type: "line",
          stack: "总量",
          itemStyle: {
            color: "rgb(25, 190, 107)"
          },
          smooth: true,
          data: [
            7.0,
            6.9,
            9.5,
            12.5,
            18.2,
            21.5,
            22.5,
            23.3,
            18.3,
            13.9,
            9.6
          ]
        },
        {
          name: "联盟广告",
          type: "line",
          stack: "总量",
          smooth: true,
          itemStyle: {
            color: "rgb(92, 173, 255)"
          },
          data: [
            7.0,
            6.9,
            9.5,
            14.5,
            18.2,
            21.5,
            22.5,
            21.3,
            18.3,
            13.9,
            9.6
          ]
        }
      ]
    }
  }

  export default options;