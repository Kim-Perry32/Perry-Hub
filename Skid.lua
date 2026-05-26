local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local spyKeywords = {
    "Block remote", 
    "Clear logs", 
    "Copy code", 
    "Get result", 
    "Ignore remote", 
    "Unblock all remotes",
    "Remote Spy"
}

local function ScanUI(obj)
    local detected = false
    for _, v in pairs(obj:GetDescendants()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            for _, keyword in pairs(spyKeywords) do
                if string.find(string.lower(v.Text), string.lower(keyword)) then 
                    detected = true
                    break
                end
            end
        end
        if detected then break end
    end

    if detected then
        task.wait()
        game:shutdown()
    end
end

for _, child in pairs(CoreGui:GetChildren()) do
    ScanUI(child)
end

CoreGui.ChildAdded:Connect(function(child)
    ScanUI(child)
end)

task.spawn(function()
    while true do
        for _, child in pairs(CoreGui:GetChildren()) do
            ScanUI(child)
        end
        task.wait()
    end
end)
