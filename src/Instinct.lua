--[[
	Instinct
		Loads the Framework
		
	Usage:
		require(Instinct).Load("Client" | "Server")
		This will setup the Instinct Framework environment
		in the Instinct namespace
--]]

-- Probe environment

local pre = _G.__InstinctPresets
local ltype
if pre then
	ltype = pre.LoadType
end

if not pre then
	error("[Instinct Master Error] Could not load Instinct, _G.__InstinctPresests is not defined.")
end

if not ltype then
	error("[Instinct Master Error] Could not find LoadType, Instinct cannot load.")
end

-- Define Instinct lib
local Instinct = {} 

Instinct.Global = [=[
Option	
Create
]=]

Instinct.Client = [=[
Palette		
]=]

Instinct.Server = [=[
	
]=]

local root = game.Lighting.Instinct

--[[ Instinct.Load
	@arg1: List (newline seperated module load list)
--]]
function Instinct.Load(List)
	for ModuleName in List:gmatch("[^\n]+") do 
		print(ModuleName, "hai")
		local newroot = root
		local objpointer = Instinct -- pointer to the table 
		local previous = nil
		for NameMatch in ModuleName:gmatch("(%w+)/?") do
			local try = newroot:FindFirstChild(NameMatch)
			if try then
				newroot = try
				if not objpointer[try] then 
					objpointer[try] = {} 
					previous = objpointer
					objpointer = objpointer[try]
				end
			else 
				newroot = nil 
				break
			end	
		end
		if newroot and newroot:IsA("ModuleScript") and previous then 
			print(newroot, type(newroot), newroot.Parent)
			local Name = newroot.Name
			local out = require(newroot)
			if type(out) == "table" and Instinct.Create and not out.__noreg then
				Instinct.Create.Register(out)
				Instinct.Create.RegisterClassName(ModuleName, out)
			end
			previous[Name] = out
		else
			print("[Instinct Error] [Load]: Unable to load module: "..ModuleName..", module does not exist!")
		end
	end
end

function Instinct.Initialize(mode)
	if mode == "Server" then
		Instinct.Client = nil
		Instinct.Load(Instinct.Global)
		Instinct.Load(Instinct.Server)
	elseif mode == "Client" then
		Instinct.Server = nil
		Instinct.Load(Instinct.Global)
		Instinct.Load(Instinct.Client)
	end
end

Instinct.Initialize(ltype)

return Instinct