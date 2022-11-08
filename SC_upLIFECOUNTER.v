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
module SC_upLIFECOUNTER #(parameter upLIFECOUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_upLIFECOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_upLIFECOUNTER_CLOCK_50,
	SC_upLIFECOUNTER_RESET_InHigh,
	SC_upLIFECOUNTER_upcount_InLow,
	SC_upLIFECOUNTER_CLEAR_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[upLIFECOUNTER_DATAWIDTH-1:0]	SC_upLIFECOUNTER_data_OutBUS;
input		SC_upLIFECOUNTER_CLOCK_50;
input		SC_upLIFECOUNTER_RESET_InHigh;
input		SC_upLIFECOUNTER_upcount_InLow;
input 		SC_upLIFECOUNTER_CLEAR_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upLIFECOUNTER_DATAWIDTH-1:0] upLIFECOUNTER_Register;
reg [upLIFECOUNTER_DATAWIDTH-1:0] upLIFECOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upLIFECOUNTER_CLEAR_InLow == 1'b0)
		upLIFECOUNTER_Signal=0;
	else if (SC_upLIFECOUNTER_upcount_InLow == 1'b0)
		upLIFECOUNTER_Signal = upLIFECOUNTER_Register + 1'b1;
	else
		upLIFECOUNTER_Signal = upLIFECOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_upLIFECOUNTER_CLOCK_50, posedge SC_upLIFECOUNTER_RESET_InHigh)
begin
	if (SC_upLIFECOUNTER_RESET_InHigh  == 1'b1)
		upLIFECOUNTER_Register <= 0;
	else
		upLIFECOUNTER_Register <= upLIFECOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upLIFECOUNTER_data_OutBUS = upLIFECOUNTER_Register;

endmodule
