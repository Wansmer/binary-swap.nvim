test:
	nvim --headless -u tests/minimal.lua -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal.lua'}"

lint-fix:
	stylua ./lua/
