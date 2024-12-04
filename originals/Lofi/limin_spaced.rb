use_bpm 120

sol="/Volumes/Roguentropy/Samples/drum_loops/lofi/cymatics/Full Drum Loops/Loop10-85 BPM.wav"
live_loop :sol_beat do
  ##| stop
  with_fx :reverb do # :reverb :lpf
    sample sol, beat_stretch: 11, amp: 1.5
    sleep 11
  end
end

other_1 = "/Volumes/Roguentropy/set-dosa/circus-set/space_1.wav"
live_loop :other_1, sync: :sol_beat do
  ##| stop
  
  with_fx :reverb, amp: 3 do
    
    # Part 1
    
    sample other_1, beat_stretch: 44, finish: 0.14 # LONG
    sleep 5.5
    
    ##| with_fx :compressor do
    ##|   sample other_1, beat_stretch: 22, finish: 0.24
    ##|   sleep 5.5
    ##| end
    
    ##| Part 2
    
    ##| sample other_1, beat_stretch: 44, start: 0.24, finish: 0.49
    ##| sleep 11
    
    ##| with_fx :compressor do
    ##|   sample other_1, beat_stretch: 22, start: 0.24, finish: 0.49
    ##|   sleep 5.5
    ##| end
    
    # Part 3
    
    ##| with_fx :compressor do
    ##|   sample other_1, beat_stretch: 22, start: 0.49, finish: 0.747
    ##|   sleep 5.5
    ##| end
    
    ##| sample other_1, beat_stretch: 22, start: 0.7
    ##| sleep 5.5
    
  end
  
end

start = "/Volumes/Roguentropy/Samples/Songs/pvm_0.wav"
live_loop :ss, sync: :sol_beat do
  ##| stop
  
  with_fx :hpf, mix: 0.9 do # :ixi_techno
    sample start, start: 0.05, beat_stretch: 11, amp: 2
    sleep 11
  end
  
end

live_loop :synth2, sync: :ss do
  ##| stop
  
  use_synth_defaults release: 2, amp: 1.5, attack: 0.05
  use_synth :prophet # :tb303 :prophet :dsaw :noise :rodeo
  
  with_fx :reverb, cutoff: 90 do # :flanger :lpf :slicer
    
    ##| play chord(:eb, :minor), release: 5 #.choose # :eb, :cb
    ##| sleep 5.5  # 5.5
    
    ##| play chord(:ab, :minor), release: 2 #.choose # :eb, :cb
    ##| sleep 2.75 # 5.5
    
    ##| play chord(:fs, :major), release: 2 #.choose # :eb, :cb
    ##| play chord(:cb, :minor7), release: 1 # .choose # :eb, :cb
    ##| sleep 2.75 # 5.5
    
    # Chord
    
    ##| play chord(:eb, :major), release: 11 # cb
    ##| sleep 11
    
    ##| play chord(:eb, :major7), release: 1 # cb
    ##| sleep 1.375
    
  end
end


## Trap part

trap_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/Trap/loop4.wav"
live_loop :trap_loop1, sync: :ss  do
  stop
  with_fx :hpf do #  :bpf :hpf
    with_fx :reverb do
      sample trap_loop1, beat_stretch: 22, finish: 0.5, amp: 1.5 # 11
      sleep 11 # 5.5
    end
  end
end


aaj_ka = "/Volumes/Roguentropy/Samples/songs/aaj_ka.wav"
live_loop :aaj_ka2, sync: :ss  do
  stop
  
  ##| sample aaj_ka, beat_stretch: 11, amp: 10, finish: 0.2
  ##| sleep 11
  
  ##| sample aaj_ka, beat_stretch: 11, amp: 20, start: 0.23, finish: 0.44
  ##| sleep 5.5
  
  ##| sample aaj_ka, beat_stretch: 11, amp: 20, start: 0.42, finish: 0.7
  ##| sleep 5.5
  
  2.times do
    sample aaj_ka, beat_stretch: 11, amp: 20, start: 0.71
    sleep 11
  end
  
  ##| use_random_seed 1225 # change to 1234 1220 1225
  ##| 6.times do
  ##|   sample aaj_ka, beat_stretch: 8, onset: rrand(5,100), amp: 20
  ##|   sleep 1.375
  ##| end
  
end


sample = '/Volumes/Roguentropy/Samples/crate1/Sample 04.wav'
live_loop :sample2, sync: :ss   do
  ##| stop
  with_fx :level do
    sleep 11
    sample sample, beat_stretch: 33, start: 0.8, finish: 0.85, amp: 1.2
  end
end
