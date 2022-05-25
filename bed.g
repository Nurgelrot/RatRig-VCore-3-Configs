M290 R0 S0    ;  clear baby stepping
M561          ;  reset all bed adjustments
M400          ;  flush move queue
 
if !move.axes[0].homed or !move.axes[1].homed or !move.axes[2].homed
  echo "not all axes homed, homing axes first"
  G28
 
G30 P0 X30 Y30 Z-99999 ; probe near a leadscrew
G30 P1 X245 Y470 Z-99999 ; probe near a leadscrew
G30 P2 X470 Y30 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
echo "Current rough pass deviation: " ^ move.calibration.initial.deviation


while move.calibration.initial.deviation > 0.005
        if iterations >= 5
			echo "Error: Max attemps failed. Deviation: " ^ move.calibration.initial.deviation
			break
        echo "Deviation over threshold. Executing pass" , iterations+1, "deviation", move.calibration.initial.deviation
        G30 P0 X30 Y30 Z-99999 ; probe near a leadscrew
		G30 P1 X245 Y470 Z-99999 ; probe near a leadscrew
		G30 P2 X470 Y30 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
        echo "Current deviation: " ^ move.calibration.initial.deviation
        continue
echo "Final deviation: " ^ move.calibration.initial.deviation
G0 X250 Y250 Z10 F9000
; rehome Z as the absolute height of the z plane may have shifted
G28 Z
