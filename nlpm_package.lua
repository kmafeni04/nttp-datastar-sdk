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
      name = "nttp",
      repo = "https://github.com/kmafeni04/nttp",
      version = "#7b03ae14fb011d93173e8e20c752fc2c1426d13c",
    },
    {
      name = "ssdg",
      repo = "https://github.com/kmafeni04/ssdg",
      version = "#9e1fb58f183ae7efea98d25a40d6d1bf38f483af",
    },
  },
  scripts = {
    example_basic = "nelua example/basic/app.nelua",
    docs = "nelua datastar-doc.nelua",
  },
}
