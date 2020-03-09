#!/usr/bin/lua
local core = require("docker-core")

local function main()
  core.update_user()
  core.run("traefik")
end

main()
