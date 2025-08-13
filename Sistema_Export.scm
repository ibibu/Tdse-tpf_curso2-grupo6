{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "angle": 0,
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "Sistema Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event EV_SYST_SETUP_ON\n    in event EV_SYST_SETUP_OFF\n    in event EV_SYST_PACK_IN\n    in event EV_SYST_PACK_OUT\n    in event EV_SYST_NO_PACKS\n    in event EV_SYST_CTRL_OFF\n    in event EV_SYST_CTRL_ON\n    in event EV_SYST_FAIL\n    var qty_packs : integer = 0\n    var speed : integer = 0\n    var packs_change_speed : integer = 0\n    var waiting_time : integer = 0\n    var tick : integer = 0\n    var option : integer = 0\n    var DEL_MAX_SPEED : integer = 5\n    var DEL_MAX_PACKS : integer = 10\n    in event EV_SETUP_ESCAPE\n    in event EV_SETUP_EXIT\n    in event EV_SETUP_NEXT\n    in event EV_SETUP_ENTER\n    var DEL_MAX_WAITING_TIME : integer = 5\n    in event EV_FAIL_ENTER\n    in event EV_FAIL_ESCAPE\n    in event EV_FAIL_NEXT\n    in event EV_FAIL_EXIT\n    \n    "
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 666,
          "y": 35.5
        },
        "size": {
          "height": 661,
          "width": 1443
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2e750fba-1ab8-483b-b758-1b408a56252a",
        "z": 117,
        "embeds": [
          "37e331ae-23cf-42f4-800b-ba14b1fa60ff"
        ],
        "attrs": {
          "name": {
            "text": "ST_SYST_SETUP",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -321.5,
          "y": 206
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 137,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -321.5,
          "y": 221
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 138,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -252,
          "y": 198
        },
        "size": {
          "height": 60,
          "width": 89.17708587646484
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 140,
        "attrs": {
          "name": {
            "text": "ST_SYST_IDLE",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "z": 141,
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 99,
          "y": 198
        },
        "size": {
          "height": 290,
          "width": 125
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "db372094-acc6-467b-b44d-495606208445",
        "z": 142,
        "embeds": [
          "26bf66ea-35b4-4134-935c-24525272dabe",
          "0e3955cf-b6bf-44c2-8cb6-6e52e72a630c",
          "553d94f9-d99d-4e00-9064-1b5d5f9443be",
          "ef0592d3-f57a-49d1-a278-81435e53971a",
          "fe0aa504-3177-469b-aa7d-d45fb4840daf",
          "000d821e-205d-4d9b-9723-943fc3edee8b"
        ],
        "attrs": {
          "name": {
            "text": "ST_SYST_CTRL",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "x": 810,
          "y": 65,
          "id": "2e750fba-1ab8-483b-b758-1b408a56252a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 143,
              "dy": 29.500001907348633,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_SETUP_ON /\r\nqty_packs = 0;\r\n    speed = 20;\r\n    packs_change_speed = 1;\r\n    waiting_time = 5;\r\n    tick = 0;\r\n    option = 1"
              }
            },
            "position": {
              "distance": 0.5087614184416591,
              "offset": -50,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b4782bfc-79f5-4de6-bc7c-42f3a6ef4ed3",
        "z": 145,
        "vertices": [
          {
            "x": -248,
            "y": 85
          },
          {
            "x": 17,
            "y": 10
          },
          {
            "x": 397,
            "y": 33
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 28,
              "dy": 9.936737060546875,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_CTRL_ON /\r\nqty_packs = 0;\r\n    speed = 20;\r\n    packs_change_speed = 1;\r\n    waiting_time = 5;\r\n    tick = 0"
              }
            },
            "position": {
              "distance": 0.4941267036863887,
              "offset": 53,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4d595610-2927-4b8e-b2aa-51d099dc3762",
        "z": 146,
        "vertices": [
          {
            "x": -7,
            "y": 42
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "x": 689,
          "y": 115,
          "id": "2e750fba-1ab8-483b-b758-1b408a56252a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 22,
              "dy": 79.50000190734863,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_SETUP_ON / option = 1"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ad7661ec-2006-474f-a864-cc12d0a687b5",
        "z": 147,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 111,
              "dy": 73.93673706054688,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_PACK_IN \n[qty_packs < DEL_MAX_PACKS]\n/ qty_packs++"
              }
            },
            "position": {
              "distance": 0.543373087076566,
              "offset": -96,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "000d821e-205d-4d9b-9723-943fc3edee8b",
        "z": 148,
        "parent": "db372094-acc6-467b-b44d-495606208445",
        "vertices": [
          {
            "x": 210,
            "y": 177
          },
          {
            "x": 303,
            "y": 177
          },
          {
            "x": 303,
            "y": 271.94
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 107,
              "dy": 221.93673706054688,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_PACK_IN \n[((qty_packs % packs_change_speed) == 0)\n&& (speed > 0)\n&& (qty_packs < DEL_MAX_PACKS)]\n/ speed--; qty_packs ++"
              }
            },
            "position": {
              "distance": 0.5227327439737538,
              "offset": -148,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "fe0aa504-3177-469b-aa7d-d45fb4840daf",
        "z": 149,
        "parent": "db372094-acc6-467b-b44d-495606208445",
        "vertices": [
          {
            "x": 290,
            "y": 324
          },
          {
            "x": 290,
            "y": 362
          },
          {
            "x": 270,
            "y": 419.94
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 96,
              "dy": 280.9367370605469,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_NO_PACKS [qty_packs == 0]\n/ tick++"
              }
            },
            "position": {
              "distance": 0.6922437914155859,
              "offset": 79.5954783161847,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "5"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ef0592d3-f57a-49d1-a278-81435e53971a",
        "z": 150,
        "parent": "db372094-acc6-467b-b44d-495606208445",
        "vertices": [
          {
            "x": 161.5,
            "y": 523
          },
          {
            "x": 195,
            "y": 523
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 97,
              "dy": 244.93673706054688,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_NO_PACKS [(tick == waiting_time) \n&& (qty_packs == 0)]\n/ raise EV_SYST_CTRL_OFF"
              }
            },
            "position": {
              "distance": 0.45201433068040825,
              "offset": 145.89596557617188,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "6"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "553d94f9-d99d-4e00-9064-1b5d5f9443be",
        "z": 151,
        "parent": "db372094-acc6-467b-b44d-495606208445",
        "vertices": [
          {
            "x": 297,
            "y": 487
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 67.93673706054688,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_PACK_OUT\n[((qty_packs & packs_change_speed) == 0)\n&& (speed < DEL_MAX_SPEED)\n&& (qty_packs > 0)]\n/ speed++; qty_packs --"
              }
            },
            "position": {
              "distance": 0.32148853437194813,
              "offset": 13.798126220703125,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "7"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0e3955cf-b6bf-44c2-8cb6-6e52e72a630c",
        "z": 153,
        "parent": "db372094-acc6-467b-b44d-495606208445",
        "vertices": [
          {
            "x": 11,
            "y": 223
          },
          {
            "x": -58,
            "y": 245
          },
          {
            "x": 18,
            "y": 265.94
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 9,
              "dy": 139.93673706054688,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_PACK_OUT\n[(qty_packs > 0)]\n/ qty_packs ++"
              }
            },
            "position": {
              "distance": 0.5374704459640235,
              "offset": 62,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "8"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "26bf66ea-35b4-4134-935c-24525272dabe",
        "z": 154,
        "parent": "db372094-acc6-467b-b44d-495606208445",
        "vertices": [
          {
            "x": 47,
            "y": 301
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2e750fba-1ab8-483b-b758-1b408a56252a"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 32,
              "dy": 281.9367370605469,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_SETUP_OFF / option = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ca2667c7-dc1b-4d0f-8549-0c7154c78daa",
        "z": 155,
        "vertices": [
          {
            "x": 230,
            "y": 602
          }
        ],
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 667,
          "y": 57.30000114440918
        },
        "size": {
          "height": 638.1999988555908,
          "width": 1441
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "z": 173,
        "embeds": [
          "4b714bac-e90e-4908-8219-c8ef7ccc974e",
          "b6d367a9-7771-45cf-b5a2-5693bf8cacc3",
          "f6778c9d-0caf-483d-8cc0-a4b326a53e7a",
          "2865e81d-cde4-4f79-aa90-6ae7721f0959",
          "20388c43-994a-4b8f-baae-6a2ed7dcef96",
          "f00965c9-f02a-41aa-8281-6c269983f40f",
          "afcd6508-f6ac-4199-a545-2c5244e1adef",
          "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
          "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
          "1460a771-6ec0-4b23-9204-2d4b03ac9bb7"
        ],
        "parent": "2e750fba-1ab8-483b-b758-1b408a56252a",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 821,
          "y": 160.5
        },
        "size": {
          "height": 249.5,
          "width": 177
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
        "z": 174,
        "embeds": [
          "77b635c5-e47c-4f3a-855a-0184fa8510cc",
          "0a8416f3-1de2-4e98-995a-2e7d554cc07d"
        ],
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "attrs": {
          "name": {
            "text": "ST_SETUP_INIT_MENU",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 722,
          "y": 180
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "afcd6508-f6ac-4199-a545-2c5244e1adef",
        "z": 175,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "embeds": [
          "9a77fb1f-3ca1-4f2b-819a-4209eda93012"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 1344,
          "y": 428
        },
        "size": {
          "height": 60,
          "width": 181.5500030517578
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
        "z": 176,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "embeds": [
          "c69efdec-e96a-4a35-a452-e14cd48aeb2f",
          "6afa2ef9-2eaa-409b-8c60-e0536e3704a5"
        ],
        "attrs": {
          "name": {
            "text": "ST_SETUP_MENU_WAITING_TIME",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1353.900001525879,
          "y": 153
        },
        "size": {
          "height": 70,
          "width": 171.6500015258789
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
        "z": 177,
        "embeds": [
          "f4f46036-98a1-4c19-87d8-eab14a2121b8",
          "24ecfe11-9aab-41b3-80f3-991182a6c76c"
        ],
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "attrs": {
          "name": {
            "text": "ST_SETUP_MENU_PACKS_LIM",
            "fontSize": 12
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 722,
          "y": 195
        },
        "id": "9a77fb1f-3ca1-4f2b-819a-4209eda93012",
        "z": 185,
        "parent": "afcd6508-f6ac-4199-a545-2c5244e1adef",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "afcd6508-f6ac-4199-a545-2c5244e1adef"
        },
        "target": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 12,
              "dy": 36.30743408203125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "20388c43-994a-4b8f-baae-6a2ed7dcef96",
        "z": 186,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d"
        },
        "target": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 168,
              "dy": 39.30743408203125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_ESCAPE / option = 1"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f6778c9d-0caf-483d-8cc0-a4b326a53e7a",
        "z": 186,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97"
        },
        "target": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 136,
              "dy": 211.30743408203125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_ESCAPE / option = 1"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b6d367a9-7771-45cf-b5a2-5693bf8cacc3",
        "z": 186,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "vertices": [
          {
            "x": 1108,
            "y": 371.81
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f"
        },
        "target": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 17,
              "dy": 167.30743408203125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_NEXT [option == 1] / \noption = 2"
              }
            },
            "position": {
              "distance": 0.7231602129045038,
              "offset": 23.943189618890575,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "77b635c5-e47c-4f3a-855a-0184fa8510cc",
        "z": 186,
        "parent": "f00965c9-f02a-41aa-8281-6c269983f40f",
        "vertices": [
          {
            "x": 759,
            "y": 269
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f"
        },
        "target": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 55,
              "dy": 243.30743408203125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_NEXT [option == 2] / option = 1"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0a8416f3-1de2-4e98-995a-2e7d554cc07d",
        "z": 186,
        "parent": "f00965c9-f02a-41aa-8281-6c269983f40f",
        "vertices": [
          {
            "x": 919,
            "y": 478
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f"
        },
        "target": {
          "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 95.0999755859375,
              "dy": 52.15777587890625,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_ENTER [option == 1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "2865e81d-cde4-4f79-aa90-6ae7721f0959",
        "z": 186,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "vertices": [
          {
            "x": 1254,
            "y": 275
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f00965c9-f02a-41aa-8281-6c269983f40f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 152,
              "dy": 240.30743408203125,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 26,
              "dy": 33.65777587890625,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_ENTER [option == 2]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4b714bac-e90e-4908-8219-c8ef7ccc974e",
        "z": 186,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "vertices": [
          {
            "x": 1225,
            "y": 461.65999999999997
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97"
        },
        "target": {
          "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 136,
              "dy": 50.65777587890625,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_NEXT [waiting_time == DEL_MAX_WAITING_TIME] / waiting_time = 1"
              }
            },
            "position": {
              "distance": 0.7783600609045774,
              "offset": 12.732669566817197,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6afa2ef9-2eaa-409b-8c60-e0536e3704a5",
        "z": 186,
        "parent": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
        "vertices": [
          {
            "x": 1397,
            "y": 513
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97"
        },
        "target": {
          "id": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 170,
              "dy": 36.65777587890625,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_NEXT / waiting_time ++"
              }
            },
            "position": {
              "distance": 0.49966517378015984,
              "offset": 121,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c69efdec-e96a-4a35-a452-e14cd48aeb2f",
        "z": 187,
        "parent": "954f32b1-dd0a-4205-bba9-3f5a9a55cc97",
        "vertices": [
          {
            "x": 1617,
            "y": 485
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d"
        },
        "target": {
          "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 150.0999755859375,
              "dy": 56.15777587890625,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_NEXT [packs_change_speed >= DEL_MAX_PACKS] / packs_change_speed = 1"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f4f46036-98a1-4c19-87d8-eab14a2121b8",
        "z": 188,
        "parent": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
        "vertices": [
          {
            "x": 1792,
            "y": 164.5
          },
          {
            "x": 1658,
            "y": 209.16000000000003
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d"
        },
        "target": {
          "id": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 96.0999755859375,
              "dy": 15.15777587890625,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_EXIT [packs_change_speed < DEL_MAX_PACKS] / packs_change_speed ++"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "24ecfe11-9aab-41b3-80f3-991182a6c76c",
        "z": 189,
        "vertices": [
          {
            "x": 1409,
            "y": 113
          }
        ],
        "parent": "30f95c3d-43cb-480d-b99b-b9bf1fe75e5d",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 678,
          "y": 724
        },
        "size": {
          "height": 830,
          "width": 1300
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "970071c7-4bf6-440e-ae1c-db834fd574a4",
        "z": 226,
        "embeds": [
          "b92900be-b762-4731-9b8c-25a672d48a7c"
        ],
        "attrs": {
          "name": {
            "text": "ST_SYST_FAIL",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 23,
              "dy": 53,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_CTRL_OFF /\r\nqty_packs = 0;\r\n    speed = 0;\r\n    packs_change_speed = 0;\r\n    waiting_time = 0;\r\n    tick = 0"
              }
            },
            "position": {
              "distance": 0.4578967120629215,
              "offset": 42,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "3a87202b-6c60-485d-801e-3ba015a7cdbb",
        "z": 244,
        "vertices": [
          {
            "x": 144,
            "y": 552
          },
          {
            "x": -6,
            "y": 473
          },
          {
            "x": -70,
            "y": 473
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 15,
              "dy": 45,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "x": 765,
          "y": 872,
          "id": "970071c7-4bf6-440e-ae1c-db834fd574a4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 86,
              "dy": 93.00001335144043,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYST_FAIL /\r\noption = 0;      \r\n    tick = 0"
              }
            },
            "position": {
              "distance": 0.5395337145700766,
              "offset": -24.999999999999886,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c2af6a4c-b1ca-4dcc-a1ab-0d1c2831175b",
        "z": 245,
        "vertices": [
          {
            "x": -237,
            "y": 550
          },
          {
            "x": -170,
            "y": 817
          }
        ],
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 679,
          "y": 745.7916679382324
        },
        "size": {
          "height": 807.2083320617676,
          "width": 1298
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "z": 337,
        "embeds": [
          "92567341-2a70-468f-a106-6bf9346b3316",
          "b2263160-43e0-4f9e-8803-eb8e97d07e59",
          "a2b426d1-420f-4094-a481-d6342dae7d09",
          "0ee6d1df-2d4e-4a83-988f-a6478924201b",
          "4b921350-81ff-42fd-8b56-e6258b72d557",
          "58a5dba9-40da-455b-8730-d88ed4a1e62b",
          "c4b16c25-5499-40f0-8e90-cc42e782337f",
          "1c0f70c1-645a-4395-8aba-923af60a7043",
          "73151683-90fc-4325-86a0-a3cdeb9285b1",
          "78f0deba-6eb1-4830-9d9f-dc1022bea2ba"
        ],
        "parent": "970071c7-4bf6-440e-ae1c-db834fd574a4",
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 734,
          "y": 836.9916667938232
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "58a5dba9-40da-455b-8730-d88ed4a1e62b",
        "z": 338,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "embeds": [
          "97096141-a51e-4035-9620-92e5856d5776"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 842,
          "y": 854.9916667938232
        },
        "size": {
          "height": 264,
          "width": 226
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "c4b16c25-5499-40f0-8e90-cc42e782337f",
        "z": 339,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "embeds": [],
        "attrs": {
          "name": {
            "text": "ST_FAIL_INIT_MENU",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1304,
          "y": 836.9916667938232
        },
        "size": {
          "height": 91,
          "width": 160
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "1c0f70c1-645a-4395-8aba-923af60a7043",
        "z": 340,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "embeds": [
          "9770b9e5-7008-4c49-b712-f5ecc81ccb4a",
          "70fe31ad-c10c-4c88-8e76-9ed63683b1cc"
        ],
        "attrs": {
          "name": {
            "text": "ST_FAIL_MENU_TEMP_LIM",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1304,
          "y": 1049.7916679382324
        },
        "size": {
          "height": 103,
          "width": 193
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "73151683-90fc-4325-86a0-a3cdeb9285b1",
        "z": 341,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "embeds": [
          "450ba786-dc9c-45da-a0c0-7ed60b77a06b",
          "5466de74-5eee-4587-8752-922176b47ae1"
        ],
        "attrs": {
          "name": {
            "text": "ST_FAIL_MENU_BTN_FAIL_ON",
            "fontSize": 12
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 734,
          "y": 851.9916667938232
        },
        "id": "97096141-a51e-4035-9620-92e5856d5776",
        "z": 347,
        "parent": "58a5dba9-40da-455b-8730-d88ed4a1e62b",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "1c0f70c1-645a-4395-8aba-923af60a7043"
        },
        "target": {
          "id": "c4b16c25-5499-40f0-8e90-cc42e782337f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 200,
              "dy": 125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_ESCAPE/\r\noption = 0   \r\n// Volver al menú principal de falla"
              }
            },
            "position": {
              "distance": 0.5823652758796161,
              "offset": 25,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a2b426d1-420f-4094-a481-d6342dae7d09",
        "z": 348,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "73151683-90fc-4325-86a0-a3cdeb9285b1"
        },
        "target": {
          "id": "c4b16c25-5499-40f0-8e90-cc42e782337f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 104,
              "dy": 229,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_ESCAPE/\r\noption = 0   // Volver al menú principal de falla"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "92567341-2a70-468f-a106-6bf9346b3316",
        "z": 348,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "vertices": [
          {
            "x": 1144,
            "y": 1237.9916667938232
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "c4b16c25-5499-40f0-8e90-cc42e782337f"
        },
        "target": {
          "id": "73151683-90fc-4325-86a0-a3cdeb9285b1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 48,
              "dy": 66.39990234375,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_ENTER [option == 1]/\r\noption = 2\r\n// Selección de menú de botón de falla"
              }
            },
            "position": {
              "distance": 0.6967889973662784,
              "offset": 16.71875,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b2263160-43e0-4f9e-8803-eb8e97d07e59",
        "z": 348,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "vertices": [
          {
            "x": 1212,
            "y": 1049.9916667938232
          },
          {
            "x": 1242,
            "y": 1116.1916667938233
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "c4b16c25-5499-40f0-8e90-cc42e782337f"
        },
        "target": {
          "id": "1c0f70c1-645a-4395-8aba-923af60a7043",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 6,
              "dy": 57.20001220703125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_ENTER [option == 1]/\r\noption = 2\r\n// Selección de menú de botón de falla"
              }
            },
            "position": {
              "distance": 0.5847457627118644,
              "offset": -34.9999877929688,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0ee6d1df-2d4e-4a83-988f-a6478924201b",
        "z": 348,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "58a5dba9-40da-455b-8730-d88ed4a1e62b"
        },
        "target": {
          "id": "c4b16c25-5499-40f0-8e90-cc42e782337f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 8,
              "dy": 63.54296875,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4b921350-81ff-42fd-8b56-e6258b72d557",
        "z": 348,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "vertices": [
          {
            "x": 743,
            "y": 918.5316667938232
          },
          {
            "x": 810,
            "y": 918.5316667938232
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "1c0f70c1-645a-4395-8aba-923af60a7043"
        },
        "target": {
          "id": "1c0f70c1-645a-4395-8aba-923af60a7043",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 120,
              "dy": 31.20001220703125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_EXIT/\r\n    option = 0;             // Salir del menú\r\n    qty_packs = 0;          // Reset cantidad de paquetes\r\n    speed = 0;              // Reset velocidad\r\n    packs_change_speed = 0; // Reset cambios de velocidad\r\n    waiting_time = 0;       // Reset tiempo de espera\r\n    tick = 0             // Reset contador interno\r\n"
              }
            },
            "position": {
              "distance": 0.9205860852755192,
              "offset": -209.954345703125,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "70fe31ad-c10c-4c88-8e76-9ed63683b1cc",
        "z": 348,
        "parent": "1c0f70c1-645a-4395-8aba-923af60a7043",
        "vertices": [
          {
            "x": 1384,
            "y": 793.9916667938232
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "1c0f70c1-645a-4395-8aba-923af60a7043"
        },
        "target": {
          "id": "1c0f70c1-645a-4395-8aba-923af60a7043",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 148,
              "dy": 60.5958251953125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_NEXT [option == 0] /\r\noption = 1\r\n// Selección de menú de temperatura"
              }
            },
            "position": {
              "distance": 0.5091020686560384,
              "offset": 48.00833933534747,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9770b9e5-7008-4c49-b712-f5ecc81ccb4a",
        "z": 349,
        "parent": "1c0f70c1-645a-4395-8aba-923af60a7043",
        "vertices": [
          {
            "x": 1830,
            "y": 926.99
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "73151683-90fc-4325-86a0-a3cdeb9285b1"
        },
        "target": {
          "id": "73151683-90fc-4325-86a0-a3cdeb9285b1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 49,
              "dy": 17.7957763671875,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_EXIT/\r\n    option = 0;             // Salir del menú\r\n    qty_packs = 0;          // Reset cantidad de paquetes\r\n    speed = 0;              // Reset velocidad\r\n    packs_change_speed = 0; // Reset cambios de velocidad\r\n    waiting_time = 0;       // Reset tiempo de espera\r\n    tick = 0             // Reset contador interno\r\n"
              }
            },
            "position": {
              "distance": 0.160164616183508,
              "offset": 208.7547607421875,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5466de74-5eee-4587-8752-922176b47ae1",
        "z": 350,
        "parent": "73151683-90fc-4325-86a0-a3cdeb9285b1",
        "vertices": [
          {
            "x": 1433,
            "y": 1017.9916667938232
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "73151683-90fc-4325-86a0-a3cdeb9285b1"
        },
        "target": {
          "id": "73151683-90fc-4325-86a0-a3cdeb9285b1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 186,
              "dy": 35.199951171875,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_FAIL_NEXT [option == 0] /\r\noption = 1\r\n// Selección de menú de temperatura"
              }
            },
            "position": {
              "distance": 0.46665725170710354,
              "offset": 141.96815295606214,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "450ba786-dc9c-45da-a0c0-7ed60b77a06b",
        "z": 351,
        "parent": "73151683-90fc-4325-86a0-a3cdeb9285b1",
        "vertices": [
          {
            "x": 1640,
            "y": 1124.99
          }
        ],
        "attrs": {}
      },
      {
        "type": "Note",
        "position": {
          "x": 400,
          "y": 510
        },
        "size": {
          "width": 194.75,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "673e4ae4-585f-4ed0-ba3f-1ebb328ad49c",
        "z": 352,
        "attrs": {
          "root": {
            "display": ""
          },
          "label": {
            "text": "SI PASO EL TIEMPO DE\nESPERA, SE APAGA EL SISTEMA\nDE CONTROL"
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": -170,
          "y": 570
        },
        "size": {
          "width": 270,
          "height": 90
        },
        "angle": 0,
        "linkable": false,
        "id": "c5695c63-5127-4dd6-96d6-b086455e0291",
        "z": 354,
        "attrs": {
          "root": {
            "display": ""
          },
          "label": {
            "text": "SISTEMA SE INICIALIZA\nCON UNOS PAAMETROS POR DEFAULT.\nSI SE QUISIERAN CMABIAR SE DEBE ENTRAR \nAL MENU SETUP PARA CONFIGURAR.",
            "annotations": [
              {
                "start": 0,
                "end": 124,
                "attrs": {
                  "fill": "#333333",
                  "font-size": 12,
                  "font-weight": "normal",
                  "text-decoration": "none",
                  "font-style": "normal",
                  "font-family": "'Roboto Mono', monospace"
                }
              }
            ]
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": -366.5,
          "y": -79.99999237060547
        },
        "size": {
          "width": 296.4349060058594,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "abb9f81f-e07f-4759-89f5-52e41bfb47a8",
        "z": 355,
        "attrs": {
          "root": {
            "display": ""
          },
          "label": {
            "text": "MODO NORMAL: MONITOREA Y CONTROLA DE MANERA\nSEGURA EL INGRESO/EGRESO A/DE LA CINTA, EN\nFORMA SEGURA.",
            "annotations": [
              {
                "start": 0,
                "end": 100,
                "attrs": {
                  "fill": "#333333",
                  "font-size": 12,
                  "font-weight": "normal",
                  "text-decoration": "none",
                  "font-style": "normal",
                  "font-family": "'Roboto Mono', monospace"
                }
              }
            ]
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": 1680,
          "y": 300
        },
        "size": {
          "width": 321.4375305175781,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "1460a771-6ec0-4b23-9204-2d4b03ac9bb7",
        "z": 356,
        "parent": "37e331ae-23cf-42f4-800b-ba14b1fa60ff",
        "attrs": {
          "root": {
            "display": ""
          },
          "label": {
            "text": "MODO SETUP: PERMITE LEER Y MODIFICAR LOS\nPARAMETROS DE OPERACION DEL SISTEMA DE CONTROL",
            "annotations": [
              {
                "start": 0,
                "end": 87,
                "attrs": {
                  "fill": "#333333",
                  "font-size": 12,
                  "font-weight": "normal",
                  "text-decoration": "none",
                  "font-style": "normal",
                  "font-family": "'Roboto Mono', monospace"
                }
              }
            ]
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": 1480,
          "y": 1200
        },
        "size": {
          "width": 270,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "78f0deba-6eb1-4830-9d9f-dc1022bea2ba",
        "z": 357,
        "parent": "b92900be-b762-4731-9b8c-25a672d48a7c",
        "attrs": {
          "root": {
            "display": ""
          },
          "label": {
            "text": "EL SISTEMA ENTRA EN MODO FALLA CUANDO\nOCUURRE ALGUN ERROR DENTRO DEL SISTEMA.",
            "annotations": [
              {
                "start": 0,
                "end": 77,
                "attrs": {
                  "fill": "#333333",
                  "font-size": 12,
                  "font-weight": "normal",
                  "text-decoration": "none",
                  "font-style": "normal",
                  "font-family": "'Roboto Mono', monospace"
                }
              }
            ]
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": 300,
          "y": 120
        },
        "size": {
          "width": 255.45834350585938,
          "height": 67.8666763305664
        },
        "angle": 0,
        "linkable": false,
        "id": "08d6f9ca-43f7-47b8-9da1-b0a49402bcc9",
        "z": 358,
        "attrs": {
          "root": {
            "display": ""
          },
          "label": {
            "text": "SI EL MODULO DA 0, SIGNIFICA ES\nMULTIPLO POR LA CANTIDAD DE PAQUETES \nQUE HAY QUE AGREGAR PARA SUBIR/BAJAR \nLA VELOCIDAD",
            "annotations": [
              {
                "start": 0,
                "end": 120,
                "attrs": {
                  "fill": "#333333",
                  "font-size": 12,
                  "font-weight": "normal",
                  "text-decoration": "none",
                  "font-style": "normal",
                  "font-family": "'Roboto Mono', monospace"
                }
              }
            ]
          }
        }
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SensorStatechartExport",
          "statemachinePrefix": "sensorStatechartExport",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}