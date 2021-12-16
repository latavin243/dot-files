local function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.cmd('set ' .. k)
    else
      vim.cmd('set ' .. k .. '=' .. v)
    end
  end
end

local function load_options()
  vim.g.mapleader = ","

  local global_local = {
    termguicolors = true;
    hidden        = true;
    mouse         = "nv";
    showcmd       = false;
    inccommand    = "nosplit";

    -- scroll
    scrolloff      = 4;
    sidescrolloff  = 10;
    laststatus     = 2;

    -- search
    incsearch  = true;
    ignorecase = true;
    hlsearch   = true;
    smartcase  = true;
    -- wildignorecase = true;

    -- backup, swap
    backup         = false;
    writebackup    = false;
    swapfile       = false;

    -- spell
    spell = false;
  }

  local window_local = {
    wrap = false;
  }

  local bw_local = {
    foldenable     = true;

    -- indentation
    autoindent  = true;
    tabstop     = 4;
    shiftwidth  = 4;
    softtabstop = 4;
    expandtab   = true;
    smartindent = true;

    -- appearance
    number         = true;
    textwidth      = 120;

    -- undo file
    undofile = false;
  }

  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
  for name, value in pairs(window_local) do
    vim.wo[name] = value
  end

  bind_option(bw_local)
end

load_options()
