# TCL File Generated by Component Editor 12.1
# Tue Oct 25 16:57:14 CEST 2016
# DO NOT MODIFY


# 
# SOBEL "SOBEL" v1.0
# bhavindhola 2016.10.25.16:57:14
# custom instruction for sobel filter having register file interface
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module SOBEL
# 
set_module_property DESCRIPTION "custom instruction for sobel filter having register file interface"
set_module_property NAME SOBEL
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR bhavindhola
set_module_property DISPLAY_NAME SOBEL
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL sobel
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file SOBEL_CI.v VERILOG PATH SOBEL_CI.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset rsi_reset_n reset_n Input 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock csi_clk clk Input 1


# 
# connection point so
# 
add_interface so avalon end
set_interface_property so addressUnits WORDS
set_interface_property so associatedClock clock
set_interface_property so associatedReset reset
set_interface_property so bitsPerSymbol 8
set_interface_property so burstOnBurstBoundariesOnly false
set_interface_property so burstcountUnits WORDS
set_interface_property so explicitAddressSpan 0
set_interface_property so holdTime 0
set_interface_property so linewrapBursts false
set_interface_property so maximumPendingReadTransactions 0
set_interface_property so readLatency 0
set_interface_property so readWaitTime 1
set_interface_property so setupTime 0
set_interface_property so timingUnits Cycles
set_interface_property so writeWaitTime 0
set_interface_property so ENABLED true

add_interface_port so avs_so_read read Input 1
add_interface_port so avs_so_readdata readdata Output 32
add_interface_port so avs_so_write write Input 1
add_interface_port so avs_so_writedata writedata Input 32
add_interface_port so avs_so_address address Input 8
set_interface_assignment so embeddedsw.configuration.isFlash 0
set_interface_assignment so embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment so embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment so embeddedsw.configuration.isPrintableDevice 0

