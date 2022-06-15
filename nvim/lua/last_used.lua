-- local function log(message)
-- local function write_log(message)
-- 	local logfile = io.open("/home/zx/logfile", "a")
-- 	io.output(logfile)
-- 	io.write(message)
-- 	io.close(logfile)
-- end

-- local function log_table(t)
-- 	log("table\n")
-- 	for k, v in pairs(t) do
-- 		log("i: " .. k .. ", v:" .. v .. "\n")
-- 	end
-- end

local function directory_exists(path)
	return vim.fn.isdirectory(path) == 1
end

-- create global lru files if it doesn't exist
local last_used_path = os.getenv("HOME") .. '/marks/file_history.txt'
io.close(io.open(last_used_path, "a+"))

-- set up dir lru folders and file if not exists
local current_dir = vim.fn.getcwd()
local hash = vim.fn.sha256(current_dir)
local dir_sha256_path = os.getenv("HOME") .. '/marks/dir_sha256/'
local dir_sha256_hash_path = dir_sha256_path .. hash
local dir_last_used_path = dir_sha256_hash_path .. '/last_used.txt'
if not directory_exists(dir_sha256_path) then
	vim.fn.mkdir(dir_sha256_path)
end
if not directory_exists(dir_sha256_hash_path) then
	vim.fn.mkdir(dir_sha256_hash_path)
end
io.close(io.open(dir_last_used_path, "a+"))


local function file_exists(name)
	local f = io.open(name,"r")
	if f ~= nil then
		io.close(f) return true
	else
		return false
	end
end

local function file_contents_by_line_to_table(file_path)
	local lines = {}
	local file = io.open(file_path, "r")
	if file == nil then return lines end
	local content = file:read("*a")
	io.close(file)
	for line in content:gmatch("([^\n]*)\n?") do
		table.insert(lines, line)
	end

	return lines
end

-- write content to file prepending /n
local function append_to_file(path, content)
	local file = io.open(path, "a")
	io.output(file)
	io.write("\n" .. content)
	io.close(file)
end

-- return true if the element is in table
local function update_lru_list(list, elem)
	for i, v in ipairs(list) do
		if elem == v then
			table.remove(list, i)
			table.insert(list, v)
			return true
		end
	end
	return false
end

local function update_lru_file(current_lru_list, lru_path)
	local final_lru_list = {}
	local final_lru_set = {}
	for _, v in pairs(current_lru_list) do
		if not final_lru_set[v] then
			table.insert(final_lru_list, v)
			final_lru_set[v] = true
		end
	end

	local lastest_lru_list = file_contents_by_line_to_table(lru_path)
	for _, v in pairs(lastest_lru_list) do
		if not final_lru_set[v] then
			table.insert(final_lru_list, v)
			final_lru_set[v] = true
		end
	end

	local last_50_path_list = {}

	for i=math.max(#final_lru_list-51, 1), #final_lru_list do
		local v = final_lru_list[i]
		if string.len(v) > 0 then
			table.insert(last_50_path_list, v)
		end
	end

	local lru_file = io.open(lru_path, "w")
	io.output(lru_file)
	io.write(table.concat(last_50_path_list, "\n").."\n")
	io.close(lru_file)
end

local path_list = file_contents_by_line_to_table(last_used_path)
local dir_path_list = file_contents_by_line_to_table(dir_last_used_path)

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local cur_path = vim.api.nvim_buf_get_name(0)
		if not file_exists(cur_path) then return end

		local found_in_path_list = update_lru_list(path_list, cur_path)
		if not found_in_path_list then
			table.insert(path_list, cur_path)
			append_to_file(last_used_path, cur_path)
		end

		local found_in_dir_path_list = update_lru_list(dir_path_list, cur_path)
		if not found_in_dir_path_list then
			table.insert(dir_path_list, cur_path)
			append_to_file(dir_last_used_path, cur_path)
		end
	end
})

vim.api.nvim_create_autocmd("ExitPre", {
	callback = function()
		update_lru_file(path_list, last_used_path)
		update_lru_file(dir_path_list, dir_last_used_path)
	end
})
