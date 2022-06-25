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

local vim = vim

local function directory_exists(path)
	return vim.fn.isdirectory(path) == 1
end

local function create_directory_if_not_exists(path)
	if not directory_exists(path) then
		vim.fn.mkdir(path)
	end
end

local function create_file_if_not_exists(path)
	io.close(io.open(path, "a+"))
end

local function cur_line_num()
    return vim.fn.line(".")
end

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

local function split_path_and_line(path)
    local colon_byte = string.byte(":")
    for i=#path,1,-1 do
        if string.byte(path, i) == colon_byte then
            return path:sub(1,i-1), tonumber(path:sub(i+1))
        end
    end

    return path, 0
end

local function paths_lines_pair(paths)
    local line_by_path = {}
    for i, path in ipairs(paths) do
        local pure_path, line = split_path_and_line(path)
        paths[i] = pure_path
        line_by_path[pure_path] = line
    end
    return paths, line_by_path
end

-- write path:line to file prepending \n
local function append_path_to_file(path_of_file, path, line)
	local file = io.open(path_of_file, "a")
	io.output(file)
	io.write("\n" .. path .. ":" .. tostring(line))
	io.close(file)
end

-- return true if the element is in table
local function update_lru_list(path_list, elem)
	for i, v in ipairs(path_list) do
		if elem == v then
			table.remove(path_list, i)
			table.insert(path_list, v)
			return true
		end
	end

	return false
end

local function update_lru_file(current_path_list, line_by_path, lru_file_path)
	local final_lru_path_list = {}
	local final_lru_path_set = {}
	for _, v in pairs(current_path_list) do
		if not final_lru_path_set[v] then
			table.insert(final_lru_path_list, v)
			final_lru_path_set[v] = true
		end
	end

	local lastest_path_list, lastest_line_by_path = paths_lines_pair(file_contents_by_line_to_table(lru_file_path))
	for _, v in pairs(lastest_path_list) do
		if not final_lru_path_set[v] then
			table.insert(final_lru_path_list, v)
			final_lru_path_set[v] = true
            line_by_path[v] = lastest_line_by_path[v]
		end
	end

	local last_50_path_line_list = {}
	for i=math.max(#final_lru_path_list-51, 1), #final_lru_path_list do
		local v = final_lru_path_list[i]
		if string.len(v) > 0 then
			table.insert(last_50_path_line_list, v..':'..line_by_path[v])
		end
	end

	local lru_file = io.open(lru_file_path, "w")
	io.output(lru_file)
	io.write(table.concat(last_50_path_line_list, "\n").."\n")
	io.close(lru_file)
end

local function update_line_by_path(line_by_path)
    local cur_line = cur_line_num()
    local cur_path = vim.api.nvim_buf_get_name(0)
    line_by_path[cur_path] = cur_line
end

-- create marks directory if it doesn't exist
local marks_path = os.getenv("HOME") .. '/marks'
create_directory_if_not_exists(marks_path)

-- create global lru files if it doesn't exist
local last_used_path = os.getenv("HOME") .. '/marks/file_history.txt'
create_file_if_not_exists(last_used_path)

-- set up dir lru folders and file if not exists
local current_dir = vim.fn.getcwd()
local hash = string.gsub(current_dir, "/", ":")
local dir_hash_path = os.getenv("HOME") .. '/marks/dir_hash/'
create_directory_if_not_exists(dir_hash_path)
local dir_hash_hash_path = dir_hash_path .. hash
create_directory_if_not_exists(dir_hash_hash_path)
local dir_last_used_path = dir_hash_hash_path .. '/file_history.txt'
create_file_if_not_exists(dir_last_used_path)

local global_path_list, global_line_by_path = paths_lines_pair(file_contents_by_line_to_table(last_used_path))
local dir_path_list, dir_line_by_path = paths_lines_pair(file_contents_by_line_to_table(dir_last_used_path))

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local cur_path = vim.api.nvim_buf_get_name(0)
		if not file_exists(cur_path) then return end

		local found_in_path_list = update_lru_list(global_path_list, cur_path)
		if not found_in_path_list then
			table.insert(global_path_list, cur_path)
            global_line_by_path[cur_path] = 0
			append_path_to_file(last_used_path, cur_path, 0)
		end



		local found_in_dir_path_list = update_lru_list(dir_path_list, cur_path)
		if not found_in_dir_path_list then
			table.insert(dir_path_list, cur_path)
            global_line_by_path[cur_path] = 0
			append_path_to_file(dir_last_used_path, cur_path, 0)
		end
	end
})

vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
        update_line_by_path(global_line_by_path)
        update_line_by_path(dir_line_by_path)
	end
})

vim.api.nvim_create_autocmd("ExitPre", {
	callback = function()
        update_line_by_path(global_line_by_path)
        update_line_by_path(dir_line_by_path)
		update_lru_file(global_path_list, global_line_by_path, last_used_path)
		update_lru_file(dir_path_list, dir_line_by_path, dir_last_used_path)
	end
})
