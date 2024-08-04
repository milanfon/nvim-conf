function RunBuild()
    local build_script = 'build.sh'
    local file = io.open(build_script, "r")

    if file then
        file:close()
        local filename = vim.fn.expand('%')
        local file_without_extension = vim.fn.expand('%:r')
        vim.notify("Building: " .. filename)
        vim.fn.jobstart('bash ' .. build_script .. ' ' .. filename .. ' ' .. file_without_extension, {
            on_exit = function(j, return_val)
                vim.notify("Build finished with status: " .. return_val)
            end,
        })
    else
        vim.ui.input({prompt = 'build.sh not found. Create it? (y/n): '}, function(input)
            if input:lower() == 'y' then
                local new_file = io.open(build_script, "w")
                new_file:write("#!/bin/bash\n")
                new_file:write("pdflatex \"$1\" -interaction=nonstopmode\n")
                new_file:write("bibtex \"$2\".aux\n")
                new_file:write("pdflatex \"$1\" -interaction=nonstopmode\n")
                new_file:write("pdflatex \"$1\" -interaction=nonstopmode\n")
                new_file:write("open \"$2\".pdf\n")
                new_file:close()
                vim.notify("Created " .. build_script)
            else
                vim.notify("Build script creation cancelled.", vim.log.levels.INFO)
            end
        end)
    end
end

function RunBuild2()
    vim.notify("Building: " .. vim.fn.expand('%'))
    vim.fn.jobstart('latexmk -pdf -bibtex --interaction=nonstopmode ' .. vim.fn.expand('%'), {
        on_exit = function(j, return_val)
            vim.notify("Build finished with status: " .. return_val)
            --vim.fn.jobstart('open ' .. vim.fn.expand('%:r') .. '.pdf')
        end
    })
end

function RunClean()
    vim.notify("Cleaning...")
    vim.fn.jobstart('latexmk -C', {
        on_exit = function(j, return_val)
            vim.notify("Cleaning finished")
        end
    })
end

vim.keymap.set("n", "<leader>b", RunBuild2, {noremap = true, silent = true});
vim.keymap.set("n", "<leader>c", RunClean, {noremap = true, silent = true});
