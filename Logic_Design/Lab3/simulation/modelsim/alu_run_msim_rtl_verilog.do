transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab3 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab3/alu_calculate.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab3 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab3/alu_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab3 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab3/alu.v}

