# lua-discordRPC
LuaJIT bindings for the [Discord Rich Presence library](https://github.com/discordapp/discord-rpc) (v3.3.0).

# Usage
To use this library, download the binaries of discord-rpc (or build them yourself) and make sure the dynamic library is in some location it can be loaded from (e.g. on Windows: https://msdn.microsoft.com/en-us/library/windows/desktop/ms682586(v=vs.85).aspx, usually just next to the executable).

If you downloaded a release from the discord-rpc github, the file you are looking for will be in `discord-rpc/winX-dynamic/bin/discord-rpc.dll` (choose X according to whether your executable is 32 or 64 bit)

Then just do `local discordRPC = require "discordRPC"` wherever you need it.

*If you are using löve, just put the appropriate .dll next to your löve executable*

An example of the usage of the library using [löve](https://love2d.org/) can be found in `main.lua`.

# Documentation
How and when to use the functions that are part of the Discord RPC API is identical to the C API, therefore you should first make yourself familiar with the API documentation on Discord's website:

https://discordapp.com/developers/docs/rich-presence/how-to

All other differences and the function signatures are as follows:

## `discordRPC.initialize(applicationId, autoRegister, optionalSteamId)` (*Discord_Initialize*)
* `applicationId` must be a string
* `autoRegister` must be a boolean
* `optionalSteamId` may be nil (i.e. not passed at all) or a string

You do not have to pass `handlers` to this function, instead you may define functions in the module table of discordRPC:

**Notes about callbacks**:
Just-In-Time compilation is disabled for callbacks (for reasons, see the comment in the implementation of `discordRPC.runCallbacks`), so try to avoid doing performance critical tasks in them.

### `discordRPC.ready(userId, username, discriminator, avatar)`
`userId`, `username`, `discriminator` and `avatar` are all strings

### `discordRPC.errored(errorCode, message)`
* `errorCode` is a number
* `message` is a string

### `discordRPC.disconnected(errorCode, message)`
* `errorCode` is a number
* `message` is a string

### `discordRPC.joinGame(joinSecret)`
`joinSecret` is a string

### `discordRPC.spectateGame(spectateSecret)`
`spectateSecret` is a string

### `discordRPC.joinRequest(userId, username, discriminator, avatar)`
`userId`, `username`, `discriminator` and `avatar` are all strings

## `discordRPC.shutdown()` (*Discord_Shutdown*)

## `discordRPC.runCallbacks()` (*Discord_RunCallbacks*)

## `discordRPC.updatePresence(presence)` (*Discord_UpdatePresence*)
`presence` must be a table with the following keys (all optional):
* `state` must be a string (max length: 127)
* `details` must be a string (max length: 127)
* `startTimestamp` must be an integer (52 bit, signed)
* `endTimestamp` must be an integer (52 bit, signed)
* `largeImageKey` must be a string (max length: 31)
* `largeImageText` must be a string (max length: 127)
* `smallImageKey` must be a string (max length: 31)
* `smallImageText` must be a string (max length: 127)
* `partyId` must be a string (max length: 127)
* `partySize` must be an integer (32 bit, signed)
* `partyMax` must be an integer (32 bit, signed)
* `matchSecret` must be a string (max length: 127)
* `joinSecret` must be a string (max length: 127)
* `spectateSecret` must be a string (max length: 127)
* `instance` must be an integer (8 bit, signed)

## `discordRPC.clearPresence()` (*Discord_ClearPresence*)

## `discordRPC.respond(userId, reply)` (*Discord_Respond*)
* `userId` is a string
* `reply` is now a string and must be either (`"no"` (0), `"yes"` (1) or `"ignore"` (2))
