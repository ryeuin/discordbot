local discordia = require("discordia")
local client = discordia.Client()
local prefix = "%"
local token = ".."


discordia.extensions() -- load all helpful extensions

client:on("ready", function() -- bot is ready
	print("Logged in as " .. client.user.username)
end)

client:on("messageCreate", function(message)

	local content = message.content
	local args = content:split(" ") -- split all arguments into a table

	if args[1] == prefix .. "ping" then
		message:reply("Pong!")
	elseif args[1] == prefix .. "echo" then
		table.remove(args, 1) -- remove the first argument (!echo) from the table
		message:reply(table.concat(args, " ")) -- concatenate the arguments into a string, then reply with it
	end

end)


client:run(token)