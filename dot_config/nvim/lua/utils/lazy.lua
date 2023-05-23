return {
  is_available = function(plugin)
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")

    return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
  end,
  is_loaded = function(name)
    local Config = require("lazy.core.config")
    local lazyplugin = Config.plugins[name]

    return lazyplugin._.loaded.time ~= nil
  end
}
