#!/usr/bin/env bash

JAR="$HOME/.local/share/lsp/jdtls-server/plugins/org.eclipse.equinox.launcher_*.jar"

java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.level=ALL \
  -Xmx1G \
  -jar $(echo "$JAR") \
  -configuration "$HOME/.local/share/lsp/jdtls-server/config_linux" \
  -data "$1" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
