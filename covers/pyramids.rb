# Pyramids from Channel Orange

use_bpm 108

####  Intro  ####

use_synth :fm
notes = (ring :f5, :cs5, :c5)
quarter = 0.25
half = 0.5
full = 1
one_half = 1.5
double = 2


define :choir_background do
  sample :ambi_choir, amp: half, beat_stretch: double
  sleep half
end

define :intro_synth do
  notes.length().times do
    a = notes.tick
    
    play a, sustain: full, release: full, amp: quarter
    sleep one_half
    
    2.times do
      play a, amp: quarter
      sleep quarter
      play a, amp: quarter
      sleep half
      play a, amp: quarter
      sleep quarter
      play a, amp: quarter, sustain: full, release: full
      sleep double
    end
    
    play a, amp: quarter
    sleep half
  end
  
  play :as4, sustain: full, release: full, amp: quarter
  sleep one_half
  
  play :gs4, amp: quarter
  sleep quarter
  play :gs4, amp: quarter
  sleep half
  play :gs4, amp: quarter
  sleep quarter
  play :as4, sustain: full, release: full, amp: quarter
  sleep double
  
  play :gs4, amp: quarter
  sleep half
  
  4.times do
    play :as4, amp: quarter
    sleep half
  end
end

in_thread(name: :the_red_line) do
  60.times do
    choir_background
  end
end

with_fx :distortion do
  1.times do
    intro_synth
  end
end

define :beats do
  use_bpm 120
  10.times do
    with_fx :reverb, amp: 0.8 do
      sample :drum_heavy_kick, rate: -1
      sleep 0.5
      sample :drum_heavy_kick, rate: -1
      sleep 0.5
      sample :drum_snare_soft, rate: -1
      sleep 0.5
      sample :drum_heavy_kick, rate: -1
      sleep 1.5
      sample :drum_snare_soft, rate: -1
      sleep 1
    end
  end
end

live_loop :beats do
  use_bpm 120
  with_fx :reverb, amp: 0.8 do
    sample :drum_heavy_kick, rate: -1
    sleep 0.5
    sample :drum_heavy_kick, rate: -1
    sleep 0.5
    sample :drum_snare_soft, rate: -1
    sleep 0.5
    sample :drum_heavy_kick, rate: -1
    sleep 1.5
    sample :drum_snare_soft, rate: -1
    sleep 1
  end
end

live_loop :bar do
  sync :beats
  use_bpm 120
  use_synth :tech_saws
  play :F5, sustain: 1
  sleep 1
  play :G5, sustain: 1
  sleep 1
  play :Gs5, sustain: 1
  sleep 1.5
  play :As5, sustain: 0.5
  sleep 0.75
  play :Gs5, sustain: 0.5
  sleep 0.75
  play :G5, sustain: 0.5
  sleep 0.75
  play :Gs5, sustain: 1
  sleep 1
  play :G5, sustain: 1
  sleep 1
  play :G5, sustain: 1
  sleep 3
  play :F5, sustain: 1
  sleep 1
  play :G5, sustain: 1
  sleep 1
  play :Gs5, sustain: 1
  sleep 1.5
  play :As5, sustain: 0.5
  sleep 0.75
  play :Gs5, sustain: 0.5
  sleep 0.75
  play :G5, sustain: 0.5
  sleep 0.75
  play :Gs5, sustain: 1
  sleep 1
  play :G5, sustain: 0.25
  sleep 0.5
  play :G5, sustain: 0.25
  sleep 0.5
  play :G5, sustain: 1
  sleep 2
end
