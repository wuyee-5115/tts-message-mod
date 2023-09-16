local params = {}
local colors = require("src.consts.colors")
params[colors.white] = {
	blackMsgNumDisplay = {
		data = {
			Name = "3DText",
			GUID = "4582e2",
			Transform = {
				posX = -2.85,
				posY = 1.35,
				posZ = -8.15,
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0");spawned_object.lock() end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "b1c39a",
			Name = "3DText",
			Transform = {
				posX = -4.15,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1}, 
		rotation = {90, 0, 0}, 
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "f80f23",
			Name = "3DText",
			Transform = {
				posX = -5.48,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "b1ec8b",
			Name = "ScriptingTrigger",
			Transform = {
				posX = 1.31,
				posY = 3.84,
				posZ = -14.33
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
params[colors.red] = {
	blackMsgNumDisplay = {
		data = {
			GUID = "73e3ab",
			Name = "3DText",
			Transform = {
				posX = -17.84,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "79f044",
			Name = "3DText",
			Transform = {
				posX = -19.17,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "10078e",
			Name = "3DText",
			Transform = {
				posX = -20.5,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "b5a61b",
			Name = "ScriptingTrigger",
			Transform = {
				posX = -13.71,
				posY = 3.84,
				posZ = -14.33
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
params[colors.pink] = {
	blackMsgNumDisplay = {
		data = {
			GUID = "8f11bd",
			Name = "3DText",
			Transform = {
				posX = 12.17,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "3a4554",
			Name = "3DText",
			Transform = {
				posX = 10.84,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "bed812",
			Name = "3DText",
			Transform = {
				posX = 9.51,
				posY = 1.35,
				posZ = -8.15
			},
			Locked = true,
		}, 
		scale = {1, 1, 1}, 
		rotation = {90, 0, 0}, 
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "755d6a",
			Name = "ScriptingTrigger",
			Transform = {
				posX = 16.35,
				posY = 3.84,
				posZ = -14.33
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
params[colors.yellow] = {
	blackMsgNumDisplay = {
		data = {
			GUID = "d89d76",
			Name = "3DText",
			Transform = {
				posX = -13.2,
				posY = 1.35,
				posZ = 3.13
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, -90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "d03d9d",
			Name = "3DText",
			Transform = {
				posX = -13.2,
				posY = 1.35,
				posZ = 4.46
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, -90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "0ebed7",
			Name = "3DText",
			Transform = {
				posX = -13.2,
				posY = 1.35,
				posZ = 5.79
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, -90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "971c8c",
			Name = "ScriptingTrigger",
			Transform = {
				posX = -19.36,
				posY = 3.84,
				posZ = -0.95
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
params[colors.green] = {
	blackMsgNumDisplay = {
		data = {
			GUID = "84785f",
			Name = "3DText",
			Transform = {
				posX = -12.21,
				posY = 1.35,
				posZ = 9.23
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "1ab8c7",
			Name = "3DText",
			Transform = {
				posX = -10.88,
				posY = 1.35,
				posZ = 9.23
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "4777ab",
			Name = "3DText",
			Transform = {
				posX = -9.55,
				posY = 1.35,
				posZ = 9.23
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "e1f45d",
			Name = "ScriptingTrigger",
			Transform = {
				posX = -16.18,
				posY = 3.84,
				posZ = 15.34
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
params[colors.blue] = {
	blackMsgNumDisplay = {
		data = {
			GUID = "d4607a",
			Name = "3DText",
			Transform = {
				posX = 17.81,
				posY = 1.35,
				posZ = 9.23
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "56c631",
			Name = "3DText",
			Transform = {
				posX = 19.14,
				posY = 1.35,
				posZ = 9.23
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "42e7ca",
			Name = "3DText",
			Transform = {
				posX = 20.47,
				posY = 1.35,
				posZ = 9.23
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "7d91a9",
			Name = "ScriptingTrigger",
			Transform = {
				posX = 13.71,
				posY = 3.84,
				posZ = 15.34
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
params[colors.purple] = {
	blackMsgNumDisplay = {
		data = {
			GUID = "8d38c1",
			Name = "3DText",
			Transform = {
				posX = 13.2,
				posY = 1.35,
				posZ = -2.34
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		data = {
			GUID = "ff5d56",
			Name = "3DText",
			Transform = {
				posX = 13.2,
				posY = 1.35,
				posZ = -3.67
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		data = {
			GUID = "11c7ce",
			Name = "3DText",
			Transform = {
				posX = 13.2,
				posY = 1.35,
				posZ = -5
			},
			Locked = true,
		},
		scale = {1, 1, 1},
		rotation = {90, 0, 90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		data = {
			GUID = "cd42b3",
			Name = "ScriptingTrigger",
			Transform = {
				posX = 19.47,
				posY = 3.84,
				posZ = 1.81
			},
			Locked = true,
		},
		scale = {1, 5.1, 1}
	},
}
return params