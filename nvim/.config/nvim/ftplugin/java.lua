local jdtls_config = require("lsp").get_jdtls_config()

require("jdtls").start_or_attach(jdtls_config)
