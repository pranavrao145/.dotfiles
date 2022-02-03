local dap = require("dap")

dap.configurations.java = {
	{
		javaExec = "/usr/bin/java",
		mainClass = "com.pranavrao.app.Main",
		name = "Launch Main",
		request = "launch",
		type = "java",
	},
}
