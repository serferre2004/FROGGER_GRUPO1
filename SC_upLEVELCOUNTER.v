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
module SC_upLEVELCOUNTER #(parameter upLEVELCOUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_upLEVELCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_upLEVELCOUNTER_CLOCK_50,
	SC_upLEVELCOUNTER_RESET_InHigh,
	SC_upLEVELCOUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[upLEVELCOUNTER_DATAWIDTH-1:0]	SC_upLEVELCOUNTER_data_OutBUS;
input		SC_upLEVELCOUNTER_CLOCK_50;
input		SC_upLEVELCOUNTER_RESET_InHigh;
input		SC_upLEVELCOUNTER_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upLEVELCOUNTER_DATAWIDTH-1:0] upLEVELCOUNTER_Register;
reg [upLEVELCOUNTER_DATAWIDTH-1:0] upLEVELCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upLEVELCOUNTER_upcount_InLow == 1'b0)
		upLEVELCOUNTER_Signal = upLEVELCOUNTER_Register + 1'b1;
	else
		upLEVELCOUNTER_Signal = upLEVELCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_upLEVELCOUNTER_CLOCK_50, posedge SC_upLEVELCOUNTER_RESET_InHigh)
begin
	if (SC_upLEVELCOUNTER_RESET_InHigh  == 1'b1)
		upLEVELCOUNTER_Register <= 0;
	else
		upLEVELCOUNTER_Register <= upLEVELCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upLEVELCOUNTER_data_OutBUS = upLEVELCOUNTER_Register;

endmodule
