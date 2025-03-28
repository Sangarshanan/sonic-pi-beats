use_bpm 120

dis = "/Volumes/Roguentropy/Samples/drum_loops/trap/savag.wav"
vocal1 = "/Volumes/Roguentropy/Samples/vocal/modi_ai.mp3"
vocal2 = "/Volumes/Roguentropy/Samples/vocal/ai.mp3"


live_loop :drum_loop, delay: 15 do
  ##| stop
  with_fx :reverb do # :reverb :compressor
    sample dis, beat_stretch: 45, amp: 2.5
    sleep 45
  end
end


live_loop :vocal1 do
  ##| stop
  
  with_fx :reverb, amp: 2 do # :reverb :hpf
  sample vocal1, finish: 0.18, beat_stretch: 90
  sleep 15
  end
  
  with_fx :reverb, amp: 2 do # :reverb :hpf
  sample vocal1, start: 0.55, finish: 0.65, beat_stretch: 90
  sleep 7.5
  end
  
  with_fx :reverb, amp: 2 do # :reverb :hpf
  sample vocal1, start: 0.65, finish: 0.65, beat_stretch: 90
  sleep 7.5
  end
  
  
  with_fx :reverb, amp: 2 do # :reverb :hpf
  sample vocal1, start: 0.64, finish: 0.74, beat_stretch: 90
  sleep 7.5
  end
  
  with_fx :reverb, amp: 2 do # :reverb :hpf
  sample vocal2
  sleep 11.3
  end
  
  
  40.times do
    nn = "/Volumes/Roguentropy/samples/Hiphop-Samples/67ft_nn.wav"
    with_fx :hpf do
      sample nn, beat_stretch: 5.6, amp: 3.5
    end
    sleep 5.6
  end
  
end



jazz = "/Volumes/Roguentropy/samples/Hiphop-Samples/trap-sax.wav"
live_loop :jazz do
  ##| stop
  with_fx :panslicer, mix: 0.4 do
    with_fx :reverb, amp: 2, mix: 0.4 do
      
      sample jazz, beat_stretch: 45, rate: -1, finish: 0.5
      sleep 22.5
      
      sample jazz, beat_stretch: 45, start: 0.5, rate: -1
      sleep 22.5
      
    end
  end
end
