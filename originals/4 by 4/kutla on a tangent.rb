use_bpm 150


with_fx :reverb do
  
  live_loop :mel1, sync: :drum do |idx|
    stop
    use_synth :piano
    # [39493, 12435, 56593, 29493, 420690, 282812]
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
        with_fx :reverb, mix: 0.65, room: 0.85, amp: 2 do
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
    sample bass1, beat_stretch: 16, amp: 2
    sleep 16
  end
  
  synth1 = "/Users/sangarshanan/Downloads/samples/apple/Chill/Rising Chords Guitar.wav"
  live_loop :synth1, sync: :drum do
    stop
    with_fx :slicer, mix: 0.5, amp: 1 do
      sample synth1, beat_stretch: 16
      sleep 16
    end
  end
  
  flute = "/Users/sangarshanan/Downloads/samples/Indian/flute2.wav"
  live_loop :flute1   do
    ##| stop
    
    ##| sample flute, start: 0.04, finish: 0.65, beat_stretch: 80, amp: 2
    ##| sleep 45
    
    with_fx :slicer, mix: 0.5 do
    sample flute, start: 0.42, finish: 0.47, beat_stretch: 80, amp: 0.9
    sleep 4
    sample flute, start: 0.48, finish: 0.53, beat_stretch: 80, amp: 1
    sleep 4
    sample flute, start: 0.54, finish: 0.65, beat_stretch: 80, amp: 1
    sleep 4
    end
    
  end
  
  
  ## DRUM MACHINE
  
  live_loop :bass, sync: :flute1 do
    ##| stop
    use_synth :saw
    use_synth_defaults release: 0.25, cutoff: [60,80,100].look
    play :e1
    play :e1+0.25, amp: 1.5, pan: rdist(0.25)
    play :e1+0.25+12, amp: 1.5, pan: rdist(0.5)
    sleep 0.25
  end
  
  snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare01.wav"
  clap = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap03.wav"
  mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"
  
  grid1= [
    1,0,0,0, # 0
    1,0,0,0, # 4
    
    1,0,0,0, # 8
    1,0,0,0, # 12
    
    1,0,0,0, # 16
    1,0,0,0, # 20
    
    1,0,0,0, # 24
    1,0,0,0, # 28
  ]
  
  
  live_loop :drum, sync: :flute1 do
    stop
    32.times do |index|
      puts index, grid1[index]
      
      with_swing 0.08 do
        
        # Kick
        sample :bd_tek, amp: 0.5 if grid1[index] == 1
        sample :bd_tek, pan: rdist(0.25) if grid1[index] == 1
        
        # Snare
        sample snare, amp: 1 if [4, 12, 20, 28].include? index
        sample clap, amp: 1 if [4, 12, 20, 28].include? index
        
      end
      
      sleep 0.25 # Snare
      
      ##| sleep 0.125 # Kick 0.0625 0.125
    end
  end
  
  # Hi hat
  live_loop :mar, sync: :drum do
    stop
    32.times do |index|
      if (index-1) % 4 == 0
        puts index
        sample mar, amp: 0.1, release: 0.001
        sleep 0.05
        sample mar, amp: 0.4
        sleep 0.45
      else
        sample mar, amp: 0.4
        sleep 0.5
      end
    end
  end
  
  live_loop :amen, sync: :drum do
    stop
    sample :loop_amen, beat_stretch: 4
    sleep 4
  end
  
  def hat(v)
    sample :drum_cymbal_closed, amp: 2*v, attack: 0, decay: 0.01, sustain: 0, release: 0
  end
  
  # Trap hat
  live_loop :trap_hats, sync: :drum do
    stop
    a = [0,0,0,1,1,2,2,2,2].choose
    case a
    when 0
      8.times do
        hat(1)
        sleep 0.5
      end
    when 1
      8.times do
        hat(1)
        sleep 0.25
      end
    when 2
      2.times do
        hat(1)
        sleep 0.3
        hat(1)
        sleep 0.3
        hat(1)
        sleep 0.4
      end
    end
  end
end
