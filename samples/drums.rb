use_bpm 98

# https://learningmusic.ableton.com/make-beats/make-beats.html
# Kick - :bd_haus
# Clap - :sn_generic, rate: 2
# Closed hat - :drum_cymbal_closed
# Open Hat - :drum_cymbal_open, sustain: 0.3

# Sample 1

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

# Sample 2

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

# Seed based beats

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

# Basic loop

live_loop :bass_drum do
  sample :bd_haus, cutoff: 70, amp: 1.5
  sleep 0.5
end

# Sliced Loop (Replace sample: :loop_industrial, :loop_amen)

live_loop :sliced_tabla do
  n = 8
  s =  line(0, 1, steps: n).choose
  f = s + (1.0 / n)
  sample :loop_tabla, beat_stretch: n, start: s, finish: f
  sleep 2.0  / n
end
