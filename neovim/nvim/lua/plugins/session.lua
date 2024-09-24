return {
	"tpope/vim-obsession",
	config = function()
		-- Do not save windows sizes in session to prevent an error message
		vim.g.sessionoptions = "blank,buffers,curdir,folds,help,tabpages"

		-- Find out if the current project is a git repo
		local currentProjectGit = vim.fn.getcwd() .. "/.git"
		local isGitRepo = vim.fn.isdirectory(currentProjectGit) ~= 0

		-- Find out if a regular session exists
		local regularSession = vim.fn.getcwd() .. "/Session.vim"
		local regularSessionExists = false
		local regularSessionFile = io.open(regularSession, "r")
		if regularSessionFile ~= nil then
			io.close(regularSessionFile)
			regularSessionExists = true
		end

		vim.schedule(function()
			if regularSessionExists then
				vim.cmd(":source " .. regularSession)
				return
			end

			if not isGitRepo then
				return
			end

			local gitSession = currentProjectGit .. "/Session.vim"
			local gitSessionExists = io.open(gitSession, "r")

			if gitSessionExists ~= nil then
				io.close(gitSessionExists)
				vim.cmd(":source " .. gitSession)
			else
				vim.cmd(":Obsession " .. currentProjectGit)
			end
		end)
	end,
}
