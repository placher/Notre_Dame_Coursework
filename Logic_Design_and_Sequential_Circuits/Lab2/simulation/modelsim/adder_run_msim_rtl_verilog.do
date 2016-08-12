transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab2 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab2/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab2 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab2/ripple_carry_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab2 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab2/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab2 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab2/adder_display.v}

