use_bpm 98

"""
  0,0,0,0, 0,0,0,0,
  0,0,0,0, 0,0,0,0,
  0,0,0,0, 0,0,0,0,
  0,0,0,0, 0,0,0,0,
"""


# https://learningmusic.ableton.com/make-beats/make-beats.html
# Kick - :bd_haus
# Clap - :sn_generic, rate: 2
# Closed hat - :drum_cymbal_closed
# Open Hat - :drum_cymbal_open, sustain: 0.3

# Chill beats Sample 1 

grid1 = [1,0,0,0,   2,0,0,1,   0,0,1,0,   2,0,0,1]

live_loop :drum1 do
  16.times do |index|
    puts index, grid1[index]
    sample :bd_haus if grid1[index] == 1
    sample :sn_generic, rate: 2 if grid1[index] == 2
    
    sleep 0.25
  end
end


grid2 = [1,1,2,0,   1,0,1,0,   1,0,1,0,   1,0,1,0]

live_loop :drum2 do
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed if grid2[index] == 1
    sample :drum_cymbal_open, sustain: 0.3 if grid2[index] == 2
    
    sleep 0.25
  end
end

# Chill beats Sample 2

grid1 = [1,1,0,0,   2,0,1,0,   1,1,0,1,   2,0,0,0]

live_loop :drum1 do
  16.times do |index|
    puts index, grid1[index]
    sample :bd_haus if grid1[index] == 1
    sample :sn_generic, rate: 2 if grid1[index] == 2
    
    sleep 0.25
  end
end


grid2 = [1,1,1,1,   1,1,1,1,   1,1,1,1,   1,1,2,0]

live_loop :drum2 do
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed if grid2[index] == 1
    sample :drum_cymbal_open, sustain: 0.3 if grid2[index] == 2
    
    sleep 0.25
  end
end


# Chill Bop (Low BPM) Dance Music (High BPM)

kick =  [1,1,0,0,1,0,1,0,1,0,0,0,1,1,1,1]
snare = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
hat =   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]


live_loop :kick do
  16.times do |hit|
    sample :bd_klub, hp4:30 if kick[hit] == 1
    sleep 0.25
  end
end

live_loop :Snare do
  16.times do |hit|
    sample :drum_snare_hard, amp:rrand(0.6,0.9) if snare[hit] == 1
    sleep 0.25
  end
end

live_loop :hat do
  16.times do |hit|
    sample :drum_cymbal_closed,  release:0.3, amp: rrand(0.05, 0.3), pan: rrand(-1,1) if spread(13,16).tick
    sleep 0.25
  end
end


# Another chill Breakbeat

use_bpm 120

live_loop :rummut do
  ##| stop
  sample :bd_klub, amp: 2
  sleep 0.5
  sample :bd_klub, amp: 2, rate: 1.25
  sleep 0.25
  sample :bd_ada, amp: 1.5
  sleep 0.25
  with_fx :reverb, mix: 0.2, decay: 1 do
    sample :sn_dolf, amp: 1.75
  end
  sleep 0.25
  sample :bd_pure, amp: 1.5
  sleep 0.75
  sample :bd_ada, amp: 2
  sleep 1
  with_fx :reverb, mix: 0.2, decay: 1 do
    sample :drum_snare_soft, amp: 2
  end
  sleep 1
end

live_loop :hihat, sync: :rummut do
  ##| stop
  with_fx :flanger, mix: 0 do
    sample :perc_snap, amp: rrand(0.9, 1.4), rate: rrand(1.9, 2.1), cutoff: rrand(80, 120), pan: rrand(-0.25, 0.25)
  end
  sleep 0.25
end

live_loop :amen_break, sync: :rummut do
  ##| stop
  2.times do
    3.times do
      sample :loop_amen, beat_stretch: 4
      sleep 4
    end
    sample :loop_amen_full, beat_stretch: 16, start: 0.75
    sleep 4
  end
end


# Insk Insk No 1

live_loop :bass_drum do
  sample :bd_haus, cutoff: 70, amp: 1.5
  sleep 0.5
end

# 2

live_loop :beats do
  sample :bd_tek, amp: 0.4
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample  :drum_cymbal_soft, sustain: 0, release: 0.1, amp: 0.4
    sleep 0.5
  end
end

# 3 (seed based)

with_fx :reverb, mix: 0.2 do
  live_loop :drums do
    use_random_seed 500
    16.times do
      sample :bass_hit_c, rate: 2, cutoff: 120 if rand < 0.35
      sleep 0.125
    end
  end
end

live_loop :bd do
  sample :bd_haus, cutoff: 100, amp: 2
  sleep 0.5
end


# Classic house beat

use_bpm 120

grid1 = [1,0,2,0,   1,0,2,0,   1,0,2,0,   1,0,2,0]

live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample :drum_heavy_kick if grid1[index] == 1
    sample :drum_splash_hard, rate: 3, beat_stretch: 0.5 if grid1[index] == 2
    
    sleep 0.25
  end
end

live_loop :clap do
  sample :sn_generic, rate: 3, amp: 0.7
  sleep 2
end


# House loops

live_loop :house_loop do
  ##| stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/house/1.wav"
  with_fx :band_eq do
    sample s
    sleep (sample_duration s)
  end
end


# Random electronic misc Beat

# Sliced Loop (Replace sample: :loop_industrial, :loop_amen)

live_loop :sliced_tabla do
  n = 8
  s =  line(0, 1, steps: n).choose
  f = s + (1.0 / n)
  sample :loop_tabla, beat_stretch: n, start: s, finish: f
  sleep 2.0  / n
end

# Tabla fast beat

live_loop :tabla do
  sample :tabla_na if spread(5,7).tick
  sleep 0.25
end

live_loop :tabla2 do
  sample :tabla_na_s if spread(3,5).tick
  sleep 0.25
end

live_loop :noisehat do
  use_synth :noise
  play :g4, release: 0.025, cutoff: 110, amp: 2 if spread(5,16).tick
  sleep 0.25
end


# Chill cymbals

use_bpm 60

live_loop :drums do
  sample :bd_808, amp: 3
  sleep 1
  sample :sn_dub, amp: 1.5
  sleep 1
  sample :bd_808, amp: 2
  sleep 1
  sample :sn_dub, amp: 1.5
  sleep 1
end

live_loop :hats do
  8.times do
    sample :drum_cymbal_closed, amp: rand(0.5..0.8), pan: rrand(-0.2, 0.2)
    sleep 0.25
  end
end

# LOFI beats


drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (3).wav"
live_loop :lofi_drum_loop, sync: :met do    
  sample drum_loop, finish: 0.5, amp: 2
  sleep (sample_duration drum_loop)/2
end

# Soul beat

use_bpm 80

grid1 = [1,0,1,0,   2,0,0,1,   1,0,1,0,   2,0,0,0]
grid2 = [1,0,1,0,   2,0,0,1,   1,2,1,0,   2,0,0,0]

define :soul_beat do |grid|
  16.times do |index|
    puts index, grid[index]
    sample :drum_heavy_kick if grid[index] == 1
    sample :drum_snare_soft if grid[index] == 2
    sleep 0.25
  end
end


live_loop :drum1 do
  soul_beat grid1
  soul_beat grid2
end


live_loop :hi_hat do
  sample :drum_cymbal_closed
  sleep 0.5
end


# Random Misc

live_loop :cash_register do
  sample :perc_till, beat_stretch: 0.5
  sleep 2
end


live_loop :beep do
  sleep 1
  sample :elec_beep, amp: 0.3
  sleep 1
end

# yet another trap beat

use_bpm 140

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks08.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"

kick_snare= [
  1,0,0,0, 0,0,0,0,
  0,1,0,0, 2,0,0,0,
  0,0,1,0, 0,0,0,0,
  0,0,0,0, 0,0,1,0,
  0,0,0,0, 2,0,0,0,
  0,0,1,0, 0,0,0,0,
]

hihat= [
  3,0,0,3, 0,0,3,0,
  0,3,0,0, 3,3,3,0,
  0,0,3,0, 0,3,0,0,
  3,0,0,3, 0,0,3,0,
  0,3,0,0, 3,0,0,3,
  0,0,3,0, 0,3,0,0,
]

live_loop :drum do
  48.times do |index|
    puts index, kick_snare[index], hihat[index]
    sample :bd_haus, cutoff: 70, amp: 1.5 if kick_snare[index] == 1
    sample snare if kick_snare[index] == 2
    sample hat1 if hihat[index] == 3
    sleep 0.2
  end
end

# 4 On the floor (disco) house beat

use_bpm 120

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"
hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats18.wav"

grid1= [
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,4,0,
]


live_loop :drum do
  32.times do |index|
    puts index, grid1[index]
    sample kick, amp: 1.5 if grid1[index] == 1
    sample snare if grid1[index] == 2
    sample hat1 if grid1[index] == 3
    sample hat2 if grid1[index] == 4
    sleep 0.25
  end
end


# A Different House Beat

kick_flag = 1
clap_flag = 1
hat_flag = 0
cymbal_open_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.4 do
  with_fx :lpf, cutoff: 100 do
    live_loop :kick, sync: :met do
      if kick_flag < 1 then stop end
      sample :bd_zum, amp: 1, cutoff: 100
      sleep 0.5
    end
    
    live_loop :hhc3, sync: :met do
      if hat_flag < 1 then stop end
      
      sleep 0.25
      sample :drum_cymbal_closed, amp: 2, lpf: 100
      sleep 0.25
    end
    
    live_loop :cymbal_open, sync: :met do
      if cymbal_open_flag < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.5, finish: 0.25, lpf: 120, rate: 1.1
      sleep 0.25
    end
    
    live_loop :snare, sync: :met do
      if clap_flag < 1 then stop end
      
      ##| stop
      a = 0.75
      co = 110
      at = 0.00
      r = 3
      sleep 0.5
      sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
      sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
      sleep 0.5
    end
  end
end


# Bo didley Beat

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks03.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare02.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats01.wav"

kick_snare= [
  1,0,2,1, 0,1,2,0,
  0,1,2,0, 1,0,2,0,
]


live_loop :drum do
  16.times do |index|
    puts index, kick_snare[index]
    sample kick, amp: 1.5 if kick_snare[index] == 1
    sample snare if kick_snare[index] == 2
    sleep 0.25
  end
end

live_loop :hi_hat do
  sample hat1, amp: 0.5
  sleep 0.5
end

# Shuffle feel

use_bpm 100

conga = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Conga1.wav"
stick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Stick1.wav"
mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

grid1= [
  1,0,1,0, 2,0,2,0,
  1,0,1,0, 2,0,1,0,
]

live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample conga, cutoff: 80, amp: 2 if grid1[index] == 1
    sample stick if grid1[index] == 2
    sleep 0.25
  end
end

live_loop :mar do
  sleep 1
  sample mar
  sleep 1
end


# Feel good Gorillaz Drums

live_loop :kick do
  sample :bd_fat, amp: 2
  sleep 2.5
  sample :bd_fat, amp: 2
  sleep 1.5
end

live_loop :snare, delay: 1 do
  ##| stop
  sample :sn_dolf, amp: 2
  sleep 2
end


# Welcome to Los Santos

ohat= "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats05.wav"

grid1= [
  1,0,0,0, 2,0,0,1,
  1,0,3,0, 2,0,0,0
]


live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample :bd_haus if grid1[index] == 1
    sample :sn_dolf if grid1[index] == 2
    sample ohat if grid1[index] == 3
    sleep 0.25
  end
end


# Sliced garzul
live_loop :breakbeat, sync: :kick do
  ##| stop
  with_fx :slicer, phase: 1.75, wave: 0, mix: 1.0 do # :hpf
    sample :loop_garzul, beat_stretch: 16, amp: 1
    sleep 16
  end
end



# Random Percussion

live_loop :perc do
  sample "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Clave3.wav", amp: rrand(1, 1.5), release: rrand(0.6, 0.9)
  sleep [0.5, 1, 0.75, 0.25].choose
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas3.wav"

live_loop :mar do
  sample mar
  sleep 1
end

# TABLA

live_loop :tabla_loop1, sync: :kick  do
  ##| stop
  with_fx :level, amp: 2 do
    sample :tabla_ghe1
    sleep 0.75
    sample :tabla_re
    sleep 0.25
    sample :tabla_na
    sleep 0.5
    sample :tabla_ghe1
    sleep 0.5
    sample :tabla_ghe1
    sleep 0.75
    sample :tabla_re
    sleep 0.25
    sample :tabla_na_o
    sleep 1
  end
end

# Echooey loop

use_bpm 100

with_fx :echo, room: 0.8, decay: 8, phase: 0.25, mix: 0.4 do
  live_loop :rhythm do
    sample :drum_heavy_kick, amp: 0.5
    sample :elec_plip, rate: [0.5, 2, 1, 4].choose * [1, 2, 3, 10].choose, amp: 0.6
    sleep 1
  end
end


# Random Loop with Knit and Onset

live_loop :tabla_loop do
  use_random_seed 1245
  24.times do
    sample :loop_tabla, onset: pick, release: 0.2, amp: 2.5
    sleep (knit, 0.125, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.125, 4, 0.25, 2).tick
  end
end

# Dilla beat

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks03.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare02.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"
use_bpm 120

live_loop :drumloop1 do
  at [0, 4, 4.75] do
    sample kick, amp: 2
  end
  sleep 8
end

live_loop :drumloop do
  at [2, 6] do
    sample snare
  end
  sleep 8
end

live_loop :hat do
  sample hat1
  sleep 1.5
end


# Flibble

live_loop :flibble do
  ##| stop
  sample :bd_haus, rate: 1
  sample :bass_thick_c, rate: 0.5
  sleep 2
  with_fx :ping_pong do
    sample :elec_beep, rate: -2
  end
  sleep 2
end


# IDM pattern

live_loop :beat do
  ##| stop
  with_fx :bpf do # :reverb
    
    sample :arovane_beat_c, beat_stretch: 20, finish: 0.5
    
    sleep 10
  end
end

live_loop :start do
  with_fx :reverb do
    play :b2 , sustain: 1.7, release: 0.3, note_slide: 2, amp: 0.5 do |s|
      control s, note: :b1
    end
    sleep 10
  end
end

