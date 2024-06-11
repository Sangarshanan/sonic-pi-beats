# its just trap beta with flute

use_bpm 145

## CONTROLS ##
kick = 1
kick2 = 1
snare = 0
hats = 0

trap_loop1 = 1

bass = 1

glitch1 = 0
glitch2 = 0
drone = 0

oh_to_see = 0

rand_mel = 0

trumpet = 0

up_down = 0
tabla = 0


live_loop :mel, sync: :kick1 do
  if rand_mel < 1 then stop end
  # 6 to 20 to 25 to 29
  # 40 to 50
  use_random_seed 40
  use_synth :pluck
  with_fx :echo do
    my_mel = ((scale :d, :major_pentatonic) + (knit :e, 8) + (knit :r, 8)).shuffle.take(8)
    play my_mel.tick, amp: 0.2
    sleep 0.25
  end
end

live_loop :ambi_drone, sync: :kick1 do
  if drone < 1 then stop end
  with_fx :ring_mod, mix: rand(0.6) do
    sample :ambi_drone, rate: 1.34 + rand(0.01), finish: 0.1, pan: 1 - rand(2)
    sleep 2
  end
end

live_loop :glitch1, sync: :kick1 do
  if glitch1 < 1 then stop end
  with_fx :slicer do
    sample :ambi_drone, amp: 1.5
    sleep 4
  end
end

live_loop :glitch2, sync: :kick1 do
  if glitch2 < 1 then stop end
  with_fx :echo, decay: 6, phase: 0.125 do
    sleep  0.125
    sample :bass_drop_c, rpitch: 9, finish: 0.15, start: 0.1, rate: [-1, 1].choose, amp: 0.8
    sleep 7.75 + 0.125
  end
end

live_loop :base, sync: :kick1 do
  if bass < 1 then stop end
  
  use_random_seed 100
  
  effect = [:slicer, :reverb, :ixi_techno, :ping_pong].choose
  ##| effect = [:ixi_techno].choose
  with_fx effect do
    
    16.size.times do
      c = chord(:b1, :M7).shuffle.choose
      # change synth
      synth :fm, note: c, sustain: 0.25, release: 0.1
      sleep 0.25
    end
  end
end

live_loop :trap_loop1, sync: :kick1 do
  if trap_loop1 < 1 then stop end
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/hiphop/2.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32
    sleep 32
  end
end


# The 808s Function Defintions
def _808(p,v,d)
  play p-24, amp: v, attack: 0.3, decay: d, sustain: 0, release: 0.5
end

def kick(v)
  sample :bd_mehackit, amp: 2*v
  sample :bd_boom, amp: 2*v
end

def hat(v)
  sample :hat_hier, amp: 1.5, decay: 0.1, release: 0.5
end

def snare(v)
  clap = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap04.wav"
  sample clap, amp: 1*v, attack: 0, sustain: 0, release: 0, decay: 0.06, rate: 1.2
end

# The regular kick
live_loop :kick1 do
  if kick < 1 then stop end
  kick(1)
  sleep 5
  kick(1)
  sleep 3
end

# Beep kick
live_loop :kick_beep, sync: :kick1 do
  if kick2 < 1 then stop end
  use_random_seed 111
  sample :bd_tek
  sleep [1, 2].choose
  sample :bd_haus
  sleep [0.5, 1,1,1,1,1].choose
end

# the irregular "bounce" kick
live_loop :kick2, sync: :hats do
  if kick < 1 then stop end
  v=[0,0,0,0,0.7,0.9].choose
  kick(v)
  sleep 7
end

live_loop :snare, sync: :kick1 do
  if snare < 1 then stop end
  with_fx :distortion do
    vs = [0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,1]
    vs.each {
      |v|
      snare(v)
      sleep 1
    }
  end
end

live_loop :hats, sync: :kick1 do
  if hats < 1 then stop end
  a = [0,0,0,1,1,2,2,2,2].choose
  case a
  when 0
    8.times do
      hat(rrand(0.3, 1.5))
      sleep 0.5
    end
  when 1
    8.times do
      hat(rrand(0.3, 1.5))
      sleep 0.25
    end
  when 2
    2.times do
      hat(1)
      sleep 0.3
      hat(rrand(0.3, 1.5))
      sleep 0.3
      hat(1)
      sleep 0.4
    end
  end
end

brs = "/Users/sangarshanan/Downloads/samples/Melody/brass/trumpet2.wav"
live_loop :brs_loop, sync: :kick1 do
  if trumpet < 1 then stop end
  with_fx :ping_pong, mix: 0.8 do
    sample brs, beat_stretch: 32, amp: 1.5, start: 0.08, finish: 0.2, rate: 2
    sleep 8
  end
  
  ##| with_fx :reverb do
  ##|   sample brs, beat_stretch: 16, amp: 1.5
  ##|   sleep 16
  ##| end
  
end

live_loop :up_down, sync: :kick1 do
  if up_down < 1 then stop end
  use_synth :tb303
  with_fx :ixi_techno, amp: 0.3  do
    play_pattern_timed scale(:c1, :ahirbhairav, num_octaves: 3)[6..24], 0.25, release: 0.1, attack: 0.1
    play_pattern_timed scale(:c1, :ahirbhairav, num_octaves: 3)[6..24].reverse, 0.25, release: 0.1, attack: 0.1
  end
end

live_loop :tabla_loop, sync: :up_down do
  if tabla < 1 then stop end
  use_random_seed 1000
  24.times do
    sample :loop_tabla, onset: pick, release: 0.2, amp: 6
    sleep (knit, 0.25, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.25, 4, 0.25, 2).tick
  end
end

vocal = "/Users/sangarshanan/Downloads/samples/songs/mol1.wav"

live_loop :oh_to_see, sync: :kick1 do
  if oh_to_see < 1 then stop end
  with_fx :ping_pong, amp: 5 do
    
    sample vocal, beat_stretch: 16.5, finish: 0.5
    sleep 16
    
    ##| sample vocal, beat_stretch: 16.5, finish: 0.5, rate: -1
    ##| sleep 16
    
    ##| use_random_seed 1234
    ##| 16.times do
    ##|   sample vocal, beat_stretch: 16.5, onset: rrand(5,50), amp: 1.5
    ##|   sleep 1
    ##| end
    
    ##| sample vocal, beat_stretch: 16.5, start: 0.5, rate: -1
    ##| sleep 16
    
  end
end
