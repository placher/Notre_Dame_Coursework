transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/hexdigit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog/vga_adapter {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/vga_adapter/vga_pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog/vga_adapter {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/vga_adapter/vga_controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog/vga_adapter {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/vga_adapter/vga_address_translator.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog/vga_adapter {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/vga_adapter/vga_adapter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/position_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/timer.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/Patrick/Documents/Sophomore\ Year\ (2015-2016)/Logic\ Design/Lab7/lab7_2/verilog {C:/Users/Patrick/Documents/Sophomore Year (2015-2016)/Logic Design/Lab7/lab7_2/verilog/etch_a_sketch.v}

