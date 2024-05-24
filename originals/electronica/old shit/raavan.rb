# Raavan fitted with Drums and Bass

define :drums do
  use_random_seed 500
  16.times do
    
    ##| [:perc_till, :drum_snare_soft, :bd_haus]
    
    sample :perc_till, rate: 2, cutoff: 120 if rand < 0.35
    
    # [:drum_tom_hi_soft, :tabla_ghe5, :bd_haus])
    
    sample :tabla_ghe5, rate: 2, cutoff: 100 if rand >= 0.35
    
    sleep 0.125
  end
end

define :bd do
  sample :bd_haus, cutoff: 100, amp: 2
  sleep 0.5
end

10.times do
  bd
end

in_thread(name: :frame) do
  loop do
    bd
  end
end

in_thread(name: :frame1) do
  loop do
    drums
  end
end

live_loop :bass do
  use_synth :fm
  play :d3, attack: 0, release: 0.25
  sleep 0.25
  play :c3, attack: 0, release: 0.5
  sleep 1
  play :e3
  sleep 0.25
  play :f3
  sleep 0.25
  play :g3
  sleep 0.25
  play :c3, attack: 0, release: 2
  sleep 2
end

