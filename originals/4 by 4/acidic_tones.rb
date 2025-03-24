use_bpm 146
use_debug false

pm = "/Volumes/Roguentropy/Samples/Melody/misc/buildup1.wav"
live_loop :pm, sync: :sample do
  stop
  with_fx :compressor, mix: 0.5 do
    sample pm, beat_stretch: 32, amp: 0.6
    sleep 32
  end
  
end


perc1 = "/Volumes/Roguentropy/Samples/drum_loops/techno/kick.wav"
live_loop :techno_perc, sync: :pm  do
  stop
  with_fx :lpf do
    sample perc1, beat_stretch: 8, amp: 1.2
    sleep 8
  end
end


live_loop :hihat, sync: :bass do
  ##| stop
  with_fx :gverb, dry: 1, release: 0.25, amp: 2.5 do
    sample :hat_yosh, rate: 12, cutoff: 80
    sleep 0.5
    sample :hat_yosh, rate: 2, cutoff: 100
    sleep 0.5
    sample :hat_yosh, rate: 12, cutoff: 90
    sleep 0.5
    sample :hat_yosh, rate: 2, cutoff: 100
    sleep 0.5
  end
end

live_loop :slow_break, sync: :bass do
  stop
  jungle =  "/Volumes/Roguentropy/samples/drum_loops/dnb/jungle.wav"
  with_fx :compressor do
    sample jungle, beat_stretch: [8, 8, 8].choose
    sleep 8
  end
end


live_loop :bass do
  ##| stop
  sleep 0.5
  with_synth :fm do
    play [:d2, :c2, :f2].choose,
      amp: 1,
      attack: 0.15,
      decay: 0.125,
      sustain: 0.1,
      release: 0.1,
      depth: 0.5,
      pitch: 4,
      cutoff: 100
  end
  sleep 0.5
end


ac = "/Volumes/roguentropy/samples/Melody/elec/acid1.wav"
live_loop :acid1, sync: :pm do
  stop
  
  with_fx :reverb do
    sample ac, beat_stretch: 16, amp: 5, pitch: 1
    sleep 16
  end
  
end


carnatic_s = "/Volumes/roguentropy/samples/indian/HAMSADWANI.wav"
live_loop :sample, sync: :bass do
  ##| stop
  
  with_fx :reverb, amp: 1 do
    
    a=2
    2.times do #
      sample carnatic_s, onset: a, amp: 0.8, beat_stretch: 60
      sleep 2 # 0.5, 2
      a+=1
    end
    
    ##| 1.times do
    ##|   with_fx :band_eq do
    ##|     a = 2 # 2, 8
    ##|     128.times do # 8, 32, 2
    ##|       sample carnatic_s, onset: a, amp: 0.8, beat_stretch: 60
    ##|       sleep 0.5 # 0.5, 2
    ##|       a+=1
    ##|     end
    ##|   end
    ##| end
    
    
    ##| a=70
    ##| 16.times do #
    ##|   sample carnatic_s, onset: a, amp: 0.8, beat_stretch: 60
    ##|   sleep 0.5 # 0.5, 2
    ##|   a+=1
    ##| end
    
    ##| a=40
    ##| 16.times do #
    ##|   sample carnatic_s, onset: a, amp: 0.8, beat_stretch: 60
    ##|   sleep 0.5 # 0.5, 2
    ##|   a+=1
    ##| end
    
    
  end
  
end
