use_bpm 100

mel1 =
  ring(:e4, :g4, :fs4, :e4, :fs4, :eb4).repeat(2) +
  ring(:e4, :ab4, :e4, :ab4, :a4, :b4, :a4, :g4, :fs4)

t1 =
  ring(1,1,0.5,0.25,0.25,1).repeat(2) +
  ring(1, 1, 0.25, 0.25,0.25,0.25,1,0.75,1.25)

live_loop :mel1, sync: :drum1 do
  ##| stop
  tick
  use_synth :bass_foundation
  play mel1.look, sustain: t1.look
  sleep t1.look
end


live_loop :chord1 do
  ##| stop
  use_synth :fm
  2.times do
    play [:e3, :g3, :b3], sustain: 3
    sleep 4
  end
  1.times do
    play [:e3, :ab3, :b3], sustain: 5
    sleep 6
  end
end


grid1 = [1,1,0,0,   2,0,1,0,   1,1,0,1,   2,0,0,0]

live_loop :drum do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample :bd_tek if grid1[index] == 1
    sample :sn_generic, rate: 2 if grid1[index] == 2
    
    sleep 0.25
  end
end


grid2 = [1,1,1,1,   1,1,1,1,   1,1,1,1,   1,1,1,1]

live_loop :drum1 do
  ##| stop
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed, amp: 0.5 if grid2[index] == 1
    sleep 0.25
  end
end

