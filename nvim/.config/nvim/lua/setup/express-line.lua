local builtin = require("el.builtin")
local subscribe = require("el.subscribe")
local extensions = require("el.extensions")
local sections = require("el.sections")
local diagnostic = require("el.diagnostic")

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then
		return " " .. extensions.git_icon() .. " " .. branch
	end
end)

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
	local icon = extensions.file_icon(_, bufnr)
	if icon then
		return icon .. " "
	end

	return ""
end)

local diagnostic_display = diagnostic.make_buffer()

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
	return extensions.git_changes(window, buffer)
end)

require("el").setup({
	generator = function(_, _)
		local mode = extensions.gen_mode({ format_string = " %s " })

		local segments = {
			{ mode },
			{ git_branch },
			{ " " },
			{ sections.split },
			{ git_icon },
			{ sections.maximum_width(builtin.make_responsive_file(90, 90), 0.40) },
			{ sections.collapse_builtin({ { " " }, { builtin.modified_flag } }) },
			{ sections.split },
			{ diagnostic_display },
			{ " " },
			{ git_changes },
			{ "[" },
			{ builtin.line_with_width(3) },
			{ ":" },
			{ builtin.column_with_width(2) },
			{ "]" },
			{
				sections.collapse_builtin({
					"[",
					builtin.help_list,
					builtin.readonly_list,
					"]",
				}),
			},
			{ builtin.filetype },
			{ " " },
		}

		return segments
	end,
})
