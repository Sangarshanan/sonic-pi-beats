# Alright DEMUCS BASS

use_bpm 120

elevator_music = "/Volumes/Roguentropy/set-dosa/circus-set/sample_elevator.wav"

live_loop :elevator do
  ##| stop
  
  with_fx :compressor do
    with_fx :reverb do
      
      ##| sample elevator_music, beat_stretch: 64, amp: 5
      ##| sleep 64
      
      with_fx :hpf, mix: 0.7 do
        
        sample elevator_music, beat_stretch: 64, start: 0.01, finish: 0.1, amp: 12
        sleep 8
        
        ##| sample elevator_music, beat_stretch: 64, start: 0.115, finish: 0.2, amp: 12
        ##| sleep 4
        
        ##| sample elevator_music, beat_stretch: 64, start: 0.2, finish: 0.35, amp: 10, rate: -1
        ##| sleep 8
        
      end
      
      
    end
    
    
  end
end

drums1 = "/Volumes/Roguentropy/set-dosa/circus-set/alright_drums1.wav"

live_loop :drums1  do
  ##| stop
  
  with_fx :lpf, mix: 0.4 do
    with_fx :compressor, mix: 0.8 do
      sample drums1, beat_stretch: 16
      sleep 16
    end
  end
  
end


other = "/Volumes/Roguentropy/set-dosa/circus-set/separated/htdemucs/alright/other.wav"
live_loop :other  do
  ##| stop
  with_fx :reverb, mix: 0.4 do
    with_fx :compressor, mix: 0.8 do
      sample other
      sleep sample_duration other
    end
  end
end


vocals = "/Volumes/Roguentropy/set-dosa/circus-set/vocal_alright.wav"
live_loop :vocals  do
  ##| stop
  with_fx :band_eq, mix: 0.4  do
    with_fx :compressor, mix: 0.8 do
      sample vocals
      sleep sample_duration vocals
    end
  end
end

full_drums = "/Volumes/Roguentropy/set-dosa/circus-set/separated/htdemucs/alright/drums.wav"
live_loop :full_drums  do
  ##| stop
  with_fx :reverb, mix: 0.4 do
    with_fx :compressor, mix: 0.8 do
      sample full_drums
      sleep sample_duration vocals
    end
  end
end
