--https://github.com/pfirsich/lua-discordRPC

local discordRPC = require("discordRPC")

local appId = require("applicationId")

function discordRPC.ready(userId, username, discriminator, avatar)
    print(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
end

function discordRPC.disconnected(errorCode, message)
    print(string.format("Discord: disconnected (%d: %s)", errorCode, message))
end

function discordRPC.errored(errorCode, message)
    print(string.format("Discord: error (%d: %s)", errorCode, message))
end

function discordRPC.joinGame(joinSecret)
    print(string.format("Discord: join (%s)", joinSecret))
end

function discordRPC.spectateGame(spectateSecret)
    print(string.format("Discord: spectate (%s)", spectateSecret))
end

function discordRPC.joinRequest(userId, username, discriminator, avatar)
    print(string.format("Discord: join request (%s, %s, %s, %s)", userId, username, discriminator, avatar))
    discordRPC.respond(userId, "yes")
end

function love.load()
    discordRPC.initialize(appId, true)
    local now = os.time(os.date("*t"))
    presence = {
        state = "Looking to Play",
        details = "1v1 (Ranked)",
        startTimestamp = now,
        endTimestamp = now + 60,
        partyId = "party id",
        partyMax = 2,
        matchSecret = "match secret",
        joinSecret = "join secret",
        spectateSecret = "spectate secret",
    }

    nextPresenceUpdate = 0
end

function love.update()
    if nextPresenceUpdate < love.timer.getTime() then
        discordRPC.updatePresence(presence)
        nextPresenceUpdate = love.timer.getTime() + 2.0
    end
    discordRPC.runCallbacks()
end

function love.quit()
    discordRPC.shutdown()
end
