//#####################FALTA MODIFICAR##################################
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
module SC_upTRANSITION0 #(parameter upTRANSITIONCOUNTER0_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_upTRANSITIONCOUNTER0_data_OutBUS,
	//////////// INPUTS //////////
	SC_upTRANSITIONCOUNTER0_CLOCK_50,
	SC_upTRANSITIONCOUNTER0_RESET_InHigh,
	SC_upTRANSITIONCOUNTER0_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[upTRANSITIONCOUNTER0_DATAWIDTH-1:0]	SC_upTRANSITIONCOUNTER0_data_OutBUS;
input		SC_upTRANSITIONCOUNTER0_CLOCK_50;
input		SC_upTRANSITIONCOUNTER0_RESET_InHigh;
input		SC_upTRANSITIONCOUNTER0_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upTRANSITIONCOUNTER0_DATAWIDTH-1:0] upTRANSITIONCOUNTER0_Register;
reg [upTRANSITION0_DATAWIDTH-1:0] upTRANSITION0_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upTRANSITIONCOUNTER0_upcount_InLow == 1'b0)
		upTRANSITIONCOUNTER0_Signal = upTRANSITIONCOUNTER0_Register + 1'b1;
	else
		upTRANSITIONCOUNTER0_Signal = upTRANSITIONCOUNTER0_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_upTRANSITIONCOUNTER0_CLOCK_50, posedge SC_upTRANSITION0COUNTER0R_RESET_InHigh)
begin
	if (SC_upTRANSITIONCOUNTER0_RESET_InHigh  == 1'b1)
		upTRANSITIONCOUNTER0_Register <= 0;
	else
		upTRANSITIONCOUNTER0_Register <= upTRANSITIONCOUNTER0_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upTRANSITIONCOUNTER0_data_OutBUS = upTRANSITIONCOUNTER0_Register;

endmodule
