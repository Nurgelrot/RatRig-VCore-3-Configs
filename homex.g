G91               ; relative positioning
G1 H1 X-515 F3000 ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X5 F6000    ; go back a few mm
G1 H1 X-515 F360  ; move slowly to X axis endstop once more (second pass)
G90               ; absolute positioning
 
G1 X0 F6000