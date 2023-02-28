import macros

const ansiReset = "\e[0m"

macro vt100Style*(arg: untyped): untyped =
  ## generates a basic colorizing proc
  arg.expectLen 2
  let name = arg[0]
  let code = arg[1]
  let completeCode = newLit("\e[" & $code.intVal & "m")

  result = quote do:
    proc `name`*(s: string): string = `completeCode` & s & ansiReset


macro vt100Styles*(body: untyped) =
  ## generate vt100 procs for multiple styles/colors
  expectKind(body, nnkStmtList)
  result = newStmtList()
  for x in body.children:
    result.add(nnkCommand.newTree(
      ident("vt100Style"),
      x
    ))

export vt100Styles, vt100Style
