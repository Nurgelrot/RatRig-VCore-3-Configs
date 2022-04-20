; Configuration file for Duet 3 Mini 5+ (firmware version 3.3+)
; executed by the firmware on start-up
;
; Updated for RRF 3.4 -2 April 2022

; General preferences
M575 P1 S1 B57600                                     ; enable support for PanelDue
G90                                                   ; send absolute coordinates...
M83                                                   ; ...but relative extruder moves
M550 P"Dabus-VC3d"                                    ; set printer name
M669 K1                                               ; select CoreXY mode
M80 C"pson"													                  ;set AXT power state ON
G4 S2   											                        ;wait 2s for expansion boards to start

; Drives
M569 P0.0 S0                                          ; physical drive 0.0 ZL goes forwards
M569 P0.1 S0                                          ; physical drive 0.1 ZM goes forwards
M569 P0.2 S0                                          ; physical drive 0.2 ZR forwards
M569 P121.0 S1                                        ; physical drive 121.0 E goes backwards
M569 P0.3 S1                                          ; physical drive 0.3 Y goes backwards
M569 P0.4 S1                                          ; physical drive 0.4 X goes backwards

M584 X0.4 Y0.3 Z0.0:0.1:0.2 E121.0                    ; set drive mapping
M350 X16 Y16 Z16 E16 I1                               ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E400                        ; set steps per mm

; Speed and Acceleration
M566 X400.00 Y400.00 Z6.00 E120.00                    ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z300.00 E3600.00               ; set maximum speeds (mm/min)
;M203 X10800.00 Y10800.00 Z1000.00 E3600.00           ; Increase it up when you have it all working set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z200.00 E200.00                  ; set accelerations (mm/s^2)
;M201 X3000.00 Y3000.00 Z100.00 E600.00               ; Increase it when you have it all working set accelerations (mm/s^2) 

;Driver Current -Affected by speed. if you go over 6000 Accel you will need more current.
M906 X1100 Y1100 Z1100 E600 I50                       ; Z is very heavy on 500 I needed 1000+ set motor currents (mA) and motor idle factor in percent
M84 S30                                               ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                      ; set axis minima
M208 X510 Y500 Z500 S0                                ; set axis maxima

; Endstops
M574 X1 S1 P"121.io2.in"                              ; configure active-high endstop for low end on X via pin 121.io2.in
M574 Y2 S1 P"io4.in"                                  ; configure active-high endstop for high end on Y via pin io4.in
M591 D0 P3 C"121.io1.in" S1 R70:130 L27.00 E3.0 	    ; Duet3D rotating magnet sensor for extruder drive 0 is connected to E0 
                                                      ; endstop input, enabled, sensitivity 26.8mm.rev, 70% to 130% tolerance, 3mm detection length  

; Z-Probe (SuperPINDA)
M558 P8 C"121.io0.in" H5 F1000:120 T7000 A6            ; set Z probe type to unmodulated and the dive height + speeds
G31 P500 X-27.8 Y-12 Z2.5                              ; set Z probe trigger value, offset and trigger height

M671 X-4.5:250:504.5 Y-4.52:505:-4.52 S5              ; define positions of Z leadscrews or bed levelling screws
M557 X25:475 Y25:475 P5                               ; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B4138          ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0 Q10                                ; create bed heater output on out0 and map it to sensor 0 PWM 10Hz SSR
M307 H0 B0 S1.00                                      ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                               ; map heated bed to heater 0
M143 H0 S110                                          ; set temperature limit for heater 0 to 110C

M308 S1 P"121.temp0" Y"thermistor" T100000 B4138      ; configure sensor 1 as PT1000 on pin 121.temp0
M950 H1 C"121.out0" T1                                ; create nozzle heater output on 121.out0 and map it to sensor 1
M307 H1 B0 S1.00                                      ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                          ; set temperature limit for heater 1 to 280C

M308 S2 P"mcutemp" Y"mcutemp" A"Duet Board"           ; Configure MCU sensor

; Fans
M950 F0 C"121.out1" Q100                              ; create fan 0 on pin 121.out1 and set its frequency
M106 P0 S0 H-1                                        ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"121.out2" Q100                              ; create fan 1 on pin 121.out2 and set its frequency
M106 P1 S1 H1 T45                                     ; set fan 1 value. Thermostatic control is turned on

; Accelerometer
M955 P121.0 I12 

; Tools
M563 P0 S"MosquitoM" D0 H1 F0                         ; define tool 0
G10 P0 X0 Y0 Z0                                       ; set tool 0 axis offsets
G10 P0 R0 S0                                          ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M501                                                  ; load saved parameters from non-volatile memory
T0                                                    ; select first tool

