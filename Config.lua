Config = {}

Config.Vorp = false
Config.GumCore = true

Config.Job = "vet"
Key = 0x760A9C6F -- G



Config.ZonesVet = {
    vetval = {
        Pos = { x = -255.49, y = 741.47, z = 118.26 },
    },
    vetstraw = {
        Pos = { x = -1837.67, y = -418.51, z = 161.76 },
    },
    vetbw = {
        Pos = { x = -791.52, y = -1347.83, z = 43.86 },
    },
    
}

Config.Language = {
    -- MENU JOB VET---
    [1] = {text = "Horse Medicine"}, -- label
    [2] = {text = "Horse Medicine $5"}, -- desc
    [3] = {text = "Dog Medicine"}, -- label
    [4] = {text = "Dog Medicine $5"}, -- desc
    [5] = {text = "Vet Shop"}, -- title
    [6] = {text = "Buy Vet Supplies"}, -- subtext
    -- MSG ---
    [7] = {text = "Press G To Access The Vet Shop"}, -- subtext
    --- NOTIFY ---
    [50] = {text = "Vet"},
    [51] = {text = "You Bought 1 Horse Medicine"},
    [52] = {text = "You Bought 1 Dog Medicine"},
    [53] = {text = "Inventory"},
    [54] = {text = "Vet"},
    ---BLIP---
    [100] = {text = "Veterinary"},
}