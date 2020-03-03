#!/usr/bin/lua
local core = require("docker-core")

local function update_settings(items)
  local text = string.gsub([==[

[file]
  directory = "$etc"
  watch = true

    ]==], "$(%w+)", items)

  core.append_file("/etc/traefik/traefik.toml", text)
end

local function main()
  local etc = "/usr/local/etc/traefik"
  core.run("apk add --no-cache traefik@testing")
  core.run("mkdir -p %s", etc)
  update_settings({etc = etc})
end

main()
