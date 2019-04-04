transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1 {Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1/Arithmetic.v}
vlog -vlog01compat -work work +incdir+Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1 {Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1/SevenSegment.v}
vlog -vlog01compat -work work +incdir+Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1 {Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1/Comparison.v}
vlog -vlog01compat -work work +incdir+Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1 {Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1/Logical.v}
vlog -vlog01compat -work work +incdir+Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1 {Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1/Multiplexer.v}
vlog -vlog01compat -work work +incdir+Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1 {Z:/Documents/CUBoulder/2019_Spring/ECEN2350-DigitalLogic/Project1/de10_lite_alu.v}

