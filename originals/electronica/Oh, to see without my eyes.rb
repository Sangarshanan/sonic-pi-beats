use_bpm 220

vocal = "/Users/sangarshanan/Downloads/samples/songs/mol1.wav"

live_loop :vocal_dandb do
  ##| stop
  with_fx :reverb, amp: 5 do
    
    sample vocal, beat_stretch: 33, finish: 0.5, amp: 1.5
    sleep 15.5
    
    sample vocal, beat_stretch: 33, onset: 6, amp: 1.5
    sleep 0.5
    
  end
end


live_loop :amen_break do
  ##| stop
  with_fx :reverb, amp: 1 do
    2.times do
      3.times do
        sample :loop_amen, beat_stretch: 4
        sleep 4
      end
      sample :loop_amen_full, beat_stretch: 16, start: 0.75
      sleep 4
    end
  end
end


live_loop :vocal2, sync: :vocal_dandb do
  stop
  with_fx :ping_pong, amp: 5 do
    
    sample vocal, beat_stretch: 33, finish: 0.5
    sleep 16
    
    sample vocal, beat_stretch: 33, finish: 0.5, rate: -1
    sleep 16
    
    use_random_seed 1234
    16.times do
      sample vocal, beat_stretch: 33, onset: rrand(5,50), amp: 1.5
      sleep 1
    end
    
    sample vocal, beat_stretch: 33, start: 0.5, rate: -1
    sleep 16
    
  end
end


live_loop :house_loop, sync: :vocal2  do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/trap/6.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 64, amp: 0.7
    sleep 64
  end
end

