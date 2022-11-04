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
module SC_upTRANSITION1 #(parameter upTRANSITIONCOUNTER1_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_upTRANSITIONCOUNTER1_data_OutBUS,
	//////////// INPUTS //////////
	SC_upTRANSITIONCOUNTER1_CLOCK_50,
	SC_upTRANSITIONCOUNTER1_RESET_InHigh,
	SC_upTRANSITIONCOUNTER1_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[upTRANSITIONCOUNTER1_DATAWIDTH-1:0]	SC_upTRANSITIONCOUNTER1_data_OutBUS;
input		SC_upTRANSITIONCOUNTER1_CLOCK_50;
input		SC_upTRANSITIONCOUNTER1_RESET_InHigh;
input		SC_upTRANSITIONCOUNTER1_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upTRANSITIONCOUNTER1_DATAWIDTH-1:0] upTRANSITIONCOUNTER1_Register;
reg [upTRANSITION1_DATAWIDTH-1:0] upTRANSITION1_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upTRANSITIONCOUNTER1_upcount_InLow == 1'b0)
		upTRANSITIONCOUNTER1_Signal = upTRANSITIONCOUNTER1_Register + 1'b1;
	else
		upTRANSITIONCOUNTER1_Signal = upTRANSITIONCOUNTER1_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_upTRANSITIONCOUNTER1_CLOCK_50, posedge SC_upTRANSITIONCOUNTERR1_RESET_InHigh)
begin
	if (SC_upTRANSITIONCOUNTER1_RESET_InHigh  == 1'b1)
		upTRANSITIONCOUNTER1_Register <= 0;
	else
		upTRANSITIONCOUNTER1_Register <= upTRANSITION0COUNTER1_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upTRANSITIONCOUNTER1_data_OutBUS = upTRANSITION0COUNTER1_Register;

endmodule
