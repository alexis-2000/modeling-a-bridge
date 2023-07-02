#MODEL GENERATION#
#Create ModelBuilder (with two-dimensions and 3DOF/node)
model BasicBuilder -ndm 2 -ndf 3

# Units: kN, m, sec

set L 6.0;
set H 4.0;

#beams
node 1 0.0 [expr $H]
node 2 [expr $L/6.0] [expr $H]
node 3 [expr 2.0*$L/6.0] [expr $H]
node 4 [expr 3.0*$L/6.0] [expr $H]
node 5 [expr 4.0*$L/6.0] [expr $H]
node 6 [expr 5.0*$L/6.0] [expr $H]
node 7 [expr 6.0*$L/6.0] [expr $H]
node 8 [expr 7.0*$L/6.0] [expr $H]
node 9 [expr 8.0*$L/6.0] [expr $H]
node 10 [expr 9.0*$L/6.0] [expr $H]
node 11 [expr 10.0*$L/6.0] [expr $H]
node 12 [expr 11.0*$L/6.0] [expr $H]
node 13 [expr 12.0*$L/6.0] [expr $H]
node 14 [expr 13.0*$L/6.0] [expr $H]
node 15 [expr 14.0*$L/6.0] [expr $H]
node 16 [expr 15.0*$L/6.0] [expr $H]
node 17 [expr 16.0*$L/6.0] [expr $H]
node 18 [expr 17.0*$L/6.0] [expr $H]
node 19 [expr 18.0*$L/6.0] [expr $H]

#column 1
node 20 [expr $L] 0.0
node 21 [expr $L] [expr $H/5.0]
node 22 [expr $L] [expr 2.0*$H/5.0]
node 23 [expr $L] [expr 3.0*$H/5.0]
node 24 [expr $L] [expr 4.0*$H/5.0]

#column 2
node 25 [expr 2.0*$L] 0.0
node 26 [expr 2.0*$L] [expr $H/5.0]
node 27 [expr 2.0*$L] [expr 2.0*$H/5.0]
node 28 [expr 2.0*$L] [expr 3.0*$H/5.0]
node 29 [expr 2.0*$L] [expr 4.0*$H/5.0]

fix 20 1 1 0
fix 25 1 1 0

set E 30000000.0;
set p 2.5;

set b1 0.25;
set h1 0.2;
set A1 [expr $b1*$h1];
set I1 [expr $b1*pow($h1,3.0)/12.0];

set b2 0.25;
set h2 0.3;
set A2 [expr $b2*$h2];
set I2 [expr $b2*pow($h2,3.0)/12.0];


uniaxialMaterial Elastic 1 $E

geomTransf Linear 1

source parameters_bridge.tcl

#beams
set d1 $d1;
set d2 $d2;
set d3 $d3;
set d4 $d4;
set d5 $d5;
set d6 $d6;
set d7 $d7;
set d8 $d8;
set d9 $d9;
set d10 $d10;
set d11 $d11;
set d12 $d12;
set d13 $d13;
set d14 $d14;
set d15 $d15;
set d16 $d16;
set d17 $d17;
set d18 $d18;


#beams
element elasticBeamColumn 1 1 2 $A1 [expr $d1*$E] $I1 1
element elasticBeamColumn 2 2 3 $A1 [expr $d2*$E] $I1 1
element elasticBeamColumn 3 3 4 $A1 [expr $d3*$E] $I1 1
element elasticBeamColumn 4 4 5 $A1 [expr $d4*$E] $I1 1
element elasticBeamColumn 5 5 6 $A1 [expr $d5*$E] $I1 1
element elasticBeamColumn 6 6 7 $A1 [expr $d6*$E] $I1 1
element elasticBeamColumn 7 7 8 $A1 [expr $d7*$E] $I1 1
element elasticBeamColumn 8 8 9 $A1 [expr $d8*$E] $I1 1
element elasticBeamColumn 9 9 10 $A1 [expr $d9*$E] $I1 1
element elasticBeamColumn 10 10 11 $A1 [expr $d10*$E] $I1 1
element elasticBeamColumn 11 11 12 $A1 [expr $d11*$E] $I1 1
element elasticBeamColumn 12 12 13 $A1 [expr $d12*$E] $I1 1
element elasticBeamColumn 13 13 14 $A1 [expr $d13*$E] $I1 1
element elasticBeamColumn 14 14 15 $A1 [expr $d14*$E] $I1 1
element elasticBeamColumn 15 15 16 $A1 [expr $d15*$E] $I1 1
element elasticBeamColumn 16 16 17 $A1 [expr $d16*$E] $I1 1
element elasticBeamColumn 17 17 18 $A1 [expr $d17*$E] $I1 1
element elasticBeamColumn 18 18 19 $A1 [expr $d18*$E] $I1 1

#column 1
set d19 1;
set d20 1;
set d21 1;
set d22 1;
set d23 1;

#column 2
set d24 1;
set d25 1;
set d26 1;
set d27 1;
set d28 1;

#column 1
element elasticBeamColumn 19 20 21 $A2 [expr $d19*$E] $I2 1
element elasticBeamColumn 20 21 22 $A2 [expr $d20*$E] $I2 1
element elasticBeamColumn 21 22 23 $A2 [expr $d21*$E] $I2 1
element elasticBeamColumn 22 23 24 $A2 [expr $d22*$E] $I2 1
element elasticBeamColumn 23 24 7 $A2 [expr $d23*$E] $I2 1

#column 2
element elasticBeamColumn 24 25 26 $A2 [expr $d24*$E] $I2 1
element elasticBeamColumn 25 26 27 $A2 [expr $d25*$E] $I2 1
element elasticBeamColumn 26 27 28 $A2 [expr $d26*$E] $I2 1
element elasticBeamColumn 27 28 29 $A2 [expr $d27*$E] $I2 1
element elasticBeamColumn 28 29 13 $A2 [expr $d28*$E] $I2 1

#beams
mass 1 [expr $p*$A1*($L/6.0)/2.0] [expr $p*$A1*($L/6.0)/2.0] 0.0
mass 2 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 3 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 4 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 5 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 6 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 7 [expr $p*($A1*($L/6.0)+$A2*($H/5.0)/2.0)] [expr $p*($A1*($L/6.0)+$A2*($H/5.0)/2.0)] 0.0
mass 8 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 9 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 10 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 11 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 12 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 13 [expr $p*($A1*($L/6.0)+$A2*($H/5.0)/2.0)] [expr $p*($A1*($L/6.0)+$A2*($H/5.0)/2.0)] 0.0
mass 14 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 15 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 16 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 17 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 18 [expr $p*$A1*($L/6.0)] [expr $p*$A1*($L/6.0)] 0.0
mass 19 [expr $p*$A1*($L/6.0)/2.0] [expr $p*$A1*($L/6.0)/2.0] 0.0

#column 1
mass 20 [expr $p*$A2*($H/5.0)/2.0] [expr $p*$A2*($H/5.0)/2.0] 0.0
mass 21 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0
mass 22 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0
mass 23 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0
mass 24 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0

#column 2
mass 25 [expr $p*$A2*($H/5.0)/2.0] [expr $p*$A2*($H/5.0)/2.0] 0.0
mass 26 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0
mass 27 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0
mass 28 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0
mass 29 [expr $p*$A2*($H/5.0)] [expr $p*$A2*($H/5.0)] 0.0

recorder Node -file nodes_bridge.out -time -node 1 2 3 -dof 2 disp

set AnalysisType Modal

source Rayleigh_Damping_bridge.tcl

set pi [expr 2.0*asin(1.0)]
set f1 [expr $omega1/(2.0*$pi)]
set f2 [expr $omega2/(2.0*$pi)]
set f3 [expr $omega3/(2.0*$pi)]
set f4 [expr $omega4/(2.0*$pi)]

file delete 'frequencies_bridge.out'
set Ffile [open "frequencies_bridge.out" "w"]

puts $Ffile  $f1
puts $Ffile  $f2
puts $Ffile  $f3
puts $Ffile  $f4

close $Ffile
#puts "all ok
