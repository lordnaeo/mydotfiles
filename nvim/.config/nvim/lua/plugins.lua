-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Segnala i caratteri oltre l'81esimo
	-- <https://github.com/lcheylus/overlength.nvim>
	use 'lcheylus/overlength.nvim'

end)
