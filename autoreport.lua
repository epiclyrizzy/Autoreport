repeat
	task.wait()
until game:IsLoaded()

local lib = {
	['notification'] = loadstring(game:HttpGet(("https://raw.githubusercontent.com/AbstractPoo/Main/main/Notifications.lua"), true))(),
	['cooldown'] = false,
	['username'] = 'unknown',
	['bw'] = 'unknown'
}

local words = {
    ['youtube'] = 'Offsite Links',
    ['cheat'] = 'Scamming',
    ['exploit'] = 'Scamming',
    ['hack'] = 'Scamming',
    ['download'] = 'Scamming',
    ['gay'] = 'Bullying',
    ['trans'] = 'Bullying',
    ['lgbt'] = 'Bullying',
    ['lesbian'] = 'Bullying',
    ['suicide'] = 'Bullying',
    ['f@g0t'] = 'Bullying',
    ['furry'] = 'Bullying',
    ['furries'] = 'Bullying',
    ['nigger'] = 'Bullying',
    ['bible'] = 'Bullying',
    ['nigga'] = 'Bullying',
    ['report'] = 'Bullying',
    ['niga'] = 'Bullying',
    ['bitch'] = 'Bullying',
    ['cringe'] = 'Bullying',
    ['trash'] = 'Bullying',
    ['allah'] = 'Bullying',
    ['dumb'] = 'Bullying',
    ['idiot'] = 'Bullying',
    ['kid'] = 'Bullying',
    ['clown'] = 'Bullying',
    ['bozo'] = 'Bullying',
    ['faggot'] = 'Bullying',
    ['autist'] = 'Bullying',
    ['autism'] = 'Bullying',
    ['get a life'] = 'Bullying',
    ['nolife'] = 'Bullying',
    ['no life'] = 'Bullying',
    ['adopted'] = 'Bullying',
    ['skill issue'] = 'Bullying',
    ['muslim'] = 'Bullying',
    ['gender'] = 'Bullying',
    ['parent'] = 'Bullying',
    ['islam'] = 'Bullying',
    ['christian'] = 'Bullying',
    ['noob'] = 'Bullying',
    ['retard'] = 'Bullying',
    ['burn'] = 'Bullying',
    ['stupid'] = 'Bullying',
    ['pride'] = 'Bullying',
    ['mother'] = 'Bullying',
    ['father'] = 'Bullying',
    ['homo'] = 'Bullying',
    ['hate'] = 'Bullying',
    ['cum'] = 'Swearing',
    ['cock'] = 'Swearing',
    ['penis'] = 'Swearing',
    ['dick'] = 'Swearing',
    ['sex'] = 'Swearing',
    ['wthf'] = 'Swearing',
    ['shit'] = 'Swearing',
    ['fuck'] = 'Swearing',
    ['ass'] = 'Swearing',
    ['bastard'] = 'Swearing',
    ['damn'] = 'Swearing',
    ['hell'] = 'Swearing',
    ['piss'] = 'Swearing',
    ['slut'] = 'Swearing',
    ['whore'] = 'Swearing',
    ['arse'] = 'Swearing',
    ['bugger'] = 'Swearing',
    ['bollocks'] = 'Swearing',
    ['bloody'] = 'Swearing',
    ['wanker'] = 'Swearing',
    ['tosser'] = 'Swearing',
    ['twat'] = 'Swearing'
}


local players = game:GetService('Players')
local user = game:GetService('Players').LocalPlayer

function lib.notify()
	lib.notification:message{
		Title = "AutoReport",
		Description = "Reported " .. lib.username .. ' for saying "' .. lib.bw .. '"',
		Icon = 6023426926
	}
end

function lib.report(user, name, rs)
	if user and lib.cooldown == false then
		lib.username = name
		local suc, er = pcall(function()
			players:ReportAbuse(players:FindFirstChild(name), rs, 'breaking TOS')
		end)
		if not suc then
			return warn("Couldn't report due to the reason: " .. er .. ' | AR')
		else
			lib.notify()
		end
		lib.cooldown = true
		task.wait(5)
		lib.username = 'unknown'
		lib.bw = 'unknown'
		lib.cooldown = false
	end
end

players.PlayerChatted:Connect(function(chatType, plr, msg)
	msg = string.lower(msg)
	if chatType ~= Enum.PlayerChatType.Whisper and plr ~= user then
		for i, v in next, words do
			if string.find(msg, i) then
				lib.bw = i
				lib.report(plr.UserId, plr.Name,v)
			end
		end
	end
end)

lib.notification:message{
	Title = "AutoReport",
	Description = "Made by Hallow",
	Icon = 6023426926
}
