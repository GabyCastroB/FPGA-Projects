transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/control_mult.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/comp.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/acc.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/dynamic_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/counter_clk.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/BCDtoSSeg.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/mult_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/rsr.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/lsr.v}

vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/mult_32 {C:/Users/user/Documents/GitHub/lab05-2022-1-grupo03-22-1-os_melhores/mult_32/mult_32_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  mult_32_TB

add wave *
view structure
view signals
run -all
