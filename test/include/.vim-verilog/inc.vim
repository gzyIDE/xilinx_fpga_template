let g:incdir = ''
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./core/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./core/test/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./ip/datapath/test/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./ip/ParamMod/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./ip/ParamMod/test/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./peripheral/test/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./soc/include'
let g:incdir = g:incdir . ' +incdir+/home/gzhdd/reshiram/riscv/yako/./soc/test/include'

" append compiler option
if !exists('g:syntastic_verilog_compiler_options')
	let g:syntastic_verilog_compiler_options = '-Wunused -Wextra -Wconversion'
endif
let g:syntastic_verilog_compiler_options = 
	\g:syntastic_verilog_compiler_options . g:incdir

if !exists('g:syntastic_systemverilog_compiler_options')
	let g:syntastic_systemverilog_compiler_options = '-Wunused -Wextra -Wconversion'
endif
let g:syntastic_systemverilog_compiler_options = 
	\g:syntastic_systemverilog_compiler_options . g:incdir
