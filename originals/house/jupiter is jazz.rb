set_volume! 1.5

use_bpm 220

pm = "/Users/sangarshanan/Downloads/samples/Melody/jazz/piano3.wav"
live_loop :piano, sync: :drums do
  ##| stop
  with_fx :reverb do
    sample pm, amp: 4, beat_stretch: 128
    sleep 128
  end
end

sx = "/Users/sangarshanan/Downloads/samples/Melody/jazz/sax2.wav"
live_loop :sax_loop, sync: :piano do
  stop
  with_fx :reverb do
    sample sx, amp: 4, beat_stretch: 64
    sleep 64
  end
end

brs = "/Users/sangarshanan/Downloads/samples/Melody/brass/trumpet2.wav"
live_loop :brs_loop, sync: :sax_loop do
  stop
  with_fx :reverb do
    sample brs, amp: 5, beat_stretch: 32
    sleep 32
  end
end


saz = "/Users/sangarshanan/Downloads/samples/vocal/gospel-choir.wav"
live_loop :sz_loop, sync: :drums do
  stop
  use_random_seed 10
  with_fx :reverb, mix: 0.5 do
    
    
    sample saz, start: 0.5, finish: 0.6
    sleep 4
    
    sample saz, start: 0.2, finish: 0.3
    sleep 4
    
    
    
    [1,2].choose.times do
      
      sample saz, start: 0.5, finish: 0.6
      sleep 4
      
      sample saz, finish: 0.1
      sleep 4
    end
    
    sample saz, start: 0.5, finish: 0.6
    sleep 4
    
    
    [2,3].choose.times do
      
      sample saz, finish: 0.1
      sleep 4
      
      sample saz, start: 0.2, finish: 0.3
      sleep 4
    end
    
  end
end

live_loop :fromMidiDevice do
  use_real_time
  n, vel = sync "/midi*/note_on"
  synth :piano, note: n, amp: 2, sustain: vel if vel > 0
end

live_loop :note, sync: :chords do
  ##| stop
  use_synth :piano
  play 72, sustain: 8, amp: 0.5
  sleep 4
end

live_loop :chords do
  use_synth :piano
  with_fx :reverb, room: 0.8, mix: 0.6 do
    play [:c3, :e3, :f3, :a3], sustain: 8, amp: 2
    sleep 8
    play [:ds3, :g3, :a3, :d4], sustain: 8, amp: 2
    sleep 8
  end
end


live_loop :d_lop, sync: :chords do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/techno/2.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 64, amp: 3
    sleep 64
  end
end

live_loop :house_loop, sync: :chords do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/house/1.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 3
    sleep 32
  end
end

# FUNKY DRUMS
ghost = -> { rrand(0.1, 0.2) }
normal = -> { rrand(0.5, 0.6) }
accent = -> { rrand(0.8, 0.9) }

swing_time = 0.1
puts swing_time

define :play_kick do
  sample :elec_hollow_kick, amp: 2
  play :A1, amp: normal.call
end

define :play_charles do
  sample :drum_cymbal_pedal, attack:0.02, amp:normal.call, rate:1.1
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks02.wav"

live_loop :drums, sync: :chords do
  ##| stop
  
  with_fx :reverb, amp: 2 do
    # Two ways of modelling beats - with 0s and 1s OR with indexes
    [1, 0, 0, 0, 1, 0, 0, 0].each.with_index(1) do |kick, index|
      play_kick if kick == 1 and one_in(3)
      
      if index == 5
        play_charles
      end
      
      if [1,3,4,5,7,8].include? index
        # Rand here can be really nice
        sample :drum_cymbal_soft, amp: ((index == 3 or index == 7) ? accent.call*1.5 : normal.call ) #if rand < 0.8
      end
      
      
      # snare on 2 and 4
      if index == 5
        if one_in(4)
          sample :drum_snare_hard, amp: normal.call*0.8, pan: 0.4
        end
      end
      
      
      # And sometimes on the and of 4
      if (index % 2) == 0
        sample :drum_snare_soft, amp: normal.call if rand < 0.05
      end
      
      
      if(index % 2) == 0
        # offbeats need to be slightly late for swing
        sleep (0.5 - swing_time)
      else
        sleep (0.5 + swing_time)
      end
    end
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :mar, sync: :house_loop do
  ##| stop
  with_fx :reverb, mix: 0 do
    sample mar, amp: rrand(1.2, 1.7), pan: rrand(-0.25, 0.25)
  end
  sleep 1
end

