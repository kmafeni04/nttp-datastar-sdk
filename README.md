# http-nelua-datastar-sdk

A [datastar](https://data-star.dev) sdk for [http-nelua](https://github.com/kmafeni04/http-nelua)

## How to install

Add to your nlpm package dependencies
```lua
{
  name = "http-nelua-datastar-sdk",
  repo = "https://github.com/kmafeni04/http-nelua-datastar-sdk",
  version = "COMMIT-HASH-OR-TAG",
},
```

## Quick start

```lua
local http = require "http"
local datastar = require "datastar"

local app = http.Server.new()

app:get(nil, "/", function(self: *http.Server): http.Response
  local sseg, err = datastar.ServerSentEventGenerator.new(self)
  if err ~= "" then return self:error() end

  local err = sseg:patch_elements('<div id="hello">Patching element</div>')
  if err ~= "" then return self:error() end
  
  local err = sseg:patch_signals('{foo: 1}')
  if err ~= "" then return self:error() end

  return sseg.resp
end)

app:serve()
```

## Reference

### datastar

```lua
local datastar = @record{}
```

### datastar.ServerSentEventGenerator

```lua
local datastar.ServerSentEventGenerator = @record{
  server: *http.Server,
  resp: http.Response
}
```

### datastar.ServerSentEventGenerator.new

```lua
function datastar.ServerSentEventGenerator.new(server: *http.Server, resp: http.Response): (datastar.ServerSentEventGenerator, string) 
```

### datastar.ElementPatchMode

```lua
local datastar.ElementPatchMode = @enum{
  null = -1,
  Inner,
  Outer,
  Replace,
  Prepend,
  Append,
  Before,
  After,
  Remove,
}
```

### datastar.PatchElementsOpts

```lua
local datastar.PatchElementsOpts = @record{
  selector: string,
  mode: datastar.ElementPatchMode,
  use_view_transition: boolean,
  event_id: string,
  retry_duration: uinteger
}
```

### datastar.ServerSentEventGenerator:patch_elements

```lua
function datastar.ServerSentEventGenerator:patch_elements(
  elements: string,
  opts: facultative(datastar.PatchElementsOpts)
): string
```

### datastar.RemoveElementsOpts

```lua
local datastar.RemoveElementsOpts = @record{
  use_view_transition: boolean,
  event_id: string,
  retry_duration: uinteger
}
```

### datastar.ServerSentEventGenerator:remove_elements

```lua
function datastar.ServerSentEventGenerator:remove_elements(
  selector: string,
  opts: facultative(datastar.RemoveElementsOpts)
): string
```

### datastar.PatchSignalsOpts

```lua
local datastar.PatchSignalsOpts = @record{
  only_if_missing: boolean,
  event_id: string,
  retry_duration: uinteger
}
```

### datastar.ServerSentEventGenerator:patch_signals

```lua
function datastar.ServerSentEventGenerator:patch_signals(
  signals: string,
  opts: facultative(datastar.PatchSignalsOpts)
): string
```

### datastar.ExecuteScriptOpts

```lua
local datastar.ExecuteScriptOpts = @record{
  auto_remove: boolean,
  attributes: sequence(string),
  event_id: string,
  retry_duration: uinteger
}
```

### datastar.ServerSentEventGenerator:execute_script

```lua
function datastar.ServerSentEventGenerator:execute_script(
  script: string,
  opts: facultative(datastar.ExecuteScriptOpts)
): string
```

### datastar.ServerSentEventGenerator:redirect

```lua
function datastar.ServerSentEventGenerator:redirect(path: string)
```

### datastar.read_signals

```lua
function datastar.read_signals(server: *http.Server): (http.json.JsonNode, string)
```

