transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/decoder4x4.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/regfile_2r1w.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/mux4x4.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/top.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/mux2x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab4 {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab4/register4.v}

