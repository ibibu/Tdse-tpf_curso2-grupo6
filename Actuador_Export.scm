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
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "Actuador Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface : \n    in event EV_LED_01_TURN_ON\n    in event EV_LED_01_BLINKING_ON\n    in event EV_LED_01_BLINKING_OFF\n    in event EV_LED_01_DECREASE_TIME\n    var led : integer = 0\n    var MAX_PERIOD_BLINKING:\n    integer = 10\n    var timer : integer = 10\n    \n    "
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -150,
          "y": -170
        },
        "size": {
          "height": 60,
          "width": 95.77083587646484
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "6abd8c1a-2823-4e26-a92c-656fcb7dd0b6",
        "z": 2,
        "attrs": {
          "name": {
            "text": "ST_LED_01_OFF",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -219.99998474121094,
          "y": -149
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
        "id": "fa9ce7b0-76b0-4c33-9e53-ef6d15f06628",
        "z": 4,
        "embeds": [
          "a641f1d6-649d-4905-a640-d3186c75b022"
        ],
        "attrs": {}
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -219.99998474121094,
          "y": -134
        },
        "id": "a641f1d6-649d-4905-a640-d3186c75b022",
        "z": 5,
        "parent": "fa9ce7b0-76b0-4c33-9e53-ef6d15f06628",
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
          "id": "fa9ce7b0-76b0-4c33-9e53-ef6d15f06628"
        },
        "target": {
          "id": "6abd8c1a-2823-4e26-a92c-656fcb7dd0b6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10,
              "dy": 36.33332824707031,
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
        "id": "48fa217b-8499-480f-9cf1-d65978b3ceb9",
        "z": 6,
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 50,
          "y": -320
        },
        "size": {
          "height": 60,
          "width": 89.17708587646484
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "b9f59976-0140-4cf4-9d4f-590814b2a65b",
        "z": 7,
        "embeds": [
          "2de21103-97e6-4628-b8b0-02611f97de50"
        ],
        "attrs": {
          "name": {
            "text": "ST_LED_01_ON",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 40,
          "y": -20
        },
        "size": {
          "height": 60,
          "width": 148.55209350585938
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
        "z": 8,
        "embeds": [
          "44a5f3d6-2d42-43d8-bf1c-73f73cd133bb",
          "981f5057-f4b5-48c0-8680-cb8f326d8f10",
          "c291c666-75b3-4713-8f8f-3889e761d141"
        ],
        "attrs": {
          "name": {
            "text": "ST_LED_01_BLINKING_ON",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "6abd8c1a-2823-4e26-a92c-656fcb7dd0b6"
        },
        "target": {
          "id": "b9f59976-0140-4cf4-9d4f-590814b2a65b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10,
              "dy": 36.333343505859375,
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
                "text": "EV_LED_01_TURN_ON / led = 1"
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
        "id": "4e479ec4-9274-446c-83dc-4807b2dbddeb",
        "z": 9,
        "vertices": [
          {
            "x": -120,
            "y": -283.67
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b9f59976-0140-4cf4-9d4f-590814b2a65b"
        },
        "target": {
          "id": "6abd8c1a-2823-4e26-a92c-656fcb7dd0b6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 90,
              "dy": 10,
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
                "text": "EV_LED_01_BLINKING_ON /\nled = 0"
              }
            },
            "position": {
              "distance": 0.06238027544560806,
              "offset": -96.00031280517578,
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
        "id": "56fb831e-2ece-4ade-8dea-94b3fcacd523",
        "z": 10,
        "vertices": [
          {
            "x": 90,
            "y": -190
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6abd8c1a-2823-4e26-a92c-656fcb7dd0b6"
        },
        "target": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 40,
              "dy": 16.33333396911621,
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
                "text": "EV_LED_01_BLINKING_ON \n/ timer = MAX_PERIOD_BLINKING ; \nled = 1"
              }
            },
            "position": {
              "distance": 0.5809609217022508,
              "offset": -111.79116821289062,
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
        "id": "7e6af927-c2c8-4542-8009-05c1e6517c3f",
        "z": 11,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b"
        },
        "target": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 130,
              "dy": 16.33333396911621,
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
                "text": "EV_LED_01_DECREASE_TIME [timer <= 0 && led == 0] \n/ timer = MAX_PERIOD_BLINKING ; led =1"
              }
            },
            "position": {
              "distance": 0.7712700178485008,
              "offset": -170.15167236328125,
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
        "id": "c291c666-75b3-4713-8f8f-3889e761d141",
        "z": 12,
        "parent": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
        "vertices": [
          {
            "x": 130,
            "y": -70
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b"
        },
        "target": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 130,
              "dy": 36.33333396911621,
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
                "text": "EV_LED_01_DECREASE_TIME [timer > 0] / timer--"
              }
            },
            "position": {
              "distance": 0.500000001437486,
              "offset": 165,
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
        "id": "981f5057-f4b5-48c0-8680-cb8f326d8f10",
        "z": 13,
        "parent": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
        "vertices": [
          {
            "x": 320,
            "y": 40
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b"
        },
        "target": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 90,
              "dy": 56.33333396911621,
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
                "text": "EV_LED_01_DECREASE_TIME \n[(timer <= 0) && (led == 1)] / \ntimer = MAX_PERIOD_BLINKING ; led = 0"
              }
            },
            "position": {
              "distance": 0.6560276293633084,
              "offset": 46.429258897065864,
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
        "id": "44a5f3d6-2d42-43d8-bf1c-73f73cd133bb",
        "z": 14,
        "parent": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b",
        "vertices": [
          {
            "x": 80,
            "y": 90
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2ddc022b-dd4a-4440-a120-5fcce7a4ab2b"
        },
        "target": {
          "id": "6abd8c1a-2823-4e26-a92c-656fcb7dd0b6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 20,
              "dy": 50,
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
                "text": "EV_LED_01_BLINKING_OFF /\ntimer = 0; led = 0"
              }
            },
            "position": {}
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
        "id": "1e4d58b0-6600-49bb-9277-04171644c325",
        "z": 15,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b9f59976-0140-4cf4-9d4f-590814b2a65b"
        },
        "target": {
          "id": "b9f59976-0140-4cf4-9d4f-590814b2a65b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 20,
              "dy": 16.333343505859375,
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
                "text": "EV_LED_01_TURN_ON"
              }
            },
            "position": {
              "distance": 0.49999999999999994,
              "offset": 15,
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
        "id": "2de21103-97e6-4628-b8b0-02611f97de50",
        "z": 16,
        "parent": "b9f59976-0140-4cf4-9d4f-590814b2a65b",
        "vertices": [
          {
            "x": 120,
            "y": -350
          }
        ],
        "attrs": {}
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
          "moduleName": "Actuador",
          "statemachinePrefix": "actuador",
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