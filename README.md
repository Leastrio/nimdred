# <img src="assets/nimdred_logo.png" width="75px" height="75px"/>  Nimdred
An LCU library for the nim language

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