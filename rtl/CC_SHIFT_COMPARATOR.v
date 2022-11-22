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
module CC_SHIFTCOMPARATOR #(parameter SHIFTCOMPARATOR_DATAWIDTH=23)(
//////////// OUTPUTS //////////
	CC_SHIFTCOMPARATOR_T0_OutLow,
//////////// INPUTS //////////
	CC_SHIFTCOMPARATOR_data_InBUS,
	CC_SHIFT_VALUE
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_SHIFTCOMPARATOR_T0_OutLow;
input 	[SHIFTCOMPARATOR_DATAWIDTH-1:0] CC_SHIFTCOMPARATOR_data_InBUS;
input 	[SHIFTCOMPARATOR_DATAWIDTH-1:0] CC_SHIFT_VALUE;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	if ( CC_SHIFTCOMPARATOR_data_InBUS == CC_SHIFT_VALUE) 
		CC_SHIFTCOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_SHIFTCOMPARATOR_T0_OutLow = 1'b1;
end

endmodule
