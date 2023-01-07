# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest, json, asyncdispatch
import nimdred

test "connect":
  echo newNimdred()

test "set status":
  var body = %*{
    "statusMessage": "Status set by nimdred!"
  }
  discard waitFor newNimdred().put("/lol-chat/v1/me", $body)
  