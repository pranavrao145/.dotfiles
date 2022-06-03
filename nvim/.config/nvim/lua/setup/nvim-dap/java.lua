local dap = require("dap")

dap.configurations.java = {
  {
    javaExec = "/usr/bin/java",
    mainClass = "app.App",
    name = "Launch Main",
    request = "launch",
    type = "java",
  },
}
