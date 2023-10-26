let g:srcdir = ''
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./core'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./core/cache'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./core/cpu'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./core/test/tb'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./ip/datapath/test/tb'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./ip/ParamMod/rtl'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./ip/ParamMod/test/tb'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./peripheral/test/tb'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./soc'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./soc/axi'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./soc/axis'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./soc/clk'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./soc/test/tb'
let g:srcdir = g:srcdir . ' -y /home/gzhdd/reshiram/riscv/yako/./util/elfloader_dpi/test'

" append compiler option
if !exists('g:syntastic_verilog_compiler_options')
	let g:syntastic_verilog_compiler_options = '-Wunused -Wextra -Wconversion'
endif
let g:syntastic_verilog_compiler_options = 
	\g:syntastic_verilog_compiler_options . g:srcdir

if !exists('g:syntastic_systemverilog_compiler_options')
	let g:syntastic_systemverilog_compiler_options = '-Wunused -Wextra -Wconversion'
endif
let g:syntastic_systemverilog_compiler_options = 
	\g:syntastic_systemverilog_compiler_options . g:srcdir
