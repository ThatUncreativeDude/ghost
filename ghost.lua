-- Ghost.lua

--[[
    Ghost Library

    This Lua module provides network-related functions such as ping, WHOIS lookup, traceroute, and HTTP requests.

    To use this module, you will need to have the following dependencies installed on your system:
      - Curl: https://curl.se/download.html
      - Whois: http://www.linux.it/~md/software/
      - Traceroute: https://github.com/korczis/traceroute-windows
      - LuaSocket (optional, for additional networking functionality): https://github.com/diegonehab/luasocket

    Please make sure you have these dependencies installed and added to your system's PATH environment variable before using this module.

    Usage:

      local Ghost = require("Ghost")

      Ghost.ping("8.8.8.8") -- Pings the given IP address
      Ghost.whois("google.com") -- Retrieves WHOIS information for the given domain name
      Ghost.traceroute("google.com") -- Traces the route packets take to reach the given destination
      local response_body = Ghost.http_request("https://example.com") -- Makes an HTTP request to the given URL and returns the response body

    Author: @ThatUncreativeDude on GitHub
    Version: 1.0.0
--]]

-- Check if the user is on Windows 10
if os.getenv("OS") ~= "Windows_NT" or tonumber(os.getenv("PROCESSOR_ARCHITECTURE")) ~= 9 then
    print("Sorry, this script does not support your OS")
    os.exit()
  end
  
  -- Check if the user is on Windows 11
  if os.getenv("OS") == "Windows_NT" and tonumber(os.getenv("PROCESSOR_ARCHITECTURE")) == 9 and tonumber(os.getenv("WINDOWS_PRODUCT_NAME_MAJOR_VERSION")) == 11 then
    print("Warning: This script may not be optimized for Windows 11")
  end
  
  -- Define the Ghost module
  local Ghost = {}
  
  -- Define module level constants
  Ghost.VERSION = "1.0.0"
  
  -- Ping an IP address and print the response
  function Ghost.ping(ip)
    local handle = io.popen("ping -n 1 " .. ip)
    local result = handle:read("*a")
    handle:close()
    print(result)
  end
  
  -- Retrieve WHOIS information for a domain name or IP address
  function Ghost.whois(domain_or_ip)
    local handle = io.popen("whois " .. domain_or_ip)
    local result = handle:read("*a")
    handle:close()
    print(result)
  end
  
  -- Trace the route packets take to reach a destination
  function Ghost.traceroute(destination)
    local handle = io.popen("tracert " .. destination)
    local result = handle:read("*a")
    handle:close()
    print(result)
  end
  
  -- Make an HTTP request and return the response body
  function Ghost.http_request(url)
    local handle = io.popen("curl --silent " .. url)
    local result = handle:read("*a")
    handle:close()
    return result
  end
  
  return Ghost
  
