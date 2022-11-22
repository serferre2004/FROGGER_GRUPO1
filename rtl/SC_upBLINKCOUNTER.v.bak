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
module SC_upBLINKCOUNTER #(parameter upBLINKCOUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_upBLINKCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_upBLINKCOUNTER_CLOCK_50,
	SC_upBLINKCOUNTER_RESET_InHigh,
	SC_upBLINKCOUNTER_upcount_InLow,
	SC_upBLINKCOUNTER_CLEAR_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[upBLINKCOUNTER_DATAWIDTH-1:0]	SC_upBLINKCOUNTER_data_OutBUS;
input		SC_upBLINKCOUNTER_CLOCK_50;
input		SC_upBLINKCOUNTER_RESET_InHigh;
input		SC_upBLINKCOUNTER_upcount_InLow;
input		SC_upBLINKCOUNTER_CLEAR_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upBLINKCOUNTER_DATAWIDTH-1:0] upBLINKCOUNTER_Register;
reg [upBLINKCOUNTER_DATAWIDTH-1:0] upBLINKCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upBLINKCOUNTER_CLEAR_InLow == 1'b0)
		upBLINKCOUNTER_Signal = 1'b0;
	else if (SC_upBLINKCOUNTER_upcount_InLow == 1'b0)
		upBLINKCOUNTER_Signal = upBLINKCOUNTER_Register + 1'b1;
	else
		upBLINKCOUNTER_Signal = upBLINKCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_upBLINKCOUNTER_CLOCK_50, posedge SC_upBLINKCOUNTER_RESET_InHigh)
begin
	if (SC_upBLINKCOUNTER_RESET_InHigh  == 1'b1)
		upBLINKCOUNTER_Register <= 0;
	else
		upBLINKCOUNTER_Register <= upBLINKCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upBLINKCOUNTER_data_OutBUS = upBLINKCOUNTER_Register;

endmodule
