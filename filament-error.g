; filament runout script to reduce false positives
; pulse-counting filament sensor is overly sensitive

if !exists(global.filament_error_ts)
  global filament_error_ts = datetime(0)

if (state.time - global.filament_error_ts) < 3
  M291 P{"Pausing: " ^ param.S} R"Filament Feed Problem" S1 T10
  echo "Pausing: " ^ param.S
  M25
else
  echo "Ignoring: " ^ param.S

set global.filament_error_ts = state.time