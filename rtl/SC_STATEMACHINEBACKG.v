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
module SC_STATEMACHINEBACKG (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEBACKG_shiftselection1_OutBus,
	SC_STATEMACHINEBACKG_shiftselection3_OutBus,
	SC_STATEMACHINEBACKG_shiftselection5_OutBus,
	SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus,
	SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus,
	SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus,
	SC_STATEMACHINEBACKG_upcount_OutLow,
	//////////// INPUTS //////////
	SC_STATEMACHINEBACKG_CLOCK_50,
	SC_STATEMACHINEBACKG_RESET_InHigh,
	SC_STATEMACHINEBACKG_startGame_InLow,
	SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow,
	SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow,
	SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow,
	SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow,
	SC_STATEMACHINEBACKG_CLEARLOST_InLow
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_LEVEL_1									= 2;
localparam STATE_CHECK_0									= 3;
localparam STATE_SHIFT_1_LEVEL_1							= 4;
localparam STATE_SHIFT_3_LEVEL_1							= 5;
localparam STATE_SHIFT_5_LEVEL_1	 						= 6;
localparam STATE_SHIFT_1_LEVEL_2							= 7;
localparam STATE_SHIFT_3_LEVEL_2							= 8;
localparam STATE_SHIFT_5_LEVEL_2	 						= 9;
localparam STATE_SHIFT_1_LEVEL_3							= 10;
localparam STATE_SHIFT_3_LEVEL_3							= 11;
localparam STATE_SHIFT_5_LEVEL_3	 						= 12;
localparam STATE_SHIFT_1_LEVEL_4							= 13;
localparam STATE_SHIFT_3_LEVEL_4							= 14;
localparam STATE_SHIFT_5_LEVEL_4	 						= 15;
localparam STATE_START_1									= 16;
localparam STATE_LEVEL_2									= 17;
localparam STATE_LEVEL_3									= 18;
localparam STATE_LEVEL_4									= 19;
//=======================================================
//  PORT declarations
//=======================================================
output reg	[1:0]SC_STATEMACHINEBACKG_shiftselection1_OutBus;
output reg	[1:0]SC_STATEMACHINEBACKG_shiftselection3_OutBus;
output reg	[1:0]SC_STATEMACHINEBACKG_shiftselection5_OutBus;
output reg	[23:0]SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus;
output reg	[23:0]SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus;
output reg	[23:0]SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus;
output reg 		SC_STATEMACHINEBACKG_upcount_OutLow;

input			SC_STATEMACHINEBACKG_CLOCK_50;
input 		SC_STATEMACHINEBACKG_RESET_InHigh;
input			SC_STATEMACHINEBACKG_startGame_InLow;
input			SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow;
input			SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow;
input			SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow;
input			[3:0]SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow;
input 		SC_STATEMACHINEBACKG_CLEARLOST_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [4:0] STATE_Register;
reg [4:0] STATE_Signal;

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0:	if (SC_STATEMACHINEBACKG_startGame_InLow == 1'b0) STATE_Signal = STATE_START_1;
						else STATE_Signal = STATE_START_0;
		STATE_START_1: if (SC_STATEMACHINEBACKG_startGame_InLow == 1'b0) STATE_Signal = STATE_START_1;
						else STATE_Signal = STATE_CHECK_0;	
						
		STATE_CHECK_0:if  (SC_STATEMACHINEBACKG_CLEARLOST_InLow == 1'b0) STATE_Signal = STATE_CHECK_0;
						else if (SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow == 4'b0010 ) STATE_Signal = STATE_LEVEL_1;
						else if (SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow == 4'b0100) STATE_Signal = STATE_LEVEL_2;
						else if (SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow == 4'b0110) STATE_Signal = STATE_LEVEL_3;				
						else if (SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow == 4'b1000) STATE_Signal = STATE_LEVEL_4;
						else STATE_Signal = STATE_CHECK_0;
						
		STATE_LEVEL_1:	if(SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow != 4'b0010 || SC_STATEMACHINEBACKG_CLEARLOST_InLow == 1'b0)	STATE_Signal = STATE_CHECK_0;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow == 1'b0) STATE_Signal = STATE_SHIFT_1_LEVEL_1;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow == 1'b0) STATE_Signal = STATE_SHIFT_3_LEVEL_1;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow == 1'b0) STATE_Signal = STATE_SHIFT_5_LEVEL_1;
						else STATE_Signal = STATE_LEVEL_1;
						
		STATE_LEVEL_2:	if(SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow != 4'b0100 || SC_STATEMACHINEBACKG_CLEARLOST_InLow == 1'b0)	STATE_Signal = STATE_CHECK_0;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow == 1'b0) STATE_Signal = STATE_SHIFT_1_LEVEL_2;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow == 1'b0) STATE_Signal = STATE_SHIFT_3_LEVEL_2;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow == 1'b0) STATE_Signal = STATE_SHIFT_5_LEVEL_2;
						else STATE_Signal = STATE_LEVEL_2;
		STATE_LEVEL_3:	if(SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow != 4'b0110 || SC_STATEMACHINEBACKG_CLEARLOST_InLow == 1'b0)	STATE_Signal = STATE_CHECK_0;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow == 1'b0) STATE_Signal = STATE_SHIFT_1_LEVEL_3;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow == 1'b0) STATE_Signal = STATE_SHIFT_3_LEVEL_3;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow == 1'b0) STATE_Signal = STATE_SHIFT_5_LEVEL_3;
						else STATE_Signal = STATE_LEVEL_3;

		STATE_LEVEL_4:	if(SC_STATEMACHINEBACKG_TRANSITIONCOUNTER_InLow != 4'b1000 || SC_STATEMACHINEBACKG_CLEARLOST_InLow == 1'b0)	STATE_Signal = STATE_CHECK_0;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR1_InLow == 1'b0) STATE_Signal = STATE_SHIFT_1_LEVEL_4;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR3_InLow == 1'b0) STATE_Signal = STATE_SHIFT_3_LEVEL_4;
						else if (SC_STATEMACHINEBACKG_shiftCOMPARATOR5_InLow == 1'b0) STATE_Signal = STATE_SHIFT_5_LEVEL_4;
						else STATE_Signal = STATE_LEVEL_4;
			
		STATE_SHIFT_1_LEVEL_1: STATE_Signal = STATE_LEVEL_1;
		STATE_SHIFT_3_LEVEL_1: STATE_Signal = STATE_LEVEL_1;
		STATE_SHIFT_5_LEVEL_1: STATE_Signal = STATE_LEVEL_1;
		STATE_SHIFT_1_LEVEL_2: STATE_Signal = STATE_LEVEL_2;
		STATE_SHIFT_3_LEVEL_2: STATE_Signal = STATE_LEVEL_2;
		STATE_SHIFT_5_LEVEL_2: STATE_Signal = STATE_LEVEL_2;
		STATE_SHIFT_1_LEVEL_3: STATE_Signal = STATE_LEVEL_3;
		STATE_SHIFT_3_LEVEL_3: STATE_Signal = STATE_LEVEL_3;
		STATE_SHIFT_5_LEVEL_3: STATE_Signal = STATE_LEVEL_3;
		STATE_SHIFT_1_LEVEL_4: STATE_Signal = STATE_LEVEL_4;
		STATE_SHIFT_3_LEVEL_4: STATE_Signal = STATE_LEVEL_4;
		STATE_SHIFT_5_LEVEL_4: STATE_Signal = STATE_LEVEL_4;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEBACKG_CLOCK_50 , posedge SC_STATEMACHINEBACKG_RESET_InHigh)
begin
	if (SC_STATEMACHINEBACKG_RESET_InHigh == 1'b1)
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
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
			
		end
//=========================================================
// STATE_START_0
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end
// STATE_START_1
//=========================================================
	STATE_START_1 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end
// STATE_CHECK_0
//=========================================================
	STATE_CHECK_0 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end
		
// STATE_LEVEL_1
//=========================================================
	STATE_LEVEL_1 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end

// STATE_LEVEL_2
//=========================================================
	STATE_LEVEL_2 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111011111111111111111111;
		end

// STATE_LEVEL_3
//=========================================================
	STATE_LEVEL_3 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b101111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b110011111111111111111111;
		end

// STATE_LEVEL_4
//=========================================================
	STATE_LEVEL_4 :	
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b100011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b100000111111111111111110;
		end

//=========================================================
// STATE_SHIFT_1_LEVEL_1
//=========================================================
	STATE_SHIFT_1_LEVEL_1 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_SHIFT_3_LEVEL_1
//=========================================================
	STATE_SHIFT_3_LEVEL_1 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_SHIFT_5_LEVEL_1
//=========================================================
	STATE_SHIFT_5_LEVEL_1 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end

//=========================================================
// STATE_SHIFT_1_LEVEL_2
//=========================================================
	STATE_SHIFT_1_LEVEL_2 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b01;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b01;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b01;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111011111111111111111111;
		end
//=========================================================
// STATE_SHIFT_3_LEVEL_2
//=========================================================
	STATE_SHIFT_3_LEVEL_2 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111011111111111111111111;
		end
//=========================================================
// STATE_SHIFT_5_LEVEL_2
//=========================================================
	STATE_SHIFT_5_LEVEL_2 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111011111111111111111111;
		end

//=========================================================
// STATE_SHIFT_1_LEVEL_3
//=========================================================
	STATE_SHIFT_1_LEVEL_3 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b101111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b110011111111111111111111;
		end
//=========================================================
// STATE_SHIFT_3_LEVEL_3
//=========================================================
	STATE_SHIFT_3_LEVEL_3 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b01;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b101111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b110011111111111111111111;
		end
//=========================================================
// STATE_SHIFT_5_LEVEL_3
//=========================================================
	STATE_SHIFT_5_LEVEL_3 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b101111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b110011111111111111111111;
		end

//=========================================================
// STATE_SHIFT_1_LEVEL_4
//=========================================================
	STATE_SHIFT_1_LEVEL_4 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b011111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b011100111111111111111110;
		end
//=========================================================
// STATE_SHIFT_3_LEVEL_4
//=========================================================
	STATE_SHIFT_3_LEVEL_4 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b10;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b011111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b011100111111111111111110;
		end
//=========================================================
// STATE_SHIFT_5_LEVEL_4
//=========================================================
	STATE_SHIFT_5_LEVEL_4 :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b01;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b110011111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b011111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b011100111111111111111110;
		end		
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEBACKG_upcount_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection1_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection3_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftselection5_OutBus = 2'b11;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE1_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE3_OutBus = 24'b111111111111111111111111;
			SC_STATEMACHINEBACKG_shiftCOMPARATORVALUE5_OutBus = 24'b111111111111111111111111;
		end
	endcase
end
endmodule
