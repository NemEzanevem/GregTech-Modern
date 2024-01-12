{
  "dimensions": {
    "minecraft:overworld": {
      "type": "minecraft:overworld",
      "generator": {
        "type": "minecraft:noise",
        "settings": {
          "sea_level": 63,
          "disable_mob_generation": false,
          "aquifers_enabled": true,
          "ore_veins_enabled": false,
          "legacy_random_source": false,
          "default_block": {
            "Name": "minecraft:stone"
          },
          "default_fluid": {
            "Name": "minecraft:water",
            "Properties": {
              "level": "0"
            }
          },
          "noise": {
            "min_y": -64,
            "height": 384,
            "size_horizontal": 1,
            "size_vertical": 2
          },
          "noise_router": {
            "barrier": {
              "type": "minecraft:noise",
              "noise": "minecraft:aquifer_barrier",
              "xz_scale": 1,
              "y_scale": 0.5
            },
            "fluid_level_floodedness": {
              "type": "minecraft:noise",
              "noise": "minecraft:aquifer_fluid_level_floodedness",
              "xz_scale": 1,
              "y_scale": 0.67
            },
            "fluid_level_spread": {
              "type": "minecraft:noise",
              "noise": "minecraft:aquifer_fluid_level_spread",
              "xz_scale": 1,
              "y_scale": 0.7142857142857143
            },
            "lava": {
              "type": "minecraft:noise",
              "noise": "minecraft:aquifer_lava",
              "xz_scale": 1,
              "y_scale": 1
            },
            "temperature": {
              "type": "minecraft:shifted_noise",
              "noise": "minecraft:temperature",
              "xz_scale": 0.25,
              "y_scale": 0,
              "shift_x": "minecraft:shift_x",
              "shift_y": 0,
              "shift_z": "minecraft:shift_z"
            },
            "vegetation": {
              "type": "minecraft:shifted_noise",
              "noise": "minecraft:vegetation",
              "xz_scale": 0.25,
              "y_scale": 0,
              "shift_x": "minecraft:shift_x",
              "shift_y": 0,
              "shift_z": "minecraft:shift_z"
            },
            "continents": "minecraft:overworld/continents",
            "erosion": "minecraft:overworld/erosion",
            "depth": "minecraft:overworld/depth",
            "ridges": "minecraft:overworld/ridges",
            "initial_density_without_jaggedness": {
              "type": "minecraft:add",
              "argument1": 0.1171875,
              "argument2": {
                "type": "minecraft:mul",
                "argument1": {
                  "type": "minecraft:y_clamped_gradient",
                  "from_y": -64,
                  "to_y": -40,
                  "from_value": 0,
                  "to_value": 1
                },
                "argument2": {
                  "type": "minecraft:add",
                  "argument1": -0.1171875,
                  "argument2": {
                    "type": "minecraft:add",
                    "argument1": -0.078125,
                    "argument2": {
                      "type": "minecraft:mul",
                      "argument1": {
                        "type": "minecraft:y_clamped_gradient",
                        "from_y": 240,
                        "to_y": 256,
                        "from_value": 1,
                        "to_value": 0
                      },
                      "argument2": {
                        "type": "minecraft:add",
                        "argument1": 0.078125,
                        "argument2": {
                          "type": "minecraft:clamp",
                          "input": {
                            "type": "minecraft:add",
                            "argument1": -0.703125,
                            "argument2": {
                              "type": "minecraft:mul",
                              "argument1": 4,
                              "argument2": {
                                "type": "minecraft:quarter_negative",
                                "argument": {
                                  "type": "minecraft:mul",
                                  "argument1": "minecraft:overworld/depth",
                                  "argument2": {
                                    "type": "minecraft:cache_2d",
                                    "argument": "minecraft:overworld/factor"
                                  }
                                }
                              }
                            }
                          },
                          "min": -64,
                          "max": 64
                        }
                      }
                    }
                  }
                }
              }
            },
            "final_density": {
              "type": "minecraft:min",
              "argument1": {
                "type": "minecraft:squeeze",
                "argument": {
                  "type": "minecraft:mul",
                  "argument1": 0.64,
                  "argument2": {
                    "type": "minecraft:interpolated",
                    "argument": {
                      "type": "minecraft:blend_density",
                      "argument": {
                        "type": "minecraft:add",
                        "argument1": 0.1171875,
                        "argument2": {
                          "type": "minecraft:mul",
                          "argument1": {
                            "type": "minecraft:y_clamped_gradient",
                            "from_y": -64,
                            "to_y": -40,
                            "from_value": 0,
                            "to_value": 1
                          },
                          "argument2": {
                            "type": "minecraft:add",
                            "argument1": -0.1171875,
                            "argument2": {
                              "type": "minecraft:add",
                              "argument1": -0.078125,
                              "argument2": {
                                "type": "minecraft:mul",
                                "argument1": {
                                  "type": "minecraft:y_clamped_gradient",
                                  "from_y": 240,
                                  "to_y": 256,
                                  "from_value": 1,
                                  "to_value": 0
                                },
                                "argument2": {
                                  "type": "minecraft:add",
                                  "argument1": 0.078125,
                                  "argument2": {
                                    "type": "minecraft:range_choice",
                                    "input": "minecraft:overworld/sloped_cheese",
                                    "min_inclusive": -1000000,
                                    "max_exclusive": 1.5625,
                                    "when_in_range": {
                                      "type": "minecraft:min",
                                      "argument1": "minecraft:overworld/sloped_cheese",
                                      "argument2": {
                                        "type": "minecraft:mul",
                                        "argument1": 5,
                                        "argument2": "minecraft:overworld/caves/entrances"
                                      }
                                    },
                                    "when_out_of_range": {
                                      "type": "minecraft:max",
                                      "argument1": {
                                        "type": "minecraft:min",
                                        "argument1": {
                                          "type": "minecraft:min",
                                          "argument1": {
                                            "type": "minecraft:add",
                                            "argument1": {
                                              "type": "minecraft:mul",
                                              "argument1": 4,
                                              "argument2": {
                                                "type": "minecraft:square",
                                                "argument": {
                                                  "type": "minecraft:noise",
                                                  "noise": "minecraft:cave_layer",
                                                  "xz_scale": 1,
                                                  "y_scale": 8
                                                }
                                              }
                                            },
                                            "argument2": {
                                              "type": "minecraft:add",
                                              "argument1": {
                                                "type": "minecraft:clamp",
                                                "input": {
                                                  "type": "minecraft:add",
                                                  "argument1": 0.27,
                                                  "argument2": {
                                                    "type": "minecraft:noise",
                                                    "noise": "minecraft:cave_cheese",
                                                    "xz_scale": 1,
                                                    "y_scale": 0.6666666666666666
                                                  }
                                                },
                                                "min": -1,
                                                "max": 1
                                              },
                                              "argument2": {
                                                "type": "minecraft:clamp",
                                                "input": {
                                                  "type": "minecraft:add",
                                                  "argument1": 1.5,
                                                  "argument2": {
                                                    "type": "minecraft:mul",
                                                    "argument1": -0.64,
                                                    "argument2": "minecraft:overworld/sloped_cheese"
                                                  }
                                                },
                                                "min": 0,
                                                "max": 0.5
                                              }
                                            }
                                          },
                                          "argument2": "minecraft:overworld/caves/entrances"
                                        },
                                        "argument2": {
                                          "type": "minecraft:add",
                                          "argument1": "minecraft:overworld/caves/spaghetti_2d",
                                          "argument2": "minecraft:overworld/caves/spaghetti_roughness_function"
                                        }
                                      },
                                      "argument2": {
                                        "type": "minecraft:range_choice",
                                        "input": "minecraft:overworld/caves/pillars",
                                        "min_inclusive": -1000000,
                                        "max_exclusive": 0.03,
                                        "when_in_range": -1000000,
                                        "when_out_of_range": "minecraft:overworld/caves/pillars"
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              },
              "argument2": "minecraft:overworld/caves/noodle"
            },
            "vein_toggle": {
              "type": "minecraft:interpolated",
              "argument": {
                "type": "minecraft:range_choice",
                "input": "minecraft:y",
                "min_inclusive": -60,
                "max_exclusive": 51,
                "when_in_range": {
                  "type": "minecraft:noise",
                  "noise": "minecraft:ore_veininess",
                  "xz_scale": 1.5,
                  "y_scale": 1.5
                },
                "when_out_of_range": 0
              }
            },
            "vein_ridged": {
              "type": "minecraft:add",
              "argument1": -0.07999999821186066,
              "argument2": {
                "type": "minecraft:max",
                "argument1": {
                  "type": "minecraft:abs",
                  "argument": {
                    "type": "minecraft:interpolated",
                    "argument": {
                      "type": "minecraft:range_choice",
                      "input": "minecraft:y",
                      "min_inclusive": -60,
                      "max_exclusive": 51,
                      "when_in_range": {
                        "type": "minecraft:noise",
                        "noise": "minecraft:ore_vein_a",
                        "xz_scale": 4,
                        "y_scale": 4
                      },
                      "when_out_of_range": 0
                    }
                  }
                },
                "argument2": {
                  "type": "minecraft:abs",
                  "argument": {
                    "type": "minecraft:interpolated",
                    "argument": {
                      "type": "minecraft:range_choice",
                      "input": "minecraft:y",
                      "min_inclusive": -60,
                      "max_exclusive": 51,
                      "when_in_range": {
                        "type": "minecraft:noise",
                        "noise": "minecraft:ore_vein_b",
                        "xz_scale": 4,
                        "y_scale": 4
                      },
                      "when_out_of_range": 0
                    }
                  }
                }
              }
            },
            "vein_gap": {
              "type": "minecraft:noise",
              "noise": "minecraft:ore_gap",
              "xz_scale": 1,
              "y_scale": 1
            }
          },
          "spawn_target": [
            {
              "temperature": [
                -1,
                1
              ],
              "humidity": [
                -1,
                1
              ],
              "continentalness": [
                -0.11,
                1
              ],
              "erosion": [
                -1,
                1
              ],
              "weirdness": [
                -1,
                -0.16
              ],
              "depth": 0,
              "offset": 0
            },
            {
              "temperature": [
                -1,
                1
              ],
              "humidity": [
                -1,
                1
              ],
              "continentalness": [
                -0.11,
                1
              ],
              "erosion": [
                -1,
                1
              ],
              "weirdness": [
                0.16,
                1
              ],
              "depth": 0,
              "offset": 0
            }
          ],
          "surface_rule": {
            "type": "minecraft:sequence",
            "sequence": [
              {
                "type": "minecraft:condition",
                "if_true": {
                  "type": "minecraft:vertical_gradient",
                  "random_name": "minecraft:bedrock_floor",
                  "true_at_and_below": {
                    "above_bottom": 0
                  },
                  "false_at_and_above": {
                    "above_bottom": 5
                  }
                },
                "then_run": {
                  "type": "minecraft:block",
                  "result_state": {
                    "Name": "minecraft:bedrock"
                  }
                }
              },
              {
                "type": "minecraft:condition",
                "if_true": {
                  "type": "minecraft:above_preliminary_surface"
                },
                "then_run": {
                  "type": "minecraft:sequence",
                  "sequence": [
                    {
                      "type": "minecraft:condition",
                      "if_true": {
                        "type": "minecraft:stone_depth",
                        "offset": 0,
                        "surface_type": "floor",
                        "add_surface_depth": false,
                        "secondary_depth_range": 0
                      },
                      "then_run": {
                        "type": "minecraft:sequence",
                        "sequence": [
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:wooded_badlands"
                              ]
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:y_above",
                                "anchor": {
                                  "absolute": 97
                                },
                                "surface_depth_multiplier": 2,
                                "add_stone_depth": false
                              },
                              "then_run": {
                                "type": "minecraft:sequence",
                                "sequence": [
                                  {
                                    "type": "minecraft:condition",
                                    "if_true": {
                                      "type": "minecraft:noise_threshold",
                                      "noise": "minecraft:surface",
                                      "min_threshold": -0.909,
                                      "max_threshold": -0.5454
                                    },
                                    "then_run": {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:coarse_dirt"
                                      }
                                    }
                                  },
                                  {
                                    "type": "minecraft:condition",
                                    "if_true": {
                                      "type": "minecraft:noise_threshold",
                                      "noise": "minecraft:surface",
                                      "min_threshold": -0.1818,
                                      "max_threshold": 0.1818
                                    },
                                    "then_run": {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:coarse_dirt"
                                      }
                                    }
                                  },
                                  {
                                    "type": "minecraft:condition",
                                    "if_true": {
                                      "type": "minecraft:noise_threshold",
                                      "noise": "minecraft:surface",
                                      "min_threshold": 0.5454,
                                      "max_threshold": 0.909
                                    },
                                    "then_run": {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:coarse_dirt"
                                      }
                                    }
                                  },
                                  {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:grass_block",
                                            "Properties": {
                                              "snowy": "false"
                                            }
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:block",
                                        "result_state": {
                                          "Name": "minecraft:dirt"
                                        }
                                      }
                                    ]
                                  }
                                ]
                              }
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:swamp"
                              ]
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:y_above",
                                "anchor": {
                                  "absolute": 62
                                },
                                "surface_depth_multiplier": 0,
                                "add_stone_depth": false
                              },
                              "then_run": {
                                "type": "minecraft:condition",
                                "if_true": {
                                  "type": "minecraft:not",
                                  "invert": {
                                    "type": "minecraft:y_above",
                                    "anchor": {
                                      "absolute": 63
                                    },
                                    "surface_depth_multiplier": 0,
                                    "add_stone_depth": false
                                  }
                                },
                                "then_run": {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:noise_threshold",
                                    "noise": "minecraft:surface_swamp",
                                    "min_threshold": 0,
                                    "max_threshold": 1.7976931348623157e+308
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:water",
                                      "Properties": {
                                        "level": "0"
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:mangrove_swamp"
                              ]
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:y_above",
                                "anchor": {
                                  "absolute": 60
                                },
                                "surface_depth_multiplier": 0,
                                "add_stone_depth": false
                              },
                              "then_run": {
                                "type": "minecraft:condition",
                                "if_true": {
                                  "type": "minecraft:not",
                                  "invert": {
                                    "type": "minecraft:y_above",
                                    "anchor": {
                                      "absolute": 63
                                    },
                                    "surface_depth_multiplier": 0,
                                    "add_stone_depth": false
                                  }
                                },
                                "then_run": {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:noise_threshold",
                                    "noise": "minecraft:surface_swamp",
                                    "min_threshold": 0,
                                    "max_threshold": 1.7976931348623157e+308
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:water",
                                      "Properties": {
                                        "level": "0"
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        ]
                      }
                    },
                    {
                      "type": "minecraft:condition",
                      "if_true": {
                        "type": "minecraft:biome",
                        "biome_is": [
                          "minecraft:badlands",
                          "minecraft:eroded_badlands",
                          "minecraft:wooded_badlands"
                        ]
                      },
                      "then_run": {
                        "type": "minecraft:sequence",
                        "sequence": [
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:stone_depth",
                              "offset": 0,
                              "surface_type": "floor",
                              "add_surface_depth": false,
                              "secondary_depth_range": 0
                            },
                            "then_run": {
                              "type": "minecraft:sequence",
                              "sequence": [
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:y_above",
                                    "anchor": {
                                      "absolute": 256
                                    },
                                    "surface_depth_multiplier": 0,
                                    "add_stone_depth": false
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:orange_terracotta"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:y_above",
                                    "anchor": {
                                      "absolute": 74
                                    },
                                    "surface_depth_multiplier": 1,
                                    "add_stone_depth": true
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": -0.909,
                                          "max_threshold": -0.5454
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:terracotta"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": -0.1818,
                                          "max_threshold": 0.1818
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:terracotta"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.5454,
                                          "max_threshold": 0.909
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:terracotta"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:bandlands"
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:water",
                                    "offset": -1,
                                    "surface_depth_multiplier": 0,
                                    "add_stone_depth": false
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:stone_depth",
                                          "offset": 0,
                                          "surface_type": "ceiling",
                                          "add_surface_depth": false,
                                          "secondary_depth_range": 0
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:red_sandstone"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:block",
                                        "result_state": {
                                          "Name": "minecraft:red_sand"
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:not",
                                    "invert": {
                                      "type": "minecraft:hole"
                                    }
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:orange_terracotta"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:water",
                                    "offset": -6,
                                    "surface_depth_multiplier": -1,
                                    "add_stone_depth": true
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:white_terracotta"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:sequence",
                                  "sequence": [
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:stone_depth",
                                        "offset": 0,
                                        "surface_type": "ceiling",
                                        "add_surface_depth": false,
                                        "secondary_depth_range": 0
                                      },
                                      "then_run": {
                                        "type": "gtceu:strata"
                                      }
                                    },
                                    {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:gravel"
                                      }
                                    }
                                  ]
                                }
                              ]
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:y_above",
                              "anchor": {
                                "absolute": 63
                              },
                              "surface_depth_multiplier": -1,
                              "add_stone_depth": true
                            },
                            "then_run": {
                              "type": "minecraft:sequence",
                              "sequence": [
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:y_above",
                                    "anchor": {
                                      "absolute": 63
                                    },
                                    "surface_depth_multiplier": 0,
                                    "add_stone_depth": false
                                  },
                                  "then_run": {
                                    "type": "minecraft:condition",
                                    "if_true": {
                                      "type": "minecraft:not",
                                      "invert": {
                                        "type": "minecraft:y_above",
                                        "anchor": {
                                          "absolute": 74
                                        },
                                        "surface_depth_multiplier": 1,
                                        "add_stone_depth": true
                                      }
                                    },
                                    "then_run": {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:orange_terracotta"
                                      }
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:bandlands"
                                }
                              ]
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:stone_depth",
                              "offset": 0,
                              "surface_type": "floor",
                              "add_surface_depth": true,
                              "secondary_depth_range": 0
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:water",
                                "offset": -6,
                                "surface_depth_multiplier": -1,
                                "add_stone_depth": true
                              },
                              "then_run": {
                                "type": "minecraft:block",
                                "result_state": {
                                  "Name": "minecraft:white_terracotta"
                                }
                              }
                            }
                          }
                        ]
                      }
                    },
                    {
                      "type": "minecraft:condition",
                      "if_true": {
                        "type": "minecraft:stone_depth",
                        "offset": 0,
                        "surface_type": "floor",
                        "add_surface_depth": false,
                        "secondary_depth_range": 0
                      },
                      "then_run": {
                        "type": "minecraft:condition",
                        "if_true": {
                          "type": "minecraft:water",
                          "offset": -1,
                          "surface_depth_multiplier": 0,
                          "add_stone_depth": false
                        },
                        "then_run": {
                          "type": "minecraft:sequence",
                          "sequence": [
                            {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:biome",
                                "biome_is": [
                                  "minecraft:frozen_ocean",
                                  "minecraft:deep_frozen_ocean"
                                ]
                              },
                              "then_run": {
                                "type": "minecraft:condition",
                                "if_true": {
                                  "type": "minecraft:hole"
                                },
                                "then_run": {
                                  "type": "minecraft:sequence",
                                  "sequence": [
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:water",
                                        "offset": 0,
                                        "surface_depth_multiplier": 0,
                                        "add_stone_depth": false
                                      },
                                      "then_run": {
                                        "type": "minecraft:block",
                                        "result_state": {
                                          "Name": "minecraft:air"
                                        }
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:temperature"
                                      },
                                      "then_run": {
                                        "type": "minecraft:block",
                                        "result_state": {
                                          "Name": "minecraft:ice"
                                        }
                                      }
                                    },
                                    {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:water",
                                        "Properties": {
                                          "level": "0"
                                        }
                                      }
                                    }
                                  ]
                                }
                              }
                            },
                            {
                              "type": "minecraft:sequence",
                              "sequence": [
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:frozen_peaks"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:steep"
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:packed_ice"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:packed_ice",
                                          "min_threshold": 0,
                                          "max_threshold": 0.2
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:packed_ice"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:ice",
                                          "min_threshold": 0,
                                          "max_threshold": 0.025
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:ice"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:snow_block"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:snowy_slopes"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:steep"
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:stone"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:powder_snow",
                                          "min_threshold": 0.35,
                                          "max_threshold": 0.6
                                        },
                                        "then_run": {
                                          "type": "minecraft:condition",
                                          "if_true": {
                                            "type": "minecraft:water",
                                            "offset": 0,
                                            "surface_depth_multiplier": 0,
                                            "add_stone_depth": false
                                          },
                                          "then_run": {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:powder_snow"
                                            }
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:snow_block"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:jagged_peaks"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:steep"
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:snow_block"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:grove"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:powder_snow",
                                          "min_threshold": 0.35,
                                          "max_threshold": 0.6
                                        },
                                        "then_run": {
                                          "type": "minecraft:condition",
                                          "if_true": {
                                            "type": "minecraft:water",
                                            "offset": 0,
                                            "surface_depth_multiplier": 0,
                                            "add_stone_depth": false
                                          },
                                          "then_run": {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:powder_snow"
                                            }
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:snow_block"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:sequence",
                                  "sequence": [
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:stony_peaks"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:noise_threshold",
                                              "noise": "minecraft:calcite",
                                              "min_threshold": -0.0125,
                                              "max_threshold": 0.0125
                                            },
                                            "then_run": {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:calcite"
                                              }
                                            }
                                          },
                                          {
                                            "type": "gtceu:strata"
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:stony_shore"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:noise_threshold",
                                              "noise": "minecraft:gravel",
                                              "min_threshold": -0.05,
                                              "max_threshold": 0.05
                                            },
                                            "then_run": {
                                              "type": "minecraft:sequence",
                                              "sequence": [
                                                {
                                                  "type": "minecraft:condition",
                                                  "if_true": {
                                                    "type": "minecraft:stone_depth",
                                                    "offset": 0,
                                                    "surface_type": "ceiling",
                                                    "add_surface_depth": false,
                                                    "secondary_depth_range": 0
                                                  },
                                                  "then_run": {
                                                    "type": "gtceu:strata"
                                                  }
                                                },
                                                {
                                                  "type": "minecraft:block",
                                                  "result_state": {
                                                    "Name": "minecraft:gravel"
                                                  }
                                                }
                                              ]
                                            }
                                          },
                                          {
                                            "type": "gtceu:strata"
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:windswept_hills"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.12121212121212122,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:warm_ocean",
                                          "minecraft:beach",
                                          "minecraft:snowy_beach"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:stone_depth",
                                              "offset": 0,
                                              "surface_type": "ceiling",
                                              "add_surface_depth": false,
                                              "secondary_depth_range": 0
                                            },
                                            "then_run": {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:sandstone"
                                              }
                                            }
                                          },
                                          {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:sand"
                                            }
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:desert"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:stone_depth",
                                              "offset": 0,
                                              "surface_type": "ceiling",
                                              "add_surface_depth": false,
                                              "secondary_depth_range": 0
                                            },
                                            "then_run": {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:sandstone"
                                              }
                                            }
                                          },
                                          {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:sand"
                                            }
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:dripstone_caves"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "gtceu:strata"
                                      }
                                    }
                                  ]
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:windswept_savanna"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.21212121212121213,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": -0.06060606060606061,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:coarse_dirt"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:windswept_gravelly_hills"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.24242424242424243,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:sequence",
                                          "sequence": [
                                            {
                                              "type": "minecraft:condition",
                                              "if_true": {
                                                "type": "minecraft:stone_depth",
                                                "offset": 0,
                                                "surface_type": "ceiling",
                                                "add_surface_depth": false,
                                                "secondary_depth_range": 0
                                              },
                                              "then_run": {
                                                "type": "gtceu:strata"
                                              }
                                            },
                                            {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:gravel"
                                              }
                                            }
                                          ]
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.12121212121212122,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": -0.12121212121212122,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:sequence",
                                          "sequence": [
                                            {
                                              "type": "minecraft:condition",
                                              "if_true": {
                                                "type": "minecraft:water",
                                                "offset": 0,
                                                "surface_depth_multiplier": 0,
                                                "add_stone_depth": false
                                              },
                                              "then_run": {
                                                "type": "minecraft:block",
                                                "result_state": {
                                                  "Name": "minecraft:grass_block",
                                                  "Properties": {
                                                    "snowy": "false"
                                                  }
                                                }
                                              }
                                            },
                                            {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:dirt"
                                              }
                                            }
                                          ]
                                        }
                                      },
                                      {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:stone_depth",
                                              "offset": 0,
                                              "surface_type": "ceiling",
                                              "add_surface_depth": false,
                                              "secondary_depth_range": 0
                                            },
                                            "then_run": {
                                              "type": "gtceu:strata"
                                            }
                                          },
                                          {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:gravel"
                                            }
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:old_growth_pine_taiga",
                                      "minecraft:old_growth_spruce_taiga"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.21212121212121213,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:coarse_dirt"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": -0.11515151515151514,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:podzol",
                                            "Properties": {
                                              "snowy": "false"
                                            }
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:ice_spikes"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:condition",
                                    "if_true": {
                                      "type": "minecraft:water",
                                      "offset": 0,
                                      "surface_depth_multiplier": 0,
                                      "add_stone_depth": false
                                    },
                                    "then_run": {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:snow_block"
                                      }
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:mangrove_swamp"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:mud"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:mushroom_fields"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:mycelium",
                                      "Properties": {
                                        "snowy": "false"
                                      }
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:sequence",
                                  "sequence": [
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:water",
                                        "offset": 0,
                                        "surface_depth_multiplier": 0,
                                        "add_stone_depth": false
                                      },
                                      "then_run": {
                                        "type": "minecraft:block",
                                        "result_state": {
                                          "Name": "minecraft:grass_block",
                                          "Properties": {
                                            "snowy": "false"
                                          }
                                        }
                                      }
                                    },
                                    {
                                      "type": "minecraft:block",
                                      "result_state": {
                                        "Name": "minecraft:dirt"
                                      }
                                    }
                                  ]
                                }
                              ]
                            }
                          ]
                        }
                      }
                    },
                    {
                      "type": "minecraft:condition",
                      "if_true": {
                        "type": "minecraft:water",
                        "offset": -6,
                        "surface_depth_multiplier": -1,
                        "add_stone_depth": true
                      },
                      "then_run": {
                        "type": "minecraft:sequence",
                        "sequence": [
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:stone_depth",
                              "offset": 0,
                              "surface_type": "floor",
                              "add_surface_depth": false,
                              "secondary_depth_range": 0
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:biome",
                                "biome_is": [
                                  "minecraft:frozen_ocean",
                                  "minecraft:deep_frozen_ocean"
                                ]
                              },
                              "then_run": {
                                "type": "minecraft:condition",
                                "if_true": {
                                  "type": "minecraft:hole"
                                },
                                "then_run": {
                                  "type": "minecraft:block",
                                  "result_state": {
                                    "Name": "minecraft:water",
                                    "Properties": {
                                      "level": "0"
                                    }
                                  }
                                }
                              }
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:stone_depth",
                              "offset": 0,
                              "surface_type": "floor",
                              "add_surface_depth": true,
                              "secondary_depth_range": 0
                            },
                            "then_run": {
                              "type": "minecraft:sequence",
                              "sequence": [
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:frozen_peaks"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:steep"
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:packed_ice"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:packed_ice",
                                          "min_threshold": -0.5,
                                          "max_threshold": 0.2
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:packed_ice"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:ice",
                                          "min_threshold": -0.0625,
                                          "max_threshold": 0.025
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:ice"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:snow_block"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:snowy_slopes"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:steep"
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:powder_snow",
                                          "min_threshold": 0.45,
                                          "max_threshold": 0.58
                                        },
                                        "then_run": {
                                          "type": "minecraft:condition",
                                          "if_true": {
                                            "type": "minecraft:water",
                                            "offset": 0,
                                            "surface_depth_multiplier": 0,
                                            "add_stone_depth": false
                                          },
                                          "then_run": {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:powder_snow"
                                            }
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:water",
                                          "offset": 0,
                                          "surface_depth_multiplier": 0,
                                          "add_stone_depth": false
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:snow_block"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:jagged_peaks"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "gtceu:strata"
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:grove"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:powder_snow",
                                          "min_threshold": 0.45,
                                          "max_threshold": 0.58
                                        },
                                        "then_run": {
                                          "type": "minecraft:condition",
                                          "if_true": {
                                            "type": "minecraft:water",
                                            "offset": 0,
                                            "surface_depth_multiplier": 0,
                                            "add_stone_depth": false
                                          },
                                          "then_run": {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:powder_snow"
                                            }
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:block",
                                        "result_state": {
                                          "Name": "minecraft:dirt"
                                        }
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:sequence",
                                  "sequence": [
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:stony_peaks"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:noise_threshold",
                                              "noise": "minecraft:calcite",
                                              "min_threshold": -0.0125,
                                              "max_threshold": 0.0125
                                            },
                                            "then_run": {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:calcite"
                                              }
                                            }
                                          },
                                          {
                                            "type": "gtceu:strata"
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:stony_shore"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:noise_threshold",
                                              "noise": "minecraft:gravel",
                                              "min_threshold": -0.05,
                                              "max_threshold": 0.05
                                            },
                                            "then_run": {
                                              "type": "minecraft:sequence",
                                              "sequence": [
                                                {
                                                  "type": "minecraft:condition",
                                                  "if_true": {
                                                    "type": "minecraft:stone_depth",
                                                    "offset": 0,
                                                    "surface_type": "ceiling",
                                                    "add_surface_depth": false,
                                                    "secondary_depth_range": 0
                                                  },
                                                  "then_run": {
                                                    "type": "gtceu:strata"
                                                  }
                                                },
                                                {
                                                  "type": "minecraft:block",
                                                  "result_state": {
                                                    "Name": "minecraft:gravel"
                                                  }
                                                }
                                              ]
                                            }
                                          },
                                          {
                                            "type": "gtceu:strata"
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:windswept_hills"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.12121212121212122,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:warm_ocean",
                                          "minecraft:beach",
                                          "minecraft:snowy_beach"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:stone_depth",
                                              "offset": 0,
                                              "surface_type": "ceiling",
                                              "add_surface_depth": false,
                                              "secondary_depth_range": 0
                                            },
                                            "then_run": {
                                              "type": "gtceu:strata"
                                            }
                                          },
                                          {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:sand"
                                            }
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:desert"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:stone_depth",
                                              "offset": 0,
                                              "surface_type": "ceiling",
                                              "add_surface_depth": false,
                                              "secondary_depth_range": 0
                                            },
                                            "then_run": {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:sandstone"
                                              }
                                            }
                                          },
                                          {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:sand"
                                            }
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "minecraft:condition",
                                      "if_true": {
                                        "type": "minecraft:biome",
                                        "biome_is": [
                                          "minecraft:dripstone_caves"
                                        ]
                                      },
                                      "then_run": {
                                        "type": "gtceu:strata"
                                      }
                                    }
                                  ]
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:windswept_savanna"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:condition",
                                    "if_true": {
                                      "type": "minecraft:noise_threshold",
                                      "noise": "minecraft:surface",
                                      "min_threshold": 0.21212121212121213,
                                      "max_threshold": 1.7976931348623157e+308
                                    },
                                    "then_run": {
                                      "type": "gtceu:strata"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:windswept_gravelly_hills"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:sequence",
                                    "sequence": [
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.24242424242424243,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:sequence",
                                          "sequence": [
                                            {
                                              "type": "minecraft:condition",
                                              "if_true": {
                                                "type": "minecraft:stone_depth",
                                                "offset": 0,
                                                "surface_type": "ceiling",
                                                "add_surface_depth": false,
                                                "secondary_depth_range": 0
                                              },
                                              "then_run": {
                                                "type": "gtceu:strata"
                                              }
                                            },
                                            {
                                              "type": "minecraft:block",
                                              "result_state": {
                                                "Name": "minecraft:gravel"
                                              }
                                            }
                                          ]
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": 0.12121212121212122,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "gtceu:strata"
                                        }
                                      },
                                      {
                                        "type": "minecraft:condition",
                                        "if_true": {
                                          "type": "minecraft:noise_threshold",
                                          "noise": "minecraft:surface",
                                          "min_threshold": -0.12121212121212122,
                                          "max_threshold": 1.7976931348623157e+308
                                        },
                                        "then_run": {
                                          "type": "minecraft:block",
                                          "result_state": {
                                            "Name": "minecraft:dirt"
                                          }
                                        }
                                      },
                                      {
                                        "type": "minecraft:sequence",
                                        "sequence": [
                                          {
                                            "type": "minecraft:condition",
                                            "if_true": {
                                              "type": "minecraft:stone_depth",
                                              "offset": 0,
                                              "surface_type": "ceiling",
                                              "add_surface_depth": false,
                                              "secondary_depth_range": 0
                                            },
                                            "then_run": {
                                              "type": "gtceu:strata"
                                            }
                                          },
                                          {
                                            "type": "minecraft:block",
                                            "result_state": {
                                              "Name": "minecraft:gravel"
                                            }
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                },
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:biome",
                                    "biome_is": [
                                      "minecraft:mangrove_swamp"
                                    ]
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:mud"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:block",
                                  "result_state": {
                                    "Name": "minecraft:dirt"
                                  }
                                }
                              ]
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:warm_ocean",
                                "minecraft:beach",
                                "minecraft:snowy_beach"
                              ]
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:stone_depth",
                                "offset": 0,
                                "surface_type": "floor",
                                "add_surface_depth": true,
                                "secondary_depth_range": 6
                              },
                              "then_run": {
                                "type": "minecraft:block",
                                "result_state": {
                                  "Name": "minecraft:sandstone"
                                }
                              }
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:desert"
                              ]
                            },
                            "then_run": {
                              "type": "minecraft:condition",
                              "if_true": {
                                "type": "minecraft:stone_depth",
                                "offset": 0,
                                "surface_type": "floor",
                                "add_surface_depth": true,
                                "secondary_depth_range": 30
                              },
                              "then_run": {
                                "type": "minecraft:block",
                                "result_state": {
                                  "Name": "minecraft:sandstone"
                                }
                              }
                            }
                          }
                        ]
                      }
                    },
                    {
                      "type": "minecraft:condition",
                      "if_true": {
                        "type": "minecraft:stone_depth",
                        "offset": 0,
                        "surface_type": "floor",
                        "add_surface_depth": false,
                        "secondary_depth_range": 0
                      },
                      "then_run": {
                        "type": "minecraft:sequence",
                        "sequence": [
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:frozen_peaks",
                                "minecraft:jagged_peaks"
                              ]
                            },
                            "then_run": {
                              "type": "gtceu:strata"
                            }
                          },
                          {
                            "type": "minecraft:condition",
                            "if_true": {
                              "type": "minecraft:biome",
                              "biome_is": [
                                "minecraft:warm_ocean",
                                "minecraft:lukewarm_ocean",
                                "minecraft:deep_lukewarm_ocean"
                              ]
                            },
                            "then_run": {
                              "type": "minecraft:sequence",
                              "sequence": [
                                {
                                  "type": "minecraft:condition",
                                  "if_true": {
                                    "type": "minecraft:stone_depth",
                                    "offset": 0,
                                    "surface_type": "ceiling",
                                    "add_surface_depth": false,
                                    "secondary_depth_range": 0
                                  },
                                  "then_run": {
                                    "type": "minecraft:block",
                                    "result_state": {
                                      "Name": "minecraft:sandstone"
                                    }
                                  }
                                },
                                {
                                  "type": "minecraft:block",
                                  "result_state": {
                                    "Name": "minecraft:sand"
                                  }
                                }
                              ]
                            }
                          },
                          {
                            "type": "minecraft:sequence",
                            "sequence": [
                              {
                                "type": "minecraft:condition",
                                "if_true": {
                                  "type": "minecraft:stone_depth",
                                  "offset": 0,
                                  "surface_type": "ceiling",
                                  "add_surface_depth": false,
                                  "secondary_depth_range": 0
                                },
                                "then_run": {
                                  "type": "gtceu:strata"
                                }
                              },
                              {
                                "type": "minecraft:block",
                                "result_state": {
                                  "Name": "minecraft:gravel"
                                }
                              }
                            ]
                          }
                        ]
                      }
                    }
                  ]
                }
              },
              {
                "type": "minecraft:condition",
                "if_true": {
                  "type": "minecraft:vertical_gradient",
                  "random_name": "minecraft:deepslate",
                  "true_at_and_below": {
                    "absolute": 0
                  },
                  "false_at_and_above": {
                    "absolute": 8
                  }
                },
                "then_run": {
                  "type": "minecraft:block",
                  "result_state": {
                    "Name": "minecraft:deepslate",
                    "Properties": {
                      "axis": "y"
                    }
                  }
                }
              }
            ]
          }
        },
        "biome_source": {
          "type": "minecraft:multi_noise",
          "preset": "minecraft:overworld"
        }
      }
    },
    "minecraft:the_nether": {
      "type": "minecraft:the_nether",
      "generator": {
        "type": "minecraft:noise",
        "settings": "minecraft:nether",
        "biome_source": {
          "type": "minecraft:multi_noise",
          "preset": "minecraft:nether"
        }
      }
    },
    "minecraft:the_end": {
      "type": "minecraft:overworld",
      "generator": {
        "type": "minecraft:noise",
        "settings": "minecraft:end",
        "biome_source": {
          "type": "minecraft:the_end"
        }
      }
    }
  }
}
