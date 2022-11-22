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
module SC_upTRANSITIONCOUNTER #(parameter upTRANSITIONCOUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_upTRANSITIONCOUNTER_data_OutBUS,
	//////////// INPUTS /////////
	SC_upTRANSITIONCOUNTER_CLOCK_50,
	SC_upTRANSITIONCOUNTER_RESET_InHigh,
	SC_upTRANSITIONCOUNTER_upcount_InLow,
	SC_upTRANSITIONCOUNTER_clear_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[3:0]	SC_upTRANSITIONCOUNTER_data_OutBUS;
input			SC_upTRANSITIONCOUNTER_CLOCK_50;
input			SC_upTRANSITIONCOUNTER_RESET_InHigh;
input			SC_upTRANSITIONCOUNTER_upcount_InLow;
input 		SC_upTRANSITIONCOUNTER_clear_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] upTRANSITIONCOUNTER_Register;
reg [3:0] upTRANSITIONCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upTRANSITIONCOUNTER_clear_InLow == 1'b0)
		upTRANSITIONCOUNTER_Signal = 0;
	else if (SC_upTRANSITIONCOUNTER_upcount_InLow == 1'b0 )
		upTRANSITIONCOUNTER_Signal = upTRANSITIONCOUNTER_Register + 3'b001;
	else
		upTRANSITIONCOUNTER_Signal = upTRANSITIONCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
	always @(posedge SC_upTRANSITIONCOUNTER_CLOCK_50, posedge SC_upTRANSITIONCOUNTER_RESET_InHigh)
begin
	if (SC_upTRANSITIONCOUNTER_RESET_InHigh  == 1'b1)
		upTRANSITIONCOUNTER_Register <= 0;
	else
		upTRANSITIONCOUNTER_Register <= upTRANSITIONCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upTRANSITIONCOUNTER_data_OutBUS = upTRANSITIONCOUNTER_Register;

endmodule
