transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab1 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab1/nota_b_always.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab1 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab1/nota_b_structural.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab1 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab1/nota_b.v}

