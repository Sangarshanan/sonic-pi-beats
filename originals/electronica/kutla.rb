use_bpm 150

with_fx :reverb do
  
  live_loop :mel1 do |idx|
    ##| stop
    use_synth :piano
    # [39493, 29493, 12435, 56593]
    seeds = [29493].ring
    with_random_seed seeds[idx] do
      notes = scale(:a3, :harmonic_minor, num_octaves: dice(2)).pick(4)
      multi = [0.5,1,1.5,2].choose
      cut = range(50, 130, step: 2.5).mirror.ring
      slp = [1,1.5,0.5,1].ring
      
      if multi == 0.5 || multi == 1 then
        reps = 16
      else
        reps = 8
      end
      
      with_fx :echo, mix: 0.4, phase: 2, max_phase: 4 do
        with_fx :reverb, mix: 0.65, room: 0.85 do
          reps.times do
            play notes.tick, amp: rdist(0.09, 0.7),
              cutoff: rdist(15, 115), pitch: rdist(0.1, 0)
            sleep slp.look*multi
          end
        end
      end
      
      if one_in(3) then
        sleep 5
      end
      
      idx+=1
    end
  end
  
  bass1 = "/Users/sangarshanan/Downloads/samples/apple/Chill/VHS Sunset Bass.wav"
  live_loop :bass1, sync: :drum do
    stop
    sample bass1, beat_stretch: 16
    sleep 16
  end
  
  synth1 = "/Users/sangarshanan/Downloads/samples/apple/Chill/Rising Chords Guitar.wav"
  live_loop :synth1, sync: :drum do
    stop
    with_fx :slicer, mix: 0.5, amp: 0.5 do
      sample synth1, beat_stretch: 16
      sleep 16
    end
  end
  
  snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare36.wav"
  mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"
  
  grid1= [
    1,0,0,0,
    2,0,0,0,
    
    1,0,0,0,
    2,0,0,0,
    
    1,0,0,0,
    2,0,0,0,
    
    1,0,0,0,
    2,0,0,0,
  ]
  
  
  live_loop :drum, sync: :mel1 do
    ##| stop
    32.times do |index|
      puts index, grid1[index]
      
      sample :bd_tek, amp: 1.5 if grid1[index] == 1
      sample :bd_tek, pan: rdist(0.25) if grid1[index] == 1
      
      ##| sample snare if grid1[index] == 2
      
      sleep 0.125
    end
  end
  
  live_loop :hi_hat, sync: :drum do
    stop
    sample mar, amp: 0.5
    sleep 0.5
  end
  
  # BASSLINE
  live_loop :bass, sync: :mel1 do
    ##| stop
    use_synth :saw
    use_synth_defaults release: 0.25, cutoff: [60,80,100].look
    play :e1
    play :e1+0.25, amp: 1.5, pan: rdist(0.25)
    play :e1+0.25+12, amp: 1.5, pan: rdist(0.5)
    sleep 0.25
  end
  
end
