export default function () {
    return {
      "title": {
        "text": "",
        "textStyle": {
          "fontSize": 16
        }
      },
      "tooltip": {
        "trigger": "axis"
      },
      "legend": {
        "padding": 5,
        "textStyle": {
          "fontSize": 12
        },
        "itemHeight": 12,
        "itemWidth": 12,
        "icon": "circle",
        "data": [
          "生产中订单",
          "待生产订单",
          "已生产订单"
        ],
        "orient": "horizontal",
      },
      "grid": {
        "left": 80,
        "bottom": 60,
        "top": 40,
        "right": 50
      },
      "xAxis": {
        "show": true,
        "axisTick": {
          "show": false
        },
        "axisLine": {
          "show": false
        },
        "splitLine": {
          "show": true
        },
        "type": "category",
        "data": [
          "2024.01",
          "2024.02",
          "2024.03",
          "2024.04",
          "2024.05",
          "2024.06",
          "2024.07",
          "2024.08",
          "2024.09",
          "2024.10",
          "2024.11",
          "2024.12"
        ],
        "color": "#b69fff"
      },


      // "#7020ff",
      // "#2EC7C9",
      // "#c3a4ff",
      "yAxis": {
        "splitNumber": 3,
        "splitLine": {
          "show": true
        },
        "type": "value",
        "axisLabel": {
          "color": "#a7a7a7"
        },
        "data": null
      },
      "series": [
        {
          "name": "待生产订单",
          "type": "bar",
          "smooth": true,
          "lineStyle": {
            "shadowOffsetX": 0,
            "shadowOffsetY": 6,
            "shadowBlur": 8,
            "shadowColor": "#28bdfa"
          },
          "stack": "total",
          "showSymbol": true,
          "label": {
            "show": true,
            "position": "top"
          },
          "emphasis": {
            "focus": "series"
          },
          "showBackground": false,
          "itemStyle": {
            "borderRadius": [
              0
            ]
          },
          "color": "#b69fff",
          "data": [
            30,
            760,
            450,
            700,
            23,
            550,
            400,
            340,
            480,
            120,
            20,
            0
          ]
        },
        {
          "name": "生产中订单",
          "type": "bar",
          "smooth": true,
          "lineStyle": {
            "shadowOffsetX": 0,
            "shadowOffsetY": 7,
            "shadowBlur": 8,
            "shadowColor": "#9fceff"
          },
          "stack": "total",
          "itemStyle": {
            "borderRadius": [
              0
            ]
          },
          "color": "#28bdfa",
          "showSymbol": true,
          "label": {
            "show": true,
            "position": "top"
          },
          "emphasis": {
            "focus": "series"
          },
          "showBackground": false,
          "data": [
            0,
            560,
            789,
            280,
            800,
            470,
            210,
            545,
            100,
            310,
            230,
            50
          ]
        },
        {
          "name": "已生产订单",
          "type": "bar",
          "smooth": true,
          "lineStyle": {
            "shadowOffsetX": 0,
            "shadowOffsetY": 6,
            "shadowBlur": 8,
            "shadowColor": "#e3d6fd"
          },
          "stack": "total",
          "showSymbol": true,
          "label": {
            "show": true,
            "position": "top"
          },
          "emphasis": {
            "focus": "series"
          },
          "color": "#63eae5",
          "showBackground": false,
          "itemStyle": {
            "borderRadius": [
              0
            ]
          },
          "data": [
            30,
            1320,
            1239,
            980,
            823,
            1020,
            610,
            885,
            580,
            430,
            250,
            50
          ]
        }
      ]
    }
  }