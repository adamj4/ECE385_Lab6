# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\adamj\Desktop\Vitis\Lab6\workspace\text_controller_system\_ide\scripts\systemdebugger_text_controller_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\adamj\Desktop\Vitis\Lab6\workspace\text_controller_system\_ide\scripts\systemdebugger_text_controller_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "RealDigital Boo 8874042402C7A" && level==0 && jtag_device_ctx=="jsn1-0362f093-0"}
fpga -file C:/Users/adamj/Desktop/Vitis/Lab6/workspace/text_controller/_ide/bitstream/hdmi_text_controller_top.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/adamj/Desktop/Vitis/Lab6/workspace/hdmi_text_controller_wrapper/export/hdmi_text_controller_wrapper/hw/test2.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/adamj/Desktop/Vitis/Lab6/workspace/text_controller/Debug/text_controller.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
