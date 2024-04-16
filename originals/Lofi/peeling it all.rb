set_volume! 2
use_bpm 120

vocal = "/Users/sangarshanan/Downloads/samples/melody/Lofi/voi1.wav"
live_loop :voi  do
  ##| stop
  with_fx :reverb, amp: 1.5 do
    
    sample vocal, beat_stretch: 32, start: 0.5, finish: 0.88
    sleep 12
    
    with_fx :slicer do # :slicer :tremolo
      2.times do
        sample vocal, beat_stretch: 32, start: 0.92, rate: -1, amp: 2
        sleep 2
      end
    end
    
    
    3.times do
      sample vocal, beat_stretch: 32, start: 0.8, finish: 0.85
      sleep 1.5
    end
    
    2.times do
      sample vocal, beat_stretch: 32, start: 0.94
      sleep 1.5
    end
    
    sleep 0.5
    
  end
end


drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/BoomBap/loop_75bpm.wav"
live_loop :drumloop1, sync: :voi do
  ##| stop
  with_fx :reverb do
    sample drum_loop1, amp: 2, beat_stretch: 16, finish: 0.5
    sleep 8
  end
end

live_loop :bass do
  ##| stop
  with_fx :slicer do
    tick(:iii)
    synth :bass_highend, note: ring(64,67,62,62,62).look(:iii)-24, sustain: knit(2,3,1,2).look(:iii), amp: 0.1
    2.times do
      tick(:i)
      gg = ring(0.25,0.5)
      synth :bass_foundation, note: knit(64,2,62,2,60,2,59,2,62,2).look(:i)-24, release: gg.look(:i), amp: 2
      sleep 0.25
    end
    tick(:ii)
    sleep knit(1.5,3,0.5,2).look(:ii)
  end
end
