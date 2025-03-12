use_bpm 120

set_volume! 2

kick_play = 0

hat_close_play = 0
hat_open_play = 1
snare_play = 1

bass_play = 0
sample_play = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.5 do
  live_loop :kick, sync: :met do
    if kick_play < 1 then stop end
    use_sample_defaults rate: 1, amp: 1.2, lpf: 100
    
    ##| sample_loop = "/Volumes/Roguentropy/Samples/lofi/voiceover/hit it.wav"
    ##| sample sample_loop, amp: 4
    ##| sleep 8
    
    10.times do
      
      with_fx :reverb do # :reverb :bpf
        
        7.times do
          sample :bd_tek, pan: rdist(0.25)
          sleep 1
        end
        
        sample :bd_klub
        sleep 0.5
        
        sample :bd_klub
        sleep 0.5
      end
    end
    
  end
  
  live_loop :hat1, sync: :met do
    if hat_close_play < 1 then stop end
    
    a = 0.2
    use_sample_defaults rate: 1.8, lpf: 130, attack: 0.01, amp: a
    
    2.times do
      sample :drum_cymbal_closed, amp: a
      sleep 0.25
    end
    sample :drum_cymbal_closed, amp: 1
    sleep 0.25
    sample :drum_cymbal_closed, amp: a
    sleep 0.25
  end
  
  live_loop :cymbal_open, sync: :met do
    if hat_open_play < 1 then stop end
    
    6.times do
      sleep 0.5
      sample :drum_cymbal_open, amp: 0.3, beat_stretch: 1.7, finish: 0.16, rate: 1.2
      sleep 0.5
    end
    
    sleep 0.5
    2.times do
      sample :drum_cymbal_open, amp: 0.3, beat_stretch: 1.7, finish: 0.16, rate: 1.2
      sleep 0.25
    end
    
  end
  
  live_loop :snare_loop, sync: :met do
    
    if snare_play < 1 then stop end
    
    use_sample_defaults amp: 0.7, cutoff: 100, beat_stretch: 0.18
    
    sleep 1
    
    sample :sn_generic, rate: 3.5
    sample :sn_generic, start: 0.02, pan: 0.2
    
    sleep 1
  end
  
  
end



# bass ##################

live_loop :bass, sync: :met do
  if bass_play < 1 then stop end
  use_synth_defaults release: 0.1, sustain: 0.125, amp: 0.4
  
  ##| n = :c2
  ##| s = [:sine].choose
  
  n = :g1
  s = [:blade, :bass_foundation].choose
  
  with_fx :wobble, mix: 0.5 do
    
    synth s, note: n
    sleep 0.375
    synth s, note: n
    sleep 0.125
    synth s, note: n
    sleep 0.25
    synth s, note: n
    sleep 0.25
    synth s, note: n
    sleep 0.25
    synth s, note: n
    sleep 0.25
    synth s, note: n
    sleep 0.25
    synth s, note: n if [false, true].tick
    sleep 0.25
  end
end

carnatic_vocal = "/volumes/roguentropy/samples/indian/carnatic-vocal.wav"
live_loop :sample, sync: :met do
  if sample_play < 1 then stop end
  
  2.times do
    with_fx :reverb do
      a = 8 # 8 10 20
      8.times do
        sample carnatic_vocal, onset: a, amp: 0.9, beat_stretch: 11
        sleep 0.5
        a+=1
      end
    end
  end
end
