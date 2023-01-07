import std/[options, strutils, parseopt]
import winim/com

proc getLockfile*(): Option[tuple[port:string, token: string]] =
  var
    file: string
    info: seq[string]
  try:
    file = readFile(r"C:\Riot Games\League of Legends\lockfile")
  except:
    return
  info = file.split(":")
  return some((port: info[2], token: info[3]))

proc getCmdArgs*(): Option[string] =
  var wmi = GetObject(r"winmgmts:\\.\root\cimv2")
  for i in wmi.execQuery("select * from win32_process"):
    if i.name == "LeagueClientUx.exe":
      return some($i.commandline)

proc parseArgs*(args: string): Option[tuple[port: string, token: string]] =
  var
    p = initOptParser(args)
    port: string
    token: string

  for kind, key, value in p.getopt():
    case kind
    of cmdEnd: doAssert(false)
    of cmdShortOption, cmdLongOption:
      if key == "app-port": port = value
      elif key == "remoting-auth-token": token = value
    of cmdArgument: discard
    
  if port != "" and token != "":
    return some((port: port, token: token))