set_volume! 2
use_bpm 110

tt1 = ring(
  0.5, 0.75, 0.75, 0.5,
  0.75, 0.75, 0.5, 0.75,
  0.75, 0.5, 0.75, 0.75
)
use_synth :piano
use_synth_defaults attack: 0.1, release: 0.5, sustain: 0.2

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

with_fx :flanger, mix: 0.1, amp: 1.5 do
  with_fx :lpf, cutoff: 100 do
    use_synth_defaults attack: 0.1, release: 0.5
    in_thread do
      
      2.times do
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
      end
    end
  end
end

in_thread do
  # chords
  use_synth :bass_foundation
  use_synth_defaults cutoff: 70, release: 0.8, attack: 0.2
  
  sleep 4
  
  4.times do
    play [:f2, :f3], sustain: 4
    sleep 4
    play [:a2, :a3], sustain: 8
    sleep 4
  end
  
  sleep 3.5
  use_synth :pluck
  use_synth_defaults amp: 2, release: 0.8
  with_fx :flanger, mix: 0.1, amp: 1.5, sustain: 1 do
    with_fx :lpf, cutoff: 100 do
      
      2.times do
        2.times do
          play [:f3, :f2]
          sleep 0.5
          play [:f3, :f2], sustain: 1
          sleep 3.5
        end
        
        1.times do
          play [:a3, :a2]
          sleep 0.5
          play [:a3, :a2], sustain: 1
          sleep 3.5
        end
      end
    end
  end
end


sleep 32
in_thread do
  x = 1
  9.times do
    with_fx :reverb do
      sample :drum_heavy_kick, amp: 1.5
      sleep 0.5
      sample :drum_heavy_kick, amp: 2
      puts x
      if  x == 1
        sleep 3
      else
        sleep 3.5
      end
    end
    x +=1
  end
end


sleep 32
with_fx :flanger, mix: 0.1, amp: 1.5, sustain: 1 do
  with_fx :lpf, cutoff: 100 do
    
    live_loop :mel2 do
      ##| stop
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
  end
end

grid1 = [1,0,1,0,   2,0,0,1,   1,0,1,0,   2,0,0,0]
grid2 = [1,0,1,0,   2,0,0,1,   0,0,0,0,   2,1,2,0]

define :drum do |grid|
  16.times do |index|
    puts index, grid[index]
    sample :drum_heavy_kick, amp: 2 if grid[index] == 1
    sample :sn_dolf, amp: 1.5 if grid[index] == 2
    sleep 0.25
  end
end

live_loop :drum1 do
  drum grid1
  drum grid2
end

live_loop :hi_hat do
  sample :drum_cymbal_closed
  sleep 0.5
end
