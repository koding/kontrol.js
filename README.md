# kontrol.js

This is an early iteration of kontrol.js.  Expect nothing to work yet.

# installation

    npm install kontrol.js

# api

getKites Calls the callback function with the list of NewKite instances.
The returned kites are not connected. You must connect with
NewKite.connect().

Query parameters are below from general to specific:

``` go
type KontrolQuery struct {
  username    string
  environment string
  name        string
  version     string
  region      string
  hostname    string
  id          string
}
```

## k.fetchKites(selector, callback)

## k.fetchKite(selector, callback)

## k.watchKites(selector, callback)

## k.cancelWatcher(id, callback)

## k.createKite(kiteDescriptor) : Kite
