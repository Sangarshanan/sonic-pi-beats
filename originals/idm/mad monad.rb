use_bpm 150


live_loop :beat1, sync: :all_fine do
  ##| stop
  effect = [:ixi_techno, :bitcrusher, :distortion].choose
  with_fx effect, mix: rrand(0.4, 1) do
    # :loop_amen, amp: 1
    sample :loop_breakbeat, beat_stretch: 8, amp: 2
  end
  sleep 8
end

live_loop :all_fine, sync: :synth_glitch do
  ##| stop
  with_fx :wobble, mix: 0.5, amp: 1.2 do
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/you almost had me goin.wav", beat_stretch: 4, start: 0.2, beat_stretch: 5
    sleep 8
    
    2.times do
      sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/you almost had me goin.wav", start: 0.5, beat_stretch: 4
      sleep 4
    end
    
  end
end


live_loop :synth_glitch do
  ##| stop
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

live_loop :nappe, sync: :synth_glitch do
  ##| stop
  use_synth :sc808_tommid
  with_fx :bitcrusher, phase: 0.5 do
    n = scale(:e1, :major, num_octaves: 3).choose
    play n
    sleep 0.5
  end
end


live_loop :bass, sync: :synth_glitch do
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
