local params = {}
local colors = require("src.consts.colors")
params[colors.white] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {-2.85, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {-4.15, 1.35, -8.15}, 
		scale = {1, 1, 1}, 
		rotation = {90, 0, 0}, 
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText",
		position = {-5.48, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {1.31, 3.84, -14.33},
		scale = {1, 5.1, 1}
	}
}
params[colors.red] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {-17.84, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {-19.17, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText",
		position = {-20.5, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {-13.71, 3.84, -14.33},
		scale = {1, 5.1, 1}
	}
}
params[colors.pink] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {12.17, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {10.84, 1.35, -8.15},
		scale = {1, 1, 1},
		rotation = {90, 0, 0},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText", 
		position = {9.51, 1.35, -8.15}, 
		scale = {1, 1, 1}, 
		rotation = {90, 0, 0}, 
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {16.35, 3.84, -14.33},
		scale = {1, 5.1, 1}
	}
}
params[colors.yellow] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {-13.2, 1.35, 3.13},
		scale = {1, 1, 1},
		rotation = {90, 0, -90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {-13.2, 1.35, 4.46},
		scale = {1, 1, 1},
		rotation = {90, 0, -90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText",
		position = {-13.2, 1.35, 5.79},
		scale = {1, 1, 1},
		rotation = {90, 0, -90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {-19.36, 3.84, -0.95},
		scale = {1, 5.1, 1}
	}
}
params[colors.green] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {-12.21, 1.35, 9.23},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {-10.88, 1.35, 9.23},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText",
		position = {-9.55, 1.35, 9.23},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {-16.18, 3.84, 15.34},
		scale = {1, 5.1, 1}
	}
}
params[colors.blue] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {17.81, 1.35, 9.23},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {19.14, 1.35, 9.23},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText",
		position = {20.47, 1.35, 9.23},
		scale = {1, 1, 1},
		rotation = {90, 0, 180},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {13.71, 3.84, 15.34},
		scale = {1, 5.1, 1}
	}
}
params[colors.purple] = {
	blackMsgNumDisplay = {
		type = "3DText",
		position = {13.2, 1.35, -2.34},
		scale = {1, 1, 1},
		rotation = {90, 0, 90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	blueMsgNumDisplay = {
		type = "3DText",
		position = {13.2, 1.35, -3.67},
		scale = {1, 1, 1},
		rotation = {90, 0, 90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	redMsgNumDisplay = {
		type = "3DText",
		position = {13.2, 1.35, -5},
		scale = {1, 1, 1},
		rotation = {90, 0, 90},
		callback_function = function(spawned_object) spawned_object.TextTool.setValue("0") end
	},
	msgDeck = {
		type = "ScriptingTrigger",
		position = {19.47, 3.84, 1.81},
		scale = {1, 5.1, 1}
	}
}
return params