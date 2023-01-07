# <img src="assets/nimdred_logo.png" width="75px" height="75px"/>  Nimdred
An LCU library for the nim language

**This library was made by me to learn nim, i do not recommend using it at all. I will gladly take any contributions anyone wants to make.**

### TODO
- [ ] a sync client
- [ ] websocket stuff
- [ ] make it better

## Modules Required
[asyncdispatch](https://nim-lang.org/docs/asyncdispatch.html) - This is required as the http methods are all async

## Usage Example
```nim
import nimdred
import std/[asyncdispatch, json]

var client = newNimdred()
var body = %*{
  "statusMessage": "Status set by nimdred!"
}

waitFor client.post("/lol-chat/v1/me", $body)
```

Make sure to compile with ssl `-d:ssl`
