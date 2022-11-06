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
///Q=======================================================
//  MODULE Definition
//=======================================================
module CC_GATES (
//////////// OUTPUTS //////////
	CC_GATES_and0_Out,
	CC_GATES_and1_Out,
	CC_GATES_and3_Out,
	CC_GATES_and4_Out,
	CC_GATES_and5_Out,
	CC_GATES_and6_Out,
	CC_GATES_and7_Out,
	
	CC_GATES_or0_Out,
	CC_GATES_or1_Out,
	CC_GATES_or2_Out,
	CC_GATES_or3_Out,
	CC_GATES_or4_Out,
	CC_GATES_or5_Out,
	CC_GATES_or6_Out,
	CC_GATES_or7_Out,
	
//////////// INPUTS //////////
	CC_GATES_Pointreg7_In,
	CC_GATES_Pointreg6_In,
	CC_GATES_Pointreg5_In,
	CC_GATES_Pointreg4_In,
	CC_GATES_Pointreg3_In,
	CC_GATES_Pointreg2_In,
	CC_GATES_Pointreg1_In,
	CC_GATES_Pointreg0_In,
	
	
	CC_GATES_Backreg7_In,
	CC_GATES_Backreg6_In,
	CC_GATES_Backreg5_In,
	CC_GATES_Backreg4_In,
	CC_GATES_Backreg3_In,
	CC_GATES_Backreg2_In,
	CC_GATES_Backreg1_In,
	CC_GATES_Backreg0_In,
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	CC_GATES_and0_Out,
output	CC_GATES_and1_Out,
output	CC_GATES_and3_Out,
output	CC_GATES_and4_Out,
output	CC_GATES_and5_Out,
output	CC_GATES_and6_Out,
output	CC_GATES_and7_Out,
	
output	CC_GATES_or0_Out,
output	CC_GATES_or1_Out,
output	CC_GATES_or2_Out,
output	CC_GATES_or3_Out,
output	CC_GATES_or4_Out,
output	CC_GATES_or5_Out,
output	CC_GATES_or6_Out,
output	CC_GATES_or7_Out,

input	CC_GATES_Pointreg7_In,
input	CC_GATES_Pointreg6_In,
input	CC_GATES_Pointreg5_In,
input	CC_GATES_Pointreg4_In,
input	CC_GATES_Pointreg3_In,
input	CC_GATES_Pointreg2_In,
input	CC_GATES_Pointreg1_In,
input	CC_GATES_Pointreg0_In,
	
	
input	CC_GATES_Backreg7_In,
input	CC_GATES_Backreg6_In,
input	CC_GATES_Backreg5_In,
input	CC_GATES_Backreg4_In,
input	CC_GATES_Backreg3_In,
input	CC_GATES_Backreg2_In,
input	CC_GATES_Backreg1_In,
input	CC_GATES_Backreg0_In,
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
// CC_GATES_and7_Out
assign CC_GATES_and7_Out = CC_GATES_Pointreg7_In & CC_GATES_Backreg7_In;

// CC_GATES_and6_Out
assign CC_GATES_and6_Out = CC_GATES_Pointreg6_In & CC_GATES_Backreg6_In;
// CC_GATES_and5_Out
assign CC_GATES_and5_Out = CC_GATES_Pointreg5_In & CC_GATES_Backreg5_In;
// CC_GATES_and4_Out
assign CC_GATES_and4_Out = CC_GATES_Pointreg4_In & CC_GATES_Backreg4_In;
// CC_GATES_and3_Out
assign CC_GATES_and3_Out = CC_GATES_Pointreg3_In & CC_GATES_Backreg3_In;
// CC_GATES_and2_Out
assign CC_GATES_and2_Out = CC_GATES_Pointreg2_In & CC_GATES_Backreg2_In;
// CC_GATES_and1_Out
assign CC_GATES_and1_Out = CC_GATES_Pointreg1_In & CC_GATES_Backreg1_In;
// CC_GATES_and0_Out
assign CC_GATES_and0_Out = CC_GATES_Pointreg0_In & CC_GATES_Backreg0_In;

// CC_GATES_or7_Out
assign CC_GATES_or7_Out = CC_GATES_Pointreg7_In | CC_GATES_Backreg7_In;
// CC_GATES_or6_Out
assign CC_GATES_or6_Out = CC_GATES_Pointreg6_In | CC_GATES_Backreg6_In;
// CC_GATES_or5_Out
assign CC_GATES_or5_Out = CC_GATES_Pointreg5_In | CC_GATES_Backreg5_In;
// CC_GATES_or4_Out
assign CC_GATES_or4_Out = CC_GATES_Pointreg4_In | CC_GATES_Backreg4_In;
// CC_GATES_or3_Out
assign CC_GATES_or3_Out = CC_GATES_Pointreg3_In | CC_GATES_Backreg3_In;
// CC_GATES_or2_Out
assign CC_GATES_or2_Out = CC_GATES_Pointreg2_In | CC_GATES_Backreg2_In;
// CC_GATES_or1_Out
assign CC_GATES_or1_Out = CC_GATES_Pointreg1_In | CC_GATES_Backreg1_In;
// CC_GATES_or0_Out
assign CC_GATES_or0_Out = CC_GATES_Pointreg0_In | CC_GATES_Backreg0_In;


endmodule
//=======================================================A/

