use_bpm 120

###### Algorave 1 Bangalore Techno/D&B #####

live_loop :hollow do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 2
  sleep 3
end

live_loop :flibble, sync: :hollow do
  stop
  use_random_seed 12
  
  with_fx :lpf do
    sample :bd_haus, rate: 1, amp: 1
    sample :bass_thick_c, amp: 0.5, rate: 0.5
    sleep 0.5
  end
  
  ##| with_fx :ping_pong do
  ##|   sample :loop_mehackit2, amp: 0.8, beat_stretch: 0.5
  ##| end
  
  ##| sample :loop_3d_printer, amp: 0.3
  
  ##| with_fx :ping_pong do
  ##|   sample :hat_cats
  ##| end
  
  sleep 0.5
  
end

#### Section 1 ####


live_loop :acid_bass, sync: :flibble do
  stop
  with_fx :reverb, amp: 1, mix: 0.25 do
    use_synth :tb303
    nuotti = (chord :C2, :minor).choose
    play nuotti, cutoff: rrand(10, 130), release: 0.1, amp: 0.7, release: 0.1
    sleep 0.25
  end
end


sample1 = "/Users/sangarshanan/Downloads/samples/Songs/pvm_misc1.wav"
live_loop :sample1, sync: :flibble do
  stop
  with_fx :wobble do
    sample sample1, beat_stretch: 80, amp: 0.5, finish: 0.5
    sleep 40
  end
end


insur = "/Users/sangarshanan/Downloads/samples/vocal/noInsurance.wav"

live_loop :insur, sync: :flibble do
  stop
  
  2.times do
    4.times do
      sample insur, start: 0.009, finish: 0.01
      sleep 0.5
    end
    1.times do
      sample insur, start: 0.008, finish: 0.03
      sleep 2
    end
  end
  
  with_fx :flanger do
    sample insur, start: 0.009, finish: 0.05
    sleep 4
  end
  
  1.times do
    with_fx :bitcrusher do
      4.times do
        sample insur, start: 0.03, finish: 0.033
        sleep 0.5
      end
    end
    1.times do
      sample insur, start: 0.03, finish: 0.05
      sleep 2
    end
    with_fx :ping_pong do
      1.times do
        sample insur, start: 0.03, finish: 0.05
        sleep 4
      end
    end
  end
  
  sleep 32
end


pm = "/Users/sangarshanan/Downloads/samples/Melody/misc/turk.wav"
live_loop :melody, sync: :flibble do
  stop
  with_fx :reverb, amp: 2 do
    
    ##| 4.times do
    ##|   sample pm, beat_stretch: 32, amp: 2, start: 0.2, finish: 0.22
    ##|   sleep 1
    ##| end
    
    sample pm, beat_stretch: 32, amp: 2, finish: 0.2
    sleep 8
    
    sample pm, beat_stretch: 32, amp: 2, finish: 0.5
    sleep 16
    
  end
end

###### Section 2 #####

live_loop :density, sync: :flibble do
  ##| stop
  density 4 do
    4.times do
      play [:e4, :c5].choose, release: 0.1
      sleep 1
    end
  end
end


live_loop :deep_bass, sync: :flibble do
  stop
  use_synth :bass_foundation
  with_fx :ixi_techno, lpf: 70, amp: 1, amp_slide: 6 do |fx|
    control fx, amp: 1
    176.times do
      amps = (ring 1, 0.5, 0.5, 0.5, 0.75, 0.5, 0.5, 0.5)
      play :C2, attack: 0.05, release: 0.4, amp: amps.tick
      sleep 0.25
    end
  end
end

chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring
c = chords[0] #
live_loop :deep_bass2, sync: :flibble do
  ##| stop
  use_synth :gabberkick
  effect = [:slicer, :reverb, :ixi_techno, :ping_pong].choose
  with_fx effect, lpf: 70, amp: 0.2, amp_slide: 2 do |fx|
    control fx, amp: 1
    3.times do
      play c[0]
      sleep 1 # 0.25
    end
    play c[2]
    sleep 0.5
    play c[1]
    sleep 0.5
    c = chords.tick
  end
end

live_loop :techno, sync: :deep_bass2 do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/techno/1.wav"
  with_fx :band_eq do
    sample s, amp: 2
    sleep (sample_duration s)
  end
end


###### Section 3 #####

live_loop :snare, sync: :flibble do
  stop
  sample :sn_dolf, rate: -1
  sleep 4
end


vocal = "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav"
live_loop :vocal, sync: :flibble do
  stop
  with_fx :hpf do # :hpf
    
    sample vocal, beat_stretch: 90, start: 0.40, finish: 0.445, amp: 3
    sleep 1
    
    ##| sample vocal, beat_stretch: 100, start: 0.55, finish: 0.6, amp: 3
    ##| sleep 4
    
  end
end


live_loop :amen_break, sync: :flibble do
  stop
  a = rrand(0.50, 0.75)
  
  # 0.6
  if a < 0
    
    sample "/Users/sangarshanan/Downloads/samples/drum_loops/dnb/broken_amen.wav", finish: 0.5, beat_stretch: 16, rate: 0.5
    sleep 8
    
  else
    
    effect = [:slicer, :reverb, :ixi_techno].choose
    p = [0.25, 0.5, 0.125].choose
    with_fx effect, phase: p, wave: 0, mix: rrand(0.4, 1) do
      r = [1, 0.5].choose
      sample [:loop_amen, :loop_breakbeat].choose, beat_stretch: 2, rate: r , amp: 2
    end
    sleep 2
  end
end


sample2 = "/Users/sangarshanan/Downloads/samples/Songs/pvm_flow.wav"
live_loop :sample2, sync: :flibble do
  stop
  
  effect = [:reverb, :wobble, :ixi_techno].choose
  with_fx effect, amp: 0.8 do
    
    sample sample2, beat_stretch: 8, finish: 0.5
    sleep 8 # 4
    
    ##| 4.times do
    ##|   sample sample2, beat_stretch: 8, start: 0.5, finish: 0.55
    ##|   sleep 1
    ##| end
    
    ##| sample sample2, beat_stretch: 8, start: 0.5, finish: 0.74
    ##| sleep 2
    
    ##| 4.times do
    ##|   sample sample2, beat_stretch: 8, start: 0.65, finish: 0.74, rate: 1
    ##|   sleep 1
    ##| end

  end
end


###### Section 4 #####
###### Section 4 #####
###### Section 4 #####


live_loop :all_fine, sync: :flibble do
  stop
  effect = [:slicer, :ping_pong, :ixi_techno].choose
  with_fx effect do
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/take a chill pill.wav", amp: 0.8, beat_stretch: 3
    sleep 4
  end
end


bass2 = "/Users/sangarshanan/Downloads/samples/bass/techno1.wav"
live_loop :bassline2, sync: :flibble  do
  stop
  with_fx :reverb, mix: 0.5 do
    sample bass2, beat_stretch: 16, amp: 2
    sleep 16
  end
end


live_loop :keep_going, sync: :flibble do
  stop
  with_fx :wobble, mix: 0.5, amp: 1.5 do
    
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/you almost had me goin.wav", beat_stretch: 5, start: 0.2
    sleep 8
    
    2.times do
      sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/you almost had me goin.wav", start: 0.5, beat_stretch: 4
      sleep 2
    end
    
  end
end


live_loop :beat2, sync: :bassline2 do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/dubstep/1.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 1
    sleep 32
  end
end


ele = "/Users/sangarshanan/Downloads/samples/Melody/elec/128_C_Seq.wav"
live_loop :elec, sync: :flibble  do
  stop
  effect = [:krush, :wobble, :ixi_techno].choose
  p = [0.25, 0.5, 0.125].choose
  with_fx effect, phase: p, mix: rrand(0.4, 1) do
    
    sample ele, beat_stretch: 64, finish: 0.12
    sleep 8
    
    sample ele, beat_stretch: 64, start: 0.12, finish: 0.24
    sleep 8
    
    
    sample ele, beat_stretch: 64, start: 0.48, finish: 0.60
    sleep 8
    
    
    sample ele, beat_stretch: 64, start: 0.84, finish: 0.96
    sleep 8
    
  end
end
