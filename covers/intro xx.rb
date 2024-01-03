use_bpm 110

tt1 = ring(
  0.5, 0.75, 0.75, 0.5,
  0.75, 0.75, 0.5, 0.75,
  0.75, 0.5, 0.75, 0.75
)
use_synth :bass_foundation

define :mel1 do |note|
  tick
  with_fx :reverb, room: 0.8 do
    play note
    sleep tt1.look
  end
end

define :mel2 do
  2.times do
    play :c4
    sleep 0.5
  end
  2.times do
    play :d4
    sleep 0.5
  end
  2.times do
    play :c4
    sleep 0.5
  end
end

define :mel_cec do
  2.times do
    play :c4
    sleep 0.5
  end
  2.times do
    play :e4
    sleep 0.5
  end
  2.times do
    play :c4
    sleep 0.5
  end
end


define :mel3 do
  2.times do
    play :a3
    sleep 0.5
  end
  mel_cec
end

define :mel4 do
  2.times do
    play :d4
    sleep 0.5
  end
  mel_cec
end


live_loop :melody1 do
  tick
  12.times do
    mel1 :a3
  end
  12.times do
    mel1 :c4
  end
  12.times do
    mel1 :d4
  end
  6.times do
    mel1 :e4
  end
  3.times do
    mel1 :d4
  end
  2.times do
    mel1 :c4
  end
  play :g3
  sleep 0.5
  
  ##| Second verse
  
  2.times do
    play :a3
    sleep 0.5
  end
  
  mel2
  
  sleep 0.5
  play :a3
  sleep 0.5
  
  mel2
  
  mel3
  
  mel4
  
  sleep 0.5
  play :a3
  sleep 0.5
  
  mel2
  
  sleep 0.5
  play :a3
  sleep 0.5
  
  mel2
  
  mel3
  
  mel4
  
end

live_loop :kick do
  with_fx :reverb do
    sample :drum_heavy_kick, amp: 1.5
    sleep 0.5
    sample :drum_heavy_kick, amp: 2
    sleep 3.5
  end
end
