---@class PackageDependency
---@field name string package name as it will be used in file gen
---@field repo string git repo
---@field version? string git hash(#) or tag(v), defaults to "#HEAD"

---@class Package
---@field dependencies? PackageDependency[] List of package dependencies
---@field scripts? table<string, string> scripts that can be called with `nlpm run`

---@type Package
return {
  dependencies = {
    {
      name = "http-nelua",
      repo = "https://github.com/kmafeni04/http-nelua",
      version = "#ffc3dee2769547ec5d12e711cafaedb2978e6985",
    },
  },
  scripts = {
    example_basic = "nelua example/basic/app.nelua",
  },
}
