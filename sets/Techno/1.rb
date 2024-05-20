use_bpm 120

define :drum_pattern do |pattern|
  v = pattern.tick(:pattern)
  puts v
  if v == "x"
    return sample :bd_haus, cutoff: 80, amp: 2
  elsif v == "o"
    return sample :sn_dolf, amp: 0.5
  elsif v == "-"
    return sample :drum_cymbal_pedal, amp: 0.5
  end
end

live_loop :bass_drum do
  drum_pattern "x"
  sleep 1
end

live_loop :snare, sync: :bass_drum do
  stop
  drum_pattern "  o "
  sleep 0.5
end

live_loop :hat, sync: :snare do
  stop
  drum_pattern "-"
  sleep 0.5
end

#### Section 1 ####

live_loop :acid_bass, sync: :bass_drum do
  stop
  with_fx :reverb, amp: 1, mix: 0.25 do
    use_synth :tb303
    nuotti = (chord :C2, :minor).choose
    play nuotti, cutoff: rrand(10, 130), release: 0.1, amp: 0.7, release: 0.1
    sleep 0.25
  end
end


sample1 = "/Users/sangarshanan/Downloads/samples/Songs/pvm_misc1.wav"
live_loop :sample1, sync: :bass_drum do
  stop
  with_fx :wobble do
    sample sample1, beat_stretch: 80, amp: 0.5, finish: 0.5
    sleep 40
  end
end

sample2 = "/Users/sangarshanan/Downloads/samples/Songs/pvm_flow.wav"
live_loop :sample2, sync: :bass_drum do
  stop
  with_fx :krush, mix: 0.2 do
    with_fx :wobble, amp: 0.5, mix: 0.8 do
      
      sample sample2, beat_stretch: 8, amp: 1, finish: 0.5
      sleep 8
      
      sample sample2, beat_stretch: 8, start: 0.5, finish: 0.77
      sleep 4
      
      2.times do
        sample sample2, beat_stretch: 8, start: 0.8
        sleep 2
      end
      
    end
  end
end


pm = "/Users/sangarshanan/Downloads/samples/Melody/misc/turk.wav"
live_loop :melody, sync: :bass_drum do
  stop
  with_fx :reverb do
    
    
    ##| 4.times do
    ##|   sample pm, beat_stretch: 32, amp: 2, start: 0.2, finish: 0.22
    ##|   sleep 1
    ##| end
    
    ##| sample pm, beat_stretch: 32, amp: 2, finish: 0.2
    ##| sleep 8
    
    
    sample pm, beat_stretch: 32, amp: 2, finish: 0.5
    sleep 16
    
  end
end




######## Section 2 ########

live_loop :density, sync: :bass_drum do
  ##| stop
  density 4 do
    4.times do
      play [:e4, :c5].choose, release: 0.1
      sleep 1
    end
  end
end

live_loop :deep_bass, sync: :bass_drum do
  ##| stop
  use_synth :bass_foundation
  with_fx :ixi_techno, lpf: 70, amp: 0.2, amp_slide: 2 do |fx|
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
live_loop :deep_bass2, sync: :bass_drum do
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

