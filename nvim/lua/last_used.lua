-- -- Write log to file
-- local function write_log(message)
-- 	local logfile = io.open("/home/zx/logfile", "a")
-- 	io.output(logfile)
-- 	io.write(message)
-- 	io.close(logfile)
-- end

local last_used_path = os.getenv("HOME") .. '/marks/file_history.txt'

-- create file if it doesn't exist
io.close(io.open(last_used_path, "a+"))

local function file_exists(name)
	local f = io.open(name,"r")
	if f ~= nil then
		io.close(f) return true
	else
		return false
	end
end

local function get_path_list()
	local path_list = {}
	local last_used = io.open(last_used_path, "r")
	local content = last_used:read("*a")
	io.close(last_used)
	for line in content:gmatch("([^\n]*)\n?") do
		if file_exists then
			table.insert(path_list, line)
		end
	end

	return path_list
end

local function append_to_path_list(path)
	local last_used = io.open(last_used_path, "a")
	io.output(last_used)
	io.write("\n" .. path)
	io.close(last_used)
end

local path_list = get_path_list()

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local cur_path = vim.api.nvim_buf_get_name(0)
		local found = false

		for i, v in ipairs(path_list) do
			if cur_path == v then
				table.remove(path_list, i)
				table.insert(path_list, v)
				found = true
				break
			end
		end

		if not found and file_exists(cur_path) then
			table.insert(path_list, cur_path)
			append_to_path_list(cur_path)
		end
	end
})

vim.api.nvim_create_autocmd("ExitPre", {
	callback = function()
		local final_path_list = {}
		local final_path_set = {}
		for _, v in pairs(path_list) do
			if file_exists(v) and not final_path_set[v] then
				table.insert(final_path_list, v)
				final_path_set[v] = true
			end
		end

		local lastest_path_list = get_path_list()
		for _, v in pairs(lastest_path_list) do
			if file_exists(v) and not final_path_set[v] then
				table.insert(final_path_list, v)
			end
		end

		local last_50_path_list = {}

		for i=math.max(#final_path_list-51, 1), #final_path_list do
			local v = final_path_list[i]
			-- write_log(string.format("index: %d, value: %s\n", i, v))
			if string.len(v) > 0 then
				table.insert(last_50_path_list, v)
			end
		end

		local last_used = io.open(last_used_path, "w")
		io.output(last_used)
		io.write(table.concat(last_50_path_list, "\n").."\n")
		io.close(last_used)
	end
})
