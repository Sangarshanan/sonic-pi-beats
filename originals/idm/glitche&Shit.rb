use_bpm 150


live_loop :beat1, sync: :synth_glitch do
  stop
  effect = [:ixi_techno, :bitcrusher, :distortion].choose
  with_fx effect, mix: rrand(0.4, 1) do
    # :loop_amen, amp: 1
    sample :loop_breakbeat, beat_stretch: 8, amp: 2
  end
  sleep 8
end


live_loop :synth_glitch do
  stop
  with_fx :reverb, phase: 0.0625, decay: 4 do |ctl|
    
    tick
    control ctl, mix: knit(0,8, 1,2).shuffle.choose
    syn = [:cnoise, :pluck, :tb303, :tech_saws, :dull_bell].choose
    use_synth syn
    use_synth_defaults release: rrand(0.08, 0.13), cutoff: rrand(40,120)
    
    play scale(48-12, :chromatic, num_octaves: 3).choose,
      pan: rdist(0.25) if spread(4, 5).choose
    sleep 0.25
  end
end

live_loop :nappe, sync: :bass do
  stop
  use_synth :sc808_tommid
  with_fx :bitcrusher, phase: 0.5 do
    n = scale(:e1, :major, num_octaves: 3).choose
    play n
    sleep 0.5
  end
end

### Section 2

live_loop :bass do
  ##| stop
  
  use_synth :sine
  play :c2, amp: 2, sustain: 2, release: 1 if spread(1,16*3).look
  
  play :c4+[0,2,-2,5,3,7,-7].look, release: 0.15, amp: 0.5 if spread(12,16).look and one_in(2)
  play :c7+[0,2,-2,5,3,7,-7].look, release: 0.04, amp: 0.5 if spread(12,16).look and one_in(2)
  
  sample :glitch_perc3, beat_stretch: [0.25,0.5, 1,2,4].choose, rate: [2,4].choose, slice: rrand_i(1,10), amp: 2, pan: rdist(0.5) if bools(1).look and one_in(2)
  
  use_synth :noise
  use_synth_defaults release: [0.001,0.002,0.004,0.006].choose
  c = [70,80,90,100,110,120,130].choose-50
  play :c9, cutoff: c, amp: 2, pan: rdist(0.75)
  use_synth_defaults release: [0.01,0.02,0.04,0.06].choose
  
  cu = line(70,95,steps: 64).look
  play :c4, cutoff: cu, amp: 2, pan: rdist(0.5)
  
  sleep 4
end


choir = "/Users/sangarshanan/Downloads/samples/vocal/choir-dorian.wav"
live_loop :choirs, sync: :bass do
  stop
  with_fx :compressor do
    with_fx :slicer do
      sample choir, beat_stretch: 32
      sleep 32
    end
  end
end


live_loop :tron, sync: :bass do
  ##| stop
  notes =  (ring :b1, :b2, :e1, :e2, :b3, :e3)
  with_synth :dsaw do
    with_fx(:slicer, phase: [0.25].choose) do
      with_fx(:reverb, room: 0.5, mix: 0.3) do
        
        n1 = (chord notes.choose, :minor).choose
        n2 = (chord notes.choose, :minor).choose
        
        p = play n1, release: 8, note_slide: 4, cutoff: 30, cutoff_slide: 4, detune: rrand(0, 0.2)
        control p, note: n2, cutoff: rrand(80, 120)
      end
    end
  end
  sleep 8
end


live_loop :break, sync: :bass do
  ##| stop
  with_fx :reverb do
    sample "/Users/sangarshanan/Downloads/samples/drum_loops/dubstep/chill.wav", beat_stretch: 8, amp: 3
    sleep 8
  end
end

live_loop :all_fine, sync: :bass do
  ##| stop
  with_fx :wobble, mix: 0.5, amp: 3 do
    sleep 16
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/i dont even know what im doin.wav", start: 0.2, beat_stretch: 5, release: 0.8
  end
end



