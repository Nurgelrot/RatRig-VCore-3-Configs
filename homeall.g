G91                     ; relative positioning
G1 H2 Z10 F6000          ; lift Z relative to current position
 
G1 H1 X-505 Y505 F3600 ; move quickly to X and U axis endstops and stop there (first pass)
G1 H1 X-505 F1800 ; move quickly to X and U axis endstops and stop there (first pass)
G1 H1 Y505 F1800 ; move quickly to X and U axis endstops and stop there (first pass)
G1 H1 X-505 Y505 F360  ; move slowly to X and U axis endstops once more (second pass)
G1 H1 X-505 F360  ; move slowly to X and U axis endstops once more (second pass)
G1 H1 Y505 F360  ; move slowly to X and U axis endstops once more (second pass)
 
G90                     ; absolute positioning
G1 X250 Y250 F10000 ; go to first probe point
G30                     ; home Z by probing the bed
 
G91                    ; relative positioning
G1 Z10 F1800             ; lift Z relative to current position
G90                    ; absolute positioning
;G1 X0 Y35 F10000