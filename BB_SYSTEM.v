/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY  WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_upButton_Out,
	BB_SYSTEM_downButton_Out,
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,
	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_upButton_InLow,
	BB_SYSTEM_downButton_InLow,
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH = 12;
 
 parameter DATA_FIXED_INITREGPOINT_7 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_6 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_5 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_4 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_3 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_2 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 // Nivel 1 registros obstaculos
 parameter DATA_FIXED_INITREGBACKG_71 = 8'b11101101;
 parameter DATA_FIXED_INITREGBACKG_61 = 8'b00001100;
 parameter DATA_FIXED_INITREGBACKG_51 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_41 = 8'b11000000;
 parameter DATA_FIXED_INITREGBACKG_31 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_21 = 8'b00011000;
 parameter DATA_FIXED_INITREGBACKG_11 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_01 = 8'b00000000;
 // Nivel 2 registros obstaculos
 parameter DATA_FIXED_INITREGBACKG_72 = 8'b10101111;
 parameter DATA_FIXED_INITREGBACKG_62 = 8'b11000000;
 parameter DATA_FIXED_INITREGBACKG_52 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_42 = 8'b00011100;
 parameter DATA_FIXED_INITREGBACKG_32 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_22 = 8'b00001110;
 parameter DATA_FIXED_INITREGBACKG_12 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_02 = 8'b00000000;
 // Nivel 3 registros obstaculos
 parameter DATA_FIXED_INITREGBACKG_73 = 8'b11101101;
 parameter DATA_FIXED_INITREGBACKG_63 = 8'b11000110;
 parameter DATA_FIXED_INITREGBACKG_53 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_43 = 8'b11110000;
 parameter DATA_FIXED_INITREGBACKG_33 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_23 = 8'b11000110;
 parameter DATA_FIXED_INITREGBACKG_13 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_03 = 8'b00000000;
 // Nivel 4 registros obstaculos
 parameter DATA_FIXED_INITREGBACKG_74 = 8'b11101101;
 parameter DATA_FIXED_INITREGBACKG_64 = 8'b01010101;
 parameter DATA_FIXED_INITREGBACKG_54 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_44 = 8'b11011011;
 parameter DATA_FIXED_INITREGBACKG_34 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_24 = 8'b11111110;
 parameter DATA_FIXED_INITREGBACKG_14 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_04 = 8'b00000000;
 

  
//=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAY_DATAWIDTH-1:0] BB_SYSTEM_display_OutBUS;

output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_upButton_Out;
output 		BB_SYSTEM_downButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;
output 		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_upButton_InLow;
input		BB_SYSTEM_downButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_upButton_InLow_cwire;
wire 	BB_SYSTEM_downButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;

////SC_STATEMACHINEPOINT
wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load0_cwire;
wire	STATEMACHINEPOINT_load1_cwire;
wire	[1:0] STATEMACHINEPOINT_shiftselection_cwire;
wire 	STATEMACHINEPOINT_FirstRegisterCOMPARATOR_wire;

//SC_STATEMACHINEBACK
wire STATEMACHINEBACKG_clear_cwire;
wire STATEMACHINEBACKG_load_cwire;
wire [1:0] STATEMACHINEBACKG_shiftselection_cwire;
wire STATEMACHINEBACKG_upcount_cwire;
wire STATEMACHINEBACKG_SPEEDCOMPARATOR_wire;

//SC_STATEMACHINEGAME
wire STATEMACHINEGAME_LastRegisterCOMPARATOR_wire;
wire STATEMACHINEGAME_MATRIXCOMPARATOR_wire;
wire STATEMACHINEGAME_WINCOMPARATOR_wire;
wire STATEMACHINEGAME_TRANSITIONTIMECOMPARATOR_wire;
wire STATEMACHINEGAME_LIFECOMPARATOR_wire;
wire STATEMACHINEGAME_ClearLOST_wire;
wire STATEMACHINEGAME_ClearPOINT_wire;
wire STATEMACHINEGAME_LIFESCOUNTER_wire;
wire STATEMACHINEGAME_START_GAME_wire;
wire STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire;//Se conecta a todos los registros BACK
wire STATEMACHINEGAME_TRANSITIONCOUNTER_wire;
wire STATEMACHINEGAME_LOAD_LastRegisterBACKTYPE_wire;

					//Registers OutPut wires
//POINTYPE
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data0_Out;
//BACKTYPE
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data0_Out;

//COMPARATORs imput
wire [PRESCALER_DATAWIDTH-1:0] SPEEDCOMPARATOR_SpeedCounter_data_wire;
wire TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire;//Se conecta a todos los registros
wire TRANSITIONTIMECOMPARATOR_TRANSITIONTIMECOUNTER_data_wire;
wire LIFECOMPARATOR_LIFECOUNTER_data_wire;

// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;

wire [DATAWIDTH_BUS-1:0] upCOUNTER_2_BIN2BCD1_data_BUS_wire;
wire [DISPLAY_DATAWIDTH-1:0] BIN2BCD1_2_SEVENSEG1_data_BUS_wire;

wire [DATAWIDTH_BUS-1:0] regLOST_data7_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data6_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data5_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data4_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data3_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data2_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data1_wire;
wire [DATAWIDTH_BUS-1:0] regLOST_data0_wire;

//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_startButton (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_upButton (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_upButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_upButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_downButton (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_downButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_downButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_leftButton (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_rightButton (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	POINT
//######################################################################
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_1)) SC_RegPOINTTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_2)) SC_RegPOINTTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_3)) SC_RegPOINTTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_4)) SC_RegPOINTTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_5)) SC_RegPOINTTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_6)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_7)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_RegPOINTTYPE_clearLOST_InLow(STATEMACHINEGAME_ClearLOST_wire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out)
);
//######################################################################
//#	SC_STATEMACHINEPOINT
//######################################################################

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_load0_OutLow(STATEMACHINEPOINT_load0_cwire), 
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load1_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startGame_InLow(STATEMACHINEGAME_START_GAME_wire), 
	.SC_STATEMACHINEPOINT_upButton_InLow(BB_SYSTEM_upButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_downButton_InLow(BB_SYSTEM_downButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_FirstRegisterCOMPARATOR_firstreg_InLow(STATEMACHINEPOINT_FirstRegisterCOMPARATOR_wire)
);

//######################################################################
//#	SC_STATEMACHINEBACKG
//######################################################################

SC_STATEMACHINEBACKG SC_STATEMACHINEBACKG_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEBACKG_shiftselection_OutBus(STATEMACHINEPOINT_shiftselection_cwire), //
	.SC_STATEMACHINEBACKG_upcount_OutLow(STATEMACHINEBACKG_upcount_cwire), 
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_movement_InLow(STATEMACHINEBACKG_SPEEDCOMPARATOR_wire), 
	.SC_STATEMACHINEBACKG_startGame_InLow(STATEMACHINEGAME_START_GAME_wire)
);

//######################################################################
//#	SC_STATEMACHINEGAME
//######################################################################

SC_STATEMACHINEGAME SC_STATEMACHINEGAME_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEGAME_ClearLost_OutLow(STATEMACHINEGAME_ClearLOST_wire), // fALTA
	.SC_STATEMACHINEGAME_LifesSignal_OutLow(STATEMACHINEGAME_LIFESCOUNTER_wire),
	.SC_STATEMACHINEGAME_LoadLastRegister_OutLow(STATEMACHINEGAME_LOAD_LastRegisterBACKTYPE_wire),
	.SC_STATEMACHINEGAME_startGame_OutLow(STATEMACHINEGAME_START_GAME_wire),
	.SC_STATEMACHINEGAME_LoadGame_OutLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_STATEMACHINEGAME_TransitionCounter1_OutLow(STATEMACHINEGAME_TRANSITIONCOUNTER_wire),
	.SC_STATEMACHINEGAME_clearPoint_OutLow(STATEMACHINEGAME_ClearPOINT_wire),
	.SC_STATEMACHINEGAME_LastRegister_InBUS(STATEMACHINEGAME_LastRegisterCOMPARATOR_wire),
	.SC_STATEMACHINEGAME_MatrixComparator_InLow(STATEMACHINEGAME_MATRIXCOMPARATOR_wire),
	.SC_STATEMACHINEGAME_LifesCounterComparator_InLow(STATEMACHINEGAME_LIFECOMPARATOR_wire),
	.SC_STATEMACHINEGAME_WINComparator_InLow(STATEMACHINEGAME_WINCOMPARATOR_wire),
	.SC_STATEMACHINEGAME_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEGAME_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEGAME_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

);

//######################################################################
//#	BACKGROUND
//######################################################################
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_0), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_01), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_02), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_03), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_04)) SC_RegBACKGTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_1), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_11), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_12), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_13), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_14)) SC_RegBACKGTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_2), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_21), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_22), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_23), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_24)) SC_RegBACKGTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_3), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_31), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_32), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_33), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_34)) SC_RegBACKGTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_3_BACKGMATRIX_data4_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_4), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_41), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_42), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_43), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_44)) SC_RegBACKGTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_5), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_51), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_52), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_53), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_54)) SC_RegBACKGTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_6), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_61), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_62), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_63), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_64)) SC_RegBACKGTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);
SC_LastRegBACKGTYPE #(.LastRegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7), .DATA_FIXED_LEVEL1REGBACKG(DATA_FIXED_INITREGBACKG_71), .DATA_FIXED_LEVEL2REGBACKG(DATA_FIXED_INITREGBACKG_72), .DATA_FIXED_LEVEL3REGBACKG(DATA_FIXED_INITREGBACKG_73), .DATA_FIXED_LEVEL4REGBACKG(DATA_FIXED_INITREGBACKG_74)) SC_LastRegBACKGTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_LastRegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.SC_LastRegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_LastRegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_LastRegBACKGTYPE_clear_InLow(STATEMACHINEGAME_ClearLOST_wire),	
	.SC_LastRegBACKGTYPE_load_InLow(STATEMACHINEGAME_LOAD_GAME_RegBACKTYPE_wire),
	.SC_LastRegBACKGTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_LastRegBACKGTYPE_transitioncounter_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire),
	.SC_LastRegBACKGTYPE_lastpointreg_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_LastRegBACKGTYPE_LoadFinalRegister_InBUS(STATEMACHINEGAME_LOAD_LastRegisterBACKTYPE_wire)
);

//#SPEED
SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(SPEEDCOMPARATOR_SpeedCounter_data_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);
//######################################################################
//#	COUNTERS
//######################################################################
SC_upTRANSITIONCOUNTER #(.upTRANSITIONCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upTRANSITIONCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upTRANSITIONCOUNTER_data_OutBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire),
	.SC_upTRANSITIONCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upTRANSITIONCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upTRANSITIONCOUNTER_upcount_InLow(STATEMACHINEGAME_TRANSITIONCOUNTER_wire),
	.SC_upTRANSITIONCOUNTER_clear_InLow(STATEMACHINEGAME_ClearLOST_wire)
);

SC_upLIFECOUNTER #(.upLIFECOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upLIFECOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upTRANSITIONCOUNTER_data_OutBUS(LIFECOMPARATOR_LIFECOUNTER_data_wire),
	.SC_upTRANSITIONCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upTRANSITIONCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upTRANSITIONCOUNTER_upcount_InLow(STATEMACHINEGAME_LIFESCOUNTER_wire),
	.SC_upTRANSITIONCOUNTER_clear_InLow(STATEMACHINEGAME_ClearLOST_wire)
);

//######################################################################
//#	COMPARATORS
//######################################################################

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
	.CC_SPEEDCOMPARATOR_T0_OutLow(STATEMACHINEBACKG_SPEEDCOMPARATOR_wire),
	.CC_SPEEDCOMPARATOR_data_InBUS(SPEEDCOMPARATOR_SpeedCounter_data_wire)
);

CC_WINCOMPARATOR #(.WINCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_WINCOMPARATOR_u0 (
	.CC_WINCOMPARATOR_data_OutLow(STATEMACHINEGAME_WINCOMPARATOR_wire),
	.CC_WINCOMPARATOR_data_InBUS(TRANSITIONCOUNTER_WINCOMPARATOR_REGISTERS_data_wire)
);

CC_LIFECOMPARATOR #(.LIFECOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_LIFECOMPARATOR_u0 (
	.CC_LIFECOMPARATOR_lose_OutLow(STATEMACHINEGAME_LIFECOMPARATOR_wire),
	.CC_LIFECOMPARATOR_data_InBUS(LIFECOMPARATOR_LIFECOUNTER_data_wire)
);
//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################
CC_FirstRegisterCOMPARATOR #(.FirstRegisterCOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_FirstRegisterCOMPARATOR_u0 (
	.CC_FirstRegisterCOMPARATOR_firstreg_OutLow(STATEMACHINEPOINT_FirstRegisterCOMPARATOR_wire),
	.CC_FirstRegisterCOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);

CC_LastRegisterCOMPARATOR #(.LastRegisterCOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_LastRegisterCOMPARATOR_u0 (
	.CC_LastRegisterCOMPARATOR_win_OutBUS(STATEMACHINEGAME_LastRegisterCOMPARATOR_wire),
	.CC_LastRegisterCOMPARATOR_dataOR_InBUS(regGAME_data7_wire),
);

CC_MatrixCOMPARATOR #(.MatrixCOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_MatrixCOMPARATOR_u0 (
	.CC_MatrixCOMPARATOR_crash_OutLow(STATEMACHINEGAME_MATRIXCOMPARATOR_wire),
	.CC_MatrixCOMPARATOR_registro7_InBUS(regLOST_data0_wire),
	.CC_MatrixCOMPARATOR_registro6_InBUS(regLOST_data1_wire),
	.CC_MatrixCOMPARATOR_registro5_InBUS(regLOST_data2_wire),
	.CC_MatrixCOMPARATOR_registro4_InBUS(regLOST_data3_wire),
	.CC_MatrixCOMPARATOR_registro3_InBUS(regLOST_data4_wire),
	.CC_MatrixCOMPARATOR_registro2_InBUS(regLOST_data5_wire),
	.CC_MatrixCOMPARATOR_registro1_InBUS(regLOST_data6_wire),
	.CC_MatrixCOMPARATOR_registro0_InBUS(regLOST_data7_wire)
);
//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out | RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regGAME_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out | RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regGAME_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out | RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regGAME_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out | RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regGAME_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out | RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regGAME_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out | RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regGAME_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out | RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regGAME_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out | RegBACKGTYPE_2_BACKGMATRIX_data7_Out;

assign regLOST_data0_wire; = RegPOINTTYPE_2_POINTMATRIX_data0_Out & RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regLOST_data1_wire; = RegPOINTTYPE_2_POINTMATRIX_data1_Out & RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regLOST_data2_wire; = RegPOINTTYPE_2_POINTMATRIX_data2_Out & RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regLOST_data3_wire; = RegPOINTTYPE_2_POINTMATRIX_data3_Out & RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regLOST_data4_wire; = RegPOINTTYPE_2_POINTMATRIX_data4_Out & RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regLOST_data5_wire; = RegPOINTTYPE_2_POINTMATRIX_data5_Out & RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regLOST_data6_wire; = RegPOINTTYPE_2_POINTMATRIX_data6_Out & RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regLOST_data7_wire; = RegPOINTTYPE_2_POINTMATRIX_data7_Out & RegBACKGTYPE_2_BACKGMATRIX_data7_Out;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//~ imagen img1(
//~ .act_add(add), 
//~ .max_in(data_max) );

//~ SC_CTRLMATRIX SC_CTRLMATRIX_u0( 
//~ .SC_CTRLMATRIX_max7219DIN_Out(BB_SYSTEM_max7219DIN_Out),	//max7219_din 
//~ .SC_CTRLMATRIX_max7219NCS_out(BB_SYSTEM_max7219NCS_Out),	//max7219_ncs 
//~ .SC_CTRLMATRIX_max7219CLK_Out(BB_SYSTEM_max7219CLK_Out),	//max7219_clk
//~ .SC_CTRLMATRIX_dispdata(data_max), 
//~ .SC_CTRLMATRIX_dispaddr(add),
//~ .SC_CTRLMATRIX_intensity(4'hA),
//~ .SC_CTRLMATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
//~ .SC_CTRLMATRIX_RESET_InHigh(~BB_SYSTEM_RESET_InHigh) 		//~lowRst_System
 //~ ); 
 
//~ SC_IMAGE SC_IMAGE_u0(
//~ .SC_IMAGE_actadd(add), 
//~ .SC_IMAGE_maxin(data_max) );

//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_upButton_Out = BB_SYSTEM_upButton_InLow_cwire;
assign BB_SYSTEM_downButton_Out = BB_SYSTEM_downButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;

//######################################################################
//#	TO 7SEG
//######################################################################

CC_BIN2BCD1 CC_BIN2BCD1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_BIN2BCD_bcd_OutBUS(BIN2BCD1_2_SEVENSEG1_data_BUS_wire),
	.CC_BIN2BCD_bin_InBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire)
);

CC_SEVENSEG1 CC_SEVENSEG1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SEVENSEG1_an(BB_SYSTEM_display_OutBUS[11:8]),
	.CC_SEVENSEG1_a(BB_SYSTEM_display_OutBUS[0]),
	.CC_SEVENSEG1_b(BB_SYSTEM_display_OutBUS[1]),
	.CC_SEVENSEG1_c(BB_SYSTEM_display_OutBUS[2]),
	.CC_SEVENSEG1_d(BB_SYSTEM_display_OutBUS[3]),
	.CC_SEVENSEG1_e(BB_SYSTEM_display_OutBUS[4]),
	.CC_SEVENSEG1_f(BB_SYSTEM_display_OutBUS[5]),
	.CC_SEVENSEG1_g(BB_SYSTEM_display_OutBUS[6]),
	.CC_SEVENSEG1_dp(BB_SYSTEM_display_OutBUS[7]),
	.CC_SEVENSEG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CC_SEVENSEG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.CC_SEVENSEG1_in0(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[3:0]),
	.CC_SEVENSEG1_in1(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[7:4]),
	.CC_SEVENSEG1_in2(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8]),
	.CC_SEVENSEG1_in3(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8])
);

SC_upCOUNTER #(.upCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_upCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_load0_cwire)
);

endmodule