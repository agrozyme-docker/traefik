#!/usr/bin/lua
local core = require("docker-core")

local function main()
  local etc = "/usr/local/etc/traefik"
  core.run("apk add --no-cache traefik@testing")
  core.run("mkdir -p %s", etc)
  core.append_file(
    "/etc/traefik/traefik.toml",
    "\n",
    "[file] \n",
    string.format('  directory = "%s" \n', etc),
    "  watch = true \n"
  )
end

main()
