# Svaras in Frequency

use_bpm 80

sa = 60 #0
ra = 61 #1
ri = 62 #2
ru = 63 #3
gi = 63 #3
gu = 64 #4
ma = 65 #5
mi = 66 #6
pa = 67 #7
dha = 68 #8
dhi = 69 #9
na = 69  #9
dhu = 70 #10
ni = 70  #10
nu = 71  #11

use_synth :pluck

15.times do
play (ring mi, gi, ru, gi).tick
sleep 0.125
end

5.times do
  play (ring na+2, ni+2, nu+2, ni+2, na+2).tick
  sleep [0.5, 0.125].choose
end

5.times do
  play (ring pa, dha, nu, dha, pa).tick
  sleep [0.5, 0.125].choose
end
