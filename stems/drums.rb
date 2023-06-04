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
    sample :bd_klub, hpf:30 if kick[hit] == 1
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


# Random electronic misc Beat

# Sliced Loop (Replace sample: :loop_industrial, :loop_amen)

live_loop :sliced_tabla do
  n = 8
  s =  line(0, 1, steps: n).choose
  f = s + (1.0 / n)
  sample :loop_tabla, beat_stretch: n, start: s, finish: f
  sleep 2.0  / n
end


# LOFI beats

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


# Trap beat

use_bpm 95

kick1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks02.wav"
kick2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats07.wav"
hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats10.wav"

k = [
  [1, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 1, 0],
  [1, 0, 0, 1, 2, 0, 0, 1, 1, 0, 0, 0, 2, 0, 1, 1],
  [1, 1, 0, 1, 2, 1, 0, 0, 1, 1, 0, 0, 2, 0, 0, 2]
]

live_loop :kick do
  r = get[:r]
  16.times do |i|
    sample kick2, amp: 1 if k[r][i] == 1
    sample snare, amp: 1.5 if k[r][i] == 2
    sleep 0.25
  end
end

define :h do |x, a, p, h|
  density x do
    sample h, amp: a, pan: p
    sleep 1
  end
end

live_loop :hat, sync: :kick do
  
  in_thread do
    with_fx :echo, decay: 2 do
      h 2, 0.5, rrand(-0.75, 0.75), hat1
    end
  end
  in_thread do
    h [4, 4, 4, 6, 6, 8, 12, 3].choose, 0.8, 0, hat2
  end
  h 2, 0.2, rrand(-0.25, 0.25), hat1
  set :r, rrand_i(0, 2)
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

# 4 On the floor (disco)

use_bpm 120

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"
hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats18.wav"
water = "/Users/sangarshanan/Downloads/samples/water_drop.wav"

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


