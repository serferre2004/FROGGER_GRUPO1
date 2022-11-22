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
module SC_RegCOINTYPE #(parameter DATA_FIXED_INITREGCOIN=1'b1)(
	//////////// OUTPUTS //////////
	SC_RegCOINTYPE_data_OutLow,
	
	//////////// INPUTS //////////
	SC_RegCOINTYPE_CLOCK_50,
	SC_RegCOINTYPE_RESET_InHigh,
	SC_RegCOINTYPE_clear_InLow, 
	SC_RegCOINTYPE_load_InLow 
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	SC_RegCOINTYPE_data_OutLow;
input		SC_RegCOINTYPE_CLOCK_50;
input		SC_RegCOINTYPE_RESET_InHigh;
input		SC_RegCOINTYPE_clear_InLow;
input		SC_RegCOINTYPE_load_InLow;	
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg RegCOINTYPE_Register;
reg RegCOINTYPE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegCOINTYPE_load_InLow == 1'b0)
		RegCOINTYPE_Signal = 1'b0;
	else if (SC_RegCOINTYPE_clear_InLow == 1'b0)
		RegCOINTYPE_Signal = DATA_FIXED_INITREGCOIN;
	else
		RegCOINTYPE_Signal = RegCOINTYPE_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegCOINTYPE_CLOCK_50, posedge SC_RegCOINTYPE_RESET_InHigh)
begin
	if (SC_RegCOINTYPE_RESET_InHigh == 1'b1)
		RegCOINTYPE_Register <= 0;
	else
		RegCOINTYPE_Register <= RegCOINTYPE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegCOINTYPE_data_OutLow = RegCOINTYPE_Register;

endmodule
