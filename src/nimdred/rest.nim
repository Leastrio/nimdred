import objects
import std/[httpclient, strformat, asyncdispatch]

proc get*(self: NimdredClient, path: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.request(&"https://127.0.0.1:{self.port}{path}", HttpGet, "", self.headers)

proc post*(self: NimdredClient, path: string, body: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.request(&"https://127.0.0.1:{self.port}{path}", HttpPost, body, self.headers)

proc patch*(self: NimdredClient, path: string, body: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.request(&"https://127.0.0.1:{self.port}{path}", HttpPatch, body, self.headers)

proc delete*(self: NimdredClient, path: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.request(&"https://127.0.0.1:{self.port}{path}", HttpDelete, "", self.headers)

proc put*(self: NimdredClient, path: string, body: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.request(&"https://127.0.0.1:{self.port}{path}", HttpPut, body, self.headers)