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
module SC_LastRegBACKGTYPE #(parameter RegBACKGTYPE_DATAWIDTH=8, parameter DATA_FIXED_INITREGBACKG=8'b00000000)(
	//////////// OUTPUTS //////////
	SC_LastRegBACKGTYPE_data_OutBUS,
	//////////// INPUTS //////////
	SC_LastRegBACKGTYPE_CLOCK_50,
	SC_LastRegBACKGTYPE_RESET_InHigh,
	SC_LastRegBACKGTYPE_clear_InLow, 
	SC_LastRegBACKGTYPE_load_InLow, 
	SC_LastRegBACKGTYPE_shiftselection_In,
	SC_LastRegBACKGTYPE_data_InBUS,
	SC_LastRegBACKGTYPE_LoadFinalRegister_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegBACKGTYPE_DATAWIDTH-1:0]	SC_LastRegBACKGTYPE_data_OutBUS;
input		SC_LastRegBACKGTYPE_CLOCK_50;
input		SC_LastRegBACKGTYPE_RESET_InHigh;
input		SC_LastRegBACKGTYPE_clear_InLow;
input		SC_LastRegBACKGTYPE_load_InLow;	
input		[1:0] SC_LastRegBACKGTYPE_shiftselection_In;
input		[RegBACKGTYPE_DATAWIDTH-1:0]	SC_LastRegBACKGTYPE_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegBACKGTYPE_DATAWIDTH-1:0] LastRegBACKGTYPE_Register;
reg [RegBACKGTYPE_DATAWIDTH-1:0] LastRegBACKGTYPE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_LastRegBACKGTYPE_clear_InLow == 1'b0)
		LastRegBACKGTYPE_Signal = DATA_FIXED_INITREGBACKG;
	else if (SC_LastRegBACKGTYPE_load_InLow == 1'b0)
		LastRegBACKGTYPE_Signal = SC_LastRegBACKGTYPE_data_InBUS;
	else if (SC_LastRegBACKGTYPE_LoadFinalRegister_InLow == 1'b0)
		LastRegBACKGTYPE_Signal = SC_LastRegBACKGTYPE_data_InBUS;
	else if (SC_LastRegBACKGTYPE_shiftselection_In == 2'b01)
		LastRegBACKGTYPE_Signal = {LastRegBACKGTYPE_Register[RegBACKGTYPE_DATAWIDTH-2:0],LastRegBACKGTYPE_Register[RegBACKGTYPE_DATAWIDTH-1]};
	else if (SC_LastRegBACKGTYPE_shiftselection_In== 2'b10)
		LastRegBACKGTYPE_Signal = {LastRegBACKGTYPE_Register[0],LastRegBACKGTYPE_Register[RegBACKGTYPE_DATAWIDTH-1:1]};
	else
		LastRegBACKGTYPE_Signal = LastRegBACKGTYPE_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LastRegBACKGTYPE_CLOCK_50, posedge SC_LastRegBACKGTYPE_RESET_InHigh)
begin
	if (SC_LastRegBACKGTYPE_RESET_InHigh == 1'b1)
		LastRegBACKGTYPE_Register <= 0;
	else
		LastRegBACKGTYPE_Register <= LastRegBACKGTYPE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LastRegBACKGTYPE_data_OutBUS = LastRegBACKGTYPE_Register;

endmodule
