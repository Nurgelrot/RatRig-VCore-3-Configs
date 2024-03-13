if sensors.probes[0].value[0] == 1000
  M564 H1
  G90
  G1 X5 Y32 F10000
  G1 Y0
  G1 Y32
  M400
  if sensors.probes[0].value[0] == 1000
    abort "Probe attach failed"
G1 X250 Y250
