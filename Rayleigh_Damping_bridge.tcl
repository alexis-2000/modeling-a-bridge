set a [eigen 4]; #kuklikes idiosyxnotites omega, sto tetragwno
set lamda1 [lindex $a 0]
set lamda2 [lindex $a 1]
set lamda3 [lindex $a 2]
set lamda4 [lindex $a 3]

set omega1 [expr pow($lamda1,0.5)]
set omega2 [expr pow($lamda2,0.5)]
set omega3 [expr pow($lamda3,0.5)]
set omega4 [expr pow($lamda4,0.5)]

# C=a1*M+a2*K
set xi [expr 0.05]; # 5% suntelestis aposbesis
set a2 [expr 2.0*$xi/($omega1+$omega2)]
set a1 [expr $omega1*$omega2*$a2]
#rayleigh $alphaM $betaK $betaKinit $betaKcomm
#rayleigh $a1 0.0 $a2 0.0