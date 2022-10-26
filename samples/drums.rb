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

