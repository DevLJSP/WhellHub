local players = game:GetService("Players")
local player = players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local textBox = Instance.new("TextBox")
local button = Instance.new("TextButton")

-- Configurando o GUI
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "SpeedGui"

textBox.Parent = screenGui
textBox.Position = UDim2.new(0.5, -100, 0.4, 0)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Text = "Insira a velocidade"

button.Parent = screenGui
button.Position = UDim2.new(0.5, -100, 0.5, 0)
button.Size = UDim2.new(0, 200, 0, 50)
button.Text = "Mudar Velocidade"

-- Função para mudar a velocidade do carro
local function findVehicle()
    for _, v in pairs(workspace.Vehicles:GetChildren()) do
        if v:FindFirstChild("Owner") and v.Owner.Value == player then
            return v
        end
    end
    return nil
end

button.MouseButton1Click:Connect(function()
    local speed = tonumber(textBox.Text)
    if speed and speed > 0 then
        local vehicle = findVehicle()
        if vehicle then
            local driveSeat = vehicle:FindFirstChild("DriveSeat")
            if driveSeat then
                driveSeat.MaxSpeed = speed
                print("Velocidade alterada para " .. speed)
            end
        else
            warn("Veículo não encontrado.")
        end
    else
        warn("Insira uma velocidade válida.")
    end
end)
