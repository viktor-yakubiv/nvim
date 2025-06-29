-- Vim Keymap file for Ukrainian characters, layout 'jcuken', MacOS variant
--
-- Based on the Ukrainian Jcuken keymap by Anatoli Sakhnik <sakhnik@gmail.com>
-- provided in Vim repository
--
-- All characters are given literally, conversion to another encoding (e.g.,
-- UTF-8) should work.

local ukrainian = {
	-- ["~"] = "~",
	["`"] = "'",
	["F"] = "А", -- CYRILLIC CAPITAL LETTER A
	["<"] = "Б", -- CYRILLIC CAPITAL LETTER BE
	["D"] = "В", -- CYRILLIC CAPITAL LETTER VE
	["U"] = "Г", -- CYRILLIC CAPITAL LETTER GHE
	["L"] = "Д", -- CYRILLIC CAPITAL LETTER DE
	["T"] = "Е", -- CYRILLIC CAPITAL LETTER IE
	[":"] = "Ж", -- CYRILLIC CAPITAL LETTER ZHE
	["P"] = "З", -- CYRILLIC CAPITAL LETTER ZE
	["S"] = "И", -- CYRILLIC CAPITAL LETTER I
	["Q"] = "Й", -- CYRILLIC CAPITAL LETTER SHORT I
	["R"] = "К", -- CYRILLIC CAPITAL LETTER KA
	["K"] = "Л", -- CYRILLIC CAPITAL LETTER EL
	["V"] = "М", -- CYRILLIC CAPITAL LETTER EM
	["Y"] = "Н", -- CYRILLIC CAPITAL LETTER EN
	["J"] = "О", -- CYRILLIC CAPITAL LETTER O
	["G"] = "П", -- CYRILLIC CAPITAL LETTER PE
	["H"] = "Р", -- CYRILLIC CAPITAL LETTER ER
	["C"] = "С", -- CYRILLIC CAPITAL LETTER ES
	["N"] = "Т", -- CYRILLIC CAPITAL LETTER TE
	["E"] = "У", -- CYRILLIC CAPITAL LETTER U
	["A"] = "Ф", -- CYRILLIC CAPITAL LETTER EF
	["{"] = "Х", -- CYRILLIC CAPITAL LETTER HA
	["W"] = "Ц", -- CYRILLIC CAPITAL LETTER TSE
	["X"] = "Ч", -- CYRILLIC CAPITAL LETTER CHE
	["I"] = "Ш", -- CYRILLIC CAPITAL LETTER SHA
	["O"] = "Щ", -- CYRILLIC CAPITAL LETTER SHCHA
	["}"] = "Ї", -- CYRILLIC CAPITAL LETTER YI
	["B"] = "І", -- CYRILLIC CAPITAL LETTER BYELORUSSION-UKRAINIAN I
	["M"] = "Ь", -- CYRILLIC CAPITAL LETTER SOFT SIGN
	['"'] = "Є", -- CYRILLIC CAPITAL LETTER UKRAINIAN IE
	[">"] = "Ю", -- CYRILLIC CAPITAL LETTER YU
	["Z"] = "Я", -- CYRILLIC CAPITAL LETTER YA
	["|"] = "Ґ", -- CYRILLIC CAPITAL LETTER GHE WITH UPTURN
	["f"] = "а", -- CYRILLIC SMALL LETTER A
	[","] = "б", -- CYRILLIC SMALL LETTER BE
	["d"] = "в", -- CYRILLIC SMALL LETTER VE
	["u"] = "г", -- CYRILLIC SMALL LETTER GHE
	["l"] = "д", -- CYRILLIC SMALL LETTER DE
	["t"] = "е", -- CYRILLIC SMALL LETTER IE
	[";"] = "ж", -- CYRILLIC SMALL LETTER ZHE
	["p"] = "з", -- CYRILLIC SMALL LETTER ZE
	["s"] = "и", -- CYRILLIC SMALL LETTER I
	["q"] = "й", -- CYRILLIC SMALL LETTER SHORT I
	["r"] = "к", -- CYRILLIC SMALL LETTER KA
	["k"] = "л", -- CYRILLIC SMALL LETTER EL
	["v"] = "м", -- CYRILLIC SMALL LETTER EM
	["y"] = "н", -- CYRILLIC SMALL LETTER EN
	["j"] = "о", -- CYRILLIC SMALL LETTER O
	["g"] = "п", -- CYRILLIC SMALL LETTER PE
	["h"] = "р", -- CYRILLIC SMALL LETTER ER
	["c"] = "с", -- CYRILLIC SMALL LETTER ES
	["n"] = "т", -- CYRILLIC SMALL LETTER TE
	["e"] = "у", -- CYRILLIC SMALL LETTER U
	["a"] = "ф", -- CYRILLIC SMALL LETTER EF
	["["] = "х", -- CYRILLIC SMALL LETTER HA
	["w"] = "ц", -- CYRILLIC SMALL LETTER TSE
	["x"] = "ч", -- CYRILLIC SMALL LETTER CHE
	["i"] = "ш", -- CYRILLIC SMALL LETTER SHA
	["o"] = "щ", -- CYRILLIC SMALL LETTER SHCHA
	["]"] = "ї", -- CYRILLIC SMALL LETTER YI
	["b"] = "і", -- CYRILLIC SMALL LETTER BYELORUSSION-UKRAINIAN I
	["m"] = "ь", -- CYRILLIC SMALL LETTER SOFT SIGN
	["'"] = "є", -- CYRILLIC SMALL LETTER UKRAINIAN IE
	["."] = "ю", -- CYRILLIC SMALL LETTER YU
	["z"] = "я", -- CYRILLIC SMALL LETTER YA
	["\\"] = "ґ", -- CYRILLIC SMALL LETTER GHE WITH UPTURN
	-- ["@"] = "\"",
	-- ["#"] = "№",
	-- ["$"] = "*",
	-- ["%"] = ":",
	-- ["^"] = ",",
	-- ["&"] = ".",
	-- ["*"] = ";",
	-- "~~      <char-0x301>        Stress
}

return ukrainian
