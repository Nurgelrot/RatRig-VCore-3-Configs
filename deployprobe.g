if sensors.probes[0].value[0] == 1000
  M564 H1
  G90
  G1 X15 Y450 F10000
  G1 Y508
  G1 Y450
  M400 S1
  if sensors.probes[0].value[0] == 1000
    abort "Probe attach failed"
G1 X250 Y250
