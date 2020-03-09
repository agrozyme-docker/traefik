#!/usr/bin/lua
local core = require("docker-core")

local function update_settings(file, items)
  local text =
    string.gsub([==[

[providers]
  [providers.file]
    directory = "$etc"
    watch = true

    ]==], "$(%w+)", items)

  core.append_file(file, text)
end

local function main()
  local file = "/etc/traefik/traefik.toml"
  local etc = "/usr/local/etc/traefik"
  core.run("apk add --no-cache traefik@testing")
  core.run("mkdir -p %s", etc)
  update_settings(file, {etc = etc})
end

main()
