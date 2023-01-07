import std/[httpclient, options, base64, net]
import private/utils

type
    NimdredClient* = object
        port*: string
        httpClient*: AsyncHttpClient
        headers*: HttpHeaders
    ClientCreationException* = object of OSError

proc createHttpClient(): AsyncHttpClient =
  return newAsyncHttpClient(
    sslContext=newContext(caFile="./riotgames.pem"),
  )

proc createHeaders(token: string): HttpHeaders =
  return newHttpHeaders({
    "Authorization": "Basic " & encode("riot:" & token),
    "Content-Type": "application/json"
  })

proc newNimdred*(): NimdredClient =
  var 
    creds = getLockFile()
    args: Option[string]

  if creds.isSome():
    return NimdredClient(
      port: creds.get().port,
      httpClient: createHttpClient(),
      headers: createHeaders(creds.get().token)
    )
  else:
    args = getCmdArgs()
    if args.isSome():
      creds = parseArgs(args.get())
      if creds.isSome():
        return NimdredClient(
          port: creds.get().port,
          httpClient: createHttpClient(),
          headers: createHeaders(creds.get().token)
        )
  raise ClientCreationException.newException("Failed to create client.")
        
