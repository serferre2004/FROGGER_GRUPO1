//#####################FALTA MODIFICAR##################################
///*###################################################################### 
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEGAME (
	//////////// OUTPUTS //////////
<<<<<<< Updated upstream
	SC_STATEMACHINEGAME_LifesSignal_OutLow,
=======
	SC_STATEMACHINEGAME_ClearLost_OutLow,
	SC_STATEMACHINEGAME_LifesSignal_OutLow,
	SC_STATEMACHINEGAME_LoadLastRegister_OutLow,
>>>>>>> Stashed changes
	SC_STATEMACHINEGAME_StartGame_OutLow,
	SC_STATEMACHINEGAME_LoadGame_OutLow,
	SC_STATEMACHINEGAME_CLEAR_LOST,
	SC_STATEMACHINE_GAME_TRANSITIONTIMECOUNTER,,
	SC_STATEMACHINE_GAME_TRANSITIONCOUNTER,
	SC_STATEMCHINE_GAME_LoadLastRegister_OutLow,
	//////////// INPUTS //////////
	SC_STATEMACHINEGAME_CLOCK_50,
	SC_STATEMACHINEGAME_RESET_InHigh,
	SC_STATEMACHINEGAME_LastRegister_InBUS,
	SC_STATEMACHINEGAME_MatrixComparator_InLow,
<<<<<<< Updated upstream
	SC_STATEMACHINE_GAME_LifesCounterCOMPARATOR_InLow,
	SC_STATEMACHINEGAME_startButton_InLow,
	SC_STATEMACHINEGAME_RESET_InHigh,
	SC_STATEMACHINE_GAMETYPE_TRANSITIONTIME_COMPARATOR
=======
	SC_STATEMACHINEGAME_LifesCounterComparator_InLow,
	SC_STATEMACHINEGAME_LevelCounterComparator_InLow,
	SC_STATEMACHINEGAME_startButton_InLow
>>>>>>> Stashed changes
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_LOSEGAME_0									= 3;
localparam STATE_LOSEGAME_1									= 4;
localparam STATE_WINGAME_0									= 5;
localparam STATE_WINGAME_1									= 6;
localparam STATE_LOSELIFE_0									= 7; 
localparam STATE_NEXTLEVEL_0								= 8; 
localparam STATE_NEXTLEVEL_1								= 9; 
localparam STATE_HOUSE_0									= 10;

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEGAME_LifesSignal_OutLow;
output reg		SC_STATEMACHINEGAME_StartGame_OutLow;
output reg		SC_STATEMACHINEGAME_LoadGame_OutLow;
<<<<<<< Updated upstream
output reg		SC_STATEMACHINEGAME_CLEAR_LOST;
output reg		SC_STATEMACHINE_GAME_TRANSITIONTIMECOUNTER;
output reg		SC_STATEMACHINE_GAME_TRANSITIONCOUNTER;
output reg		SC_STATEMCHINE_GAME_LoadLastRegister_OutLow;
input			SC_STATEMACHINEGAME_CLOCK_50,
input			SC_STATEMACHINEGAME_RESET_InHigh,
input			SC_STATEMACHINEGAME_LastRegister_InLow,
input			SC_STATEMACHINEGAME_MatrixComparator_InLow,
input			SC_STATEMACHINE_GAME_LifesCounterCOMPARATOR_InLow,
input			SC_STATEMACHINEGAME_startButton_InLow,
input			SC_STATEMACHINEGAME_RESET_InHigh,
input			SC_STATEMACHINE_GAMETYPE_TRANSITIONTIME_COMPARATOR
=======
input			SC_STATEMACHINEGAME_CLOCK_50;
input 			SC_STATEMACHINEGAME_RESET_InHigh;
input			[1:0] SC_STATEMACHINEGAME_LastRegister_InBUS;
input			SC_STATEMACHINEGAME_MatrixComparator_InLow;
input			SC_STATEMACHINEGAME_LifesCounterComparator_InLow;
input			SC_STATEMACHINEGAME_LevelCounterComparator_InLow;
input			SC_STATEMACHINEGAME_startButton_InLow;
>>>>>>> Stashed changes
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: if (SC_STATEMACHINEGAME_startButton_InLow == 1'b0) STATE_Signal = STATE_START_0;
						else STATE_Signal = STATE_RESET_0;
		STATE_START_0: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINEGAME_LifesCounterComparator_InLow == 1'b0) STATE_Signal = STATE_LOSEGAME_0;
						else if (SC_STATEMACHINEGAME_LevelCounterComparator_InLow == 1'b0) STATE_Signal = STATE_WINGAME_0;
						else if (SC_STATEMACHINEGAME_MatrixComparator_InLow== 1'b0) STATE_Signal = STATE_LOSELIFE_0;
						else if (SC_STATEMACHINEGAME_LastRegister_InBUS == 2'b00) STATE_Signal = STATE_NEXTLEVEL_0;
						else if (SC_STATEMACHINEGAME_LastRegister_InBUS == 2'b10) STATE_Signal = STATE_HOUSE_0;
						else STATE_Signal = STATE_CHECK_0;
		STATE_LOSEGAME_0: 	STATE_Signal = STATE_LOSEGAME_1;
		STATE_LOSEGAME_1: 	STATE_Signal = STATE_LOSEGAME_1;
		STATE_LOSELIFE_0: 	STATE_Signal = STATE_CHECK_0;
		STATE_WINGAME_0:  	STATE_Signal = STATE_WINGAME_1;
		STATE_WINGAME_1: 	STATE_Signal = STATE_WINGAME_1;
		STATE_NEXTLEVEL_0:  STATE_Signal = STATE_NEXTLEVEL_1;

		STATE_NEXTLEVEL_1: STATE_Signal = STATE_CHECK_0;
		STATE_HOUSE_0: STATE_Signal = STATE_CHECK_0;
		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEGAME_CLOCK_50 , posedge SC_STATEMACHINEGAME_RESET_InHigh)
begin
	if (SC_STATEMACHINEGAME_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_INIT_0
//=========================================================
	STATE_INIT_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b0;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_UP_0
//=========================================================
	STATE_UP_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b0;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_DOWN_0
//=========================================================
	STATE_DOWN_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b0;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
//=========================================================
// STATE_LEFT_0
//=========================================================
	STATE_LEFT_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b01; 
		end
//=========================================================
// STATE_RIGHT_0
//=========================================================
	STATE_RIGHT_0 :	
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b10; 
		end

//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEGAME_clear_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load0_OutLow = 1'b1;
			SC_STATEMACHINEGAME_load1_OutLow = 1'b1;
			SC_STATEMACHINEGAME_shiftselection_Out  = 2'b11; 
		end
	endcase
end
endmodule
