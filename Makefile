NVIM ?= nvim

.PHONY: test test-indent test-ftdetect test-syntax test-ftplugin test-config

test: test-indent test-ftdetect test-syntax test-ftplugin test-config

test-indent:
	$(NVIM) --headless -u tests/minimal_init.lua -c "luafile tests/test_indent.lua" -c "qa!"

test-ftdetect:
	$(NVIM) --headless -u tests/minimal_init.lua -c "luafile tests/test_ftdetect.lua" -c "qa!"

test-syntax:
	$(NVIM) --headless -u tests/minimal_init.lua -c "luafile tests/test_syntax.lua" -c "qa!"

test-ftplugin:
	$(NVIM) --headless -u tests/minimal_init.lua -c "luafile tests/test_ftplugin.lua" -c "qa!"

test-config:
	$(NVIM) --headless -u tests/minimal_init.lua -c "luafile tests/test_config.lua" -c "qa!"
