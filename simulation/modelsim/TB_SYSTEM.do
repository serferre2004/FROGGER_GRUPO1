do BB_SYSTEM_run_msim_rtl_verilog.do
onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec
#
#add wave  -divider LedMATRIX
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_startButton_InLow
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_upButton_InLow
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_downButton_InLow
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton_InLow
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton_InLow


#add wave -divider SC_STATEMACHINEGAME_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_StartGame_OutLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_LoadGame_OutLow
##add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_LifesCounterComparator_InLow
##add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_LifesSignal_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_TransitionCounter1_OutLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_TRANSITIONTIME_COUNTER_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINE_GAMETYPE_TRANSITIONTIME_COMPARATOR_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_LoadLastRegister_OutLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_LastRegister_InBUS
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEGAME_u0/SC_STATEMACHINEGAME_WINComparator_InLow


#add wave -divider SC_upTRANSITIONCOUNTER_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upTRANSITIONCOUNTER_u0/SC_upTRANSITIONCOUNTER_data_OutBUS
add wave -divider COIN
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upBLINKCOUNTER_u0/SC_upBLINKCOUNTER_upcount_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upBLINKCOUNTER_u0/SC_upBLINKCOUNTER_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_CoinRegBACKGTYPE_u3/SC_CoinRegBACKGTYPE_blink_In



add wave -divider SC_upLIFECOUNTER_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upLIFECOUNTER_u0/SC_upLIFECOUNTER_data_OutBUS

add wave -divider SC_STATEMACHINEBACKG_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftselection1_OutBus
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftselection3_OutBus
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftselection5_OutBus
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_upcount_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_CLOCK_50
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_startGame_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow


#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219DIN_Out
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219NCS_Out
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219CLK_Out
#
#add wave  -divider SC_DEBOUNCE1_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_DEBOUNCE1_u1
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_DEBOUNCE1_u2
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_DEBOUNCE1_u3
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u3/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u3/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_DEBOUNCE1_u4
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u4/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u4/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_RegPOINTTYPE
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u7/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u6/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u5/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u4/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u3/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u2/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u1/SC_RegPOINTTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegPOINTTYPE_u0/SC_RegPOINTTYPE_data_OutBUS
#
#add wave  -divider STATEMACHINEPOINT_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_startButton_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_upButton_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_downButton_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_leftButton_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_rightButton_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_clear_OutLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_load0_OutLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_load1_OutLow
#add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_shiftselection_Out
#add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/STATE_Register
#
#add wave  -divider SC_RegBACKGTYPE
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_LastRegBACKGTYPE_u0/SC_LastRegBACKGTYPE_data_OutBUS
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u6/SC_RegBACKGTYPE_data_OutBUS        
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u5/SC_RegBACKGTYPE_data_OutBUS        
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u4/SC_RegBACKGTYPE_data_OutBUS        
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u3/SC_RegBACKGTYPE_data_OutBUS        
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u2/SC_RegBACKGTYPE_data_OutBUS        
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u1/SC_RegBACKGTYPE_data_OutBUS        
#add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/SC_RegBACKGTYPE_u0/SC_RegBACKGTYPE_data_OutBUS        
 
add wave -divider ORwires
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data7_wire
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data6_wire
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data5_wire 
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data4_wire 
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data3_wire
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data2_wire
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data1_wire
add wave -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data0_wire


#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_load_OutLow
#add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_shiftselection_Out
#add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/SC_STATEMACHINEBACKG_upcount_out
#add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEBACKG_u0/STATE_Register
#
#add wave  -divider SC_upSPEEDCOUNTER_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upSPEEDCOUNTER_u0/SC_upSPEEDCOUNTER_upcount_InLow
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upSPEEDCOUNTER_u0/SC_upSPEEDCOUNTER_data_OutBUS
#
#add wave  -divider CC_SPEEDCOMPARATOR_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SPEEDCOMPARATOR_u0/CC_SPEEDCOMPARATOR_data_InBUS
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SPEEDCOMPARATOR_u0/CC_SPEEDCOMPARATOR_T0_OutLow

#add wave -divider SC_upTRANSITIONCOUNTER_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upTRANSITIONCOUNTER_u0/SC_upTRANSITIONCOUNTER_data_OutBUS

#
#add wave  -divider TEST
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/matrix_ctrl_unit_0/clk_driver
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/matrix_ctrl_unit_0/Trig_SignalNEG
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/matrix_ctrl_unit_0/Trig_SignalPOS
#
#
#add wave  -divider SC_upCOUNTER_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upCOUNTER_u0/SC_upCOUNTER_data_OutBUS
#
#add wave  -divider CC_BIN2BCD1_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_BIN2BCD1_u0/CC_BIN2BCD_bcd_OutBUS
#
#add wave  -divider CC_SEVENSEG1_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_an
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_a
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_b
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_c
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_d
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_e
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_f
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SEVENSEG1_u0/CC_SEVENSEG1_g

restart
run 500ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59829352 ps} {60892417 ps}
