use_bpm 120

## Live Audio ##
# https://in-thread.sonic-pi.net/t/connecting-an-instrument-into-sonic-pi-live-audio/698/14
with_fx :band_eq do
  live_audio :guitar
end
## Live Audio ##



define :snare do
  at [0, 1, 2, 3],
  [{:amp=>0.3}, {:amp=> 1}, {:amp=>1}] do |p|
    sample :drum_cymbal_pedal, p
  end
end

define :melodia1 do
  use_synth :blade
  t_dur = 0
  use_random_seed 2017
  while t_dur < 8 do
    dur=[0.50,1].choose
    play [58, 61, 63, 65, 68, 70, :r].choose,release: dur, amp: 2
    sleep dur
    t_dur +=dur
  end
end

define :melodia2 do
  use_synth :tb303
  t_dur = 0
  use_random_seed 1000
  while t_dur < 8 do
    dur=[0.50,1].choose
    play [ 61, 63, 65, 68, 70,73,:r].choose,release: dur, amp: 2
    sleep dur
    t_dur +=dur
  end
end


acordes=[:bb3,:eb4,:bb3,:bb3,:eb4,:e4,:bb3,:g4,:c4,:f4,:d4,:f4]
tipo=['7','7','7','7','7','diminished7','7','m7','7','7','m7','7']

live_loop :jazzblues do
  for i in (range 0,12)
    use_synth :pluck
    play acordes[i]-12,cutoff: 80,release: 3.5, amp: 2
    4.times do
    use_synth :prophet
    play (chord acordes[i],tipo[i],release: 3.5), amp: 2
    sleep 1
  end
end
end

live_loop :melodia do
  for i in (range 0,2)
    for ii in (range 0,6)
      melodia1
    end
  end
  for ii in (range 0,6)
    melodia2
  end
end


live_loop :low_boom do
  sample :bd_boom, rate: 0.75, amp: 3
  sleep [7,1,8].ring.tick
end

live_loop :do_snare do
  sync :low_boom
  snare
  sleep 1
end

live_loop :chords do
  use_synth :piano
  with_fx :reverb, room: 0.8, mix: 0.6 do
    play chord(:c4,:major) , sustain: 8, amp: 2
    sleep 8
    play chord(:e4,:major), amp: 2
    sleep 8
  end
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks02.wav"

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

brs = "/Users/sangarshanan/Downloads/samples/Melody/brass/trumpet2.wav"
live_loop :sax_loop2, sync: :chords do
  stop
  with_fx :reverb do
    sample brs, amp: 5, beat_stretch: 32
    sleep 32
  end
end

saz = "/Users/sangarshanan/Downloads/samples/vocal/gospel-choir.wav"
live_loop :sz_loop, sync: :chords do
  ##| stop
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



sx = "/Users/sangarshanan/Downloads/samples/Melody/jazz/sax2.wav"
live_loop :sax_loop, sync: :chords do
  stop
  with_fx :reverb do
    sample sx, amp: 4, beat_stretch: 64
    sleep 64
  end
end


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

live_loop :mar, sync: :chords do
  stop
  with_fx :reverb, mix: 0 do
    sample mar, amp: rrand(1.2, 1.7), pan: rrand(-0.25, 0.25)
  end
  sleep 1
end


live_loop :house_loop, sync: :chords do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/house/1.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 2
    sleep 32
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


pm = "/Users/sangarshanan/Downloads/samples/Melody/jazz/piano-solo-1.wav"
live_loop :piano, sync: :chords do
  stop
  with_fx :reverb do
    sample pm, amp: 4, beat_stretch: 64
    sleep 128
  end
end

