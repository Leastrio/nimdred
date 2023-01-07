import objects
import std/[httpclient, strformat, asyncdispatch]

proc GET*(self: NimdredClient, path: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.get(&"https://127.0.0.1:{self.port}{path}")

proc POST*(self: NimdredClient, path: string, body: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.post(&"https://127.0.0.1:{self.port}{path}", body)

proc PATCH*(self: NimdredClient, path: string, body: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.patch(&"https://127.0.0.1:{self.port}{path}", body)

proc DELETE*(self: NimdredClient, path: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.delete(&"https://127.0.0.1:{self.port}{path}")

proc PUT*(self: NimdredClient, path: string, body: string): Future[AsyncResponse] {.async.} =
  return await self.httpClient.put(&"https://127.0.0.1:{self.port}{path}", body)