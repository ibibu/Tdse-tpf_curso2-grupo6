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
            "text": "Sensor Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface : \n    in event EV_BTN_01_PUSHED\n    in event EV_BTN_01_NOT_PUSHED\n    in event EV_BTN_RISE_BTQR\n    in event EV_BTN_OFF_BTQR\n    var DELAY_BTN_01_MAX: integer = 10\n    var tick : integer = 5\n    "
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -60,
          "y": -370
        },
        "size": {
          "height": 60,
          "width": 122.16667175292969
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "259c6964-9724-44f7-996e-7470858b259e",
        "z": 7,
        "embeds": [
          "01eefece-4e95-4fb4-8280-71c18a5f6104"
        ],
        "attrs": {
          "name": {
            "text": "ST_BTN_01_FALLING",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 0,
          "y": -90
        },
        "size": {
          "height": 60,
          "width": 115.5625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7",
        "z": 8,
        "embeds": [
          "005ce02f-77e9-4404-b54d-647f6c4cd74b"
        ],
        "attrs": {
          "name": {
            "text": "ST_BTN_01_RISING",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 290,
          "y": -270
        },
        "size": {
          "height": 60,
          "width": 102.375
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "b36a1500-976f-4e66-8478-a9bb56329edc",
        "z": 9,
        "embeds": [
          "f97298eb-9aa8-4fb1-9c1b-497594b6ef74"
        ],
        "attrs": {
          "name": {
            "text": "ST_BTN_01_DOWN",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -240,
          "y": -240
        },
        "size": {
          "height": 60,
          "width": 89.17708587646484
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "11fd4470-34fd-4894-b33a-207c3c83289a",
        "z": 10,
        "embeds": [
          "1814363d-ed5a-4097-9d11-69a84fcab848"
        ],
        "attrs": {
          "name": {
            "text": "ST_BTN_01_UP",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -330,
          "y": -230
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
        "id": "b51b27ee-c37d-4809-aeb1-8f30b4f7f989",
        "z": 11,
        "embeds": [
          "38a281f0-ecd2-4b85-b2cd-19c69a11923f"
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
          "x": -330,
          "y": -215
        },
        "id": "38a281f0-ecd2-4b85-b2cd-19c69a11923f",
        "z": 12,
        "parent": "b51b27ee-c37d-4809-aeb1-8f30b4f7f989",
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
          "id": "b51b27ee-c37d-4809-aeb1-8f30b4f7f989"
        },
        "target": {
          "id": "11fd4470-34fd-4894-b33a-207c3c83289a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10,
              "dy": 26.333328247070312,
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
        "id": "127bc57d-7611-48aa-944e-733b080ac2ff",
        "z": 13,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "259c6964-9724-44f7-996e-7470858b259e"
        },
        "target": {
          "id": "11fd4470-34fd-4894-b33a-207c3c83289a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 80,
              "dy": 46.33332824707031,
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
                "text": "EV_BTN_01_NOT_PUSHED \n/ tick = 0"
              }
            },
            "position": {
              "distance": 0.6520774021601824,
              "offset": -24.90623476471376,
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
        "id": "817475c6-a751-46a3-ab53-49ab4d57a409",
        "z": 14,
        "vertices": [
          {
            "x": 0,
            "y": -240
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "11fd4470-34fd-4894-b33a-207c3c83289a"
        },
        "target": {
          "id": "11fd4470-34fd-4894-b33a-207c3c83289a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10,
              "dy": 56.33332824707031,
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
                "text": "EV_BTN_01_NOT_PUSHED"
              }
            },
            "position": {
              "distance": 0.715456468657551,
              "offset": -54.487958263940875,
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
        "id": "1814363d-ed5a-4097-9d11-69a84fcab848",
        "z": 15,
        "parent": "11fd4470-34fd-4894-b33a-207c3c83289a",
        "vertices": [
          {
            "x": -210,
            "y": -160
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "11fd4470-34fd-4894-b33a-207c3c83289a"
        },
        "target": {
          "id": "259c6964-9724-44f7-996e-7470858b259e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 20,
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
                "text": "EV_BTN_01_PUSHED /\ntick = DELAY_BTN_01_MAX"
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
        "id": "c9e56dbc-6278-4c49-b8a9-9b300eaa85c8",
        "z": 16,
        "vertices": [
          {
            "x": -200,
            "y": -333.67
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "259c6964-9724-44f7-996e-7470858b259e"
        },
        "target": {
          "id": "259c6964-9724-44f7-996e-7470858b259e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 50,
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
                "text": "EV_BTN_01_PUSHED [tick > 0] / \ntick --"
              }
            },
            "position": {
              "distance": 0.42450622312856656,
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
        "id": "01eefece-4e95-4fb4-8280-71c18a5f6104",
        "z": 17,
        "parent": "259c6964-9724-44f7-996e-7470858b259e",
        "vertices": [
          {
            "x": 50,
            "y": -410
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "259c6964-9724-44f7-996e-7470858b259e"
        },
        "target": {
          "id": "b36a1500-976f-4e66-8478-a9bb56329edc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 60,
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
                "text": "EV_BTN_01_PUSHED\n[tick <= 0]"
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
        "id": "7edda70d-21fc-4399-92e2-c4373093316f",
        "z": 18,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b36a1500-976f-4e66-8478-a9bb56329edc"
        },
        "target": {
          "id": "b36a1500-976f-4e66-8478-a9bb56329edc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 100,
              "dy": 56.333343505859375,
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
                "text": "EV_BTN_01_PUSHED"
              }
            },
            "position": {
              "distance": 0.4121493977099144,
              "offset": -65,
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
        "id": "f97298eb-9aa8-4fb1-9c1b-497594b6ef74",
        "z": 19,
        "parent": "b36a1500-976f-4e66-8478-a9bb56329edc",
        "vertices": [
          {
            "x": 430,
            "y": -260
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b36a1500-976f-4e66-8478-a9bb56329edc"
        },
        "target": {
          "id": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 110.00000000000011,
              "dy": 46.333335876464844,
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
                "text": "EV_BTN_01_NOT_PUSHED /\ntick = DELAY_BTN_01_MAX"
              }
            },
            "position": {
              "distance": 0.4496335021481771,
              "offset": -25.029395083620713,
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
        "id": "5e1c74ed-7ec3-47aa-a64d-adebd51817b9",
        "z": 20,
        "vertices": [
          {
            "x": 350,
            "y": -80
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7"
        },
        "target": {
          "id": "b36a1500-976f-4e66-8478-a9bb56329edc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10,
              "dy": 26.333343505859375,
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
                "text": "EV_BTN_01_PUSHED/\ntick = 0"
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
        "id": "ae15832e-0aca-4be8-8cb2-8dd67fe70c53",
        "z": 21,
        "vertices": [
          {
            "x": 230,
            "y": -220
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7"
        },
        "target": {
          "id": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 70.00000000000011,
              "dy": 56.333335876464844,
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
                "text": "EV_BTN_01_NOT_PUSHED\n[tick > 0]\n/ tick--"
              }
            },
            "position": {
              "distance": 0.5889195172629651,
              "offset": 35,
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
        "id": "005ce02f-77e9-4404-b54d-647f6c4cd74b",
        "z": 22,
        "parent": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7",
        "vertices": [
          {
            "x": 30,
            "y": 10
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "30cdc9ca-2307-4971-aa23-d1d7569cd9f7"
        },
        "target": {
          "id": "11fd4470-34fd-4894-b33a-207c3c83289a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 70,
              "dy": 66.33332824707031,
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
                "text": "EV_BTN_01_NOT_PUSHED\n[tick <= 0]"
              }
            },
            "position": {
              "distance": 0.500000018055424,
              "offset": -25,
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
        "id": "69ce0ab4-daf5-4d03-a849-56c39bb17f7c",
        "z": 23,
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
          "moduleName": "Sensor",
          "statemachinePrefix": "sensor",
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