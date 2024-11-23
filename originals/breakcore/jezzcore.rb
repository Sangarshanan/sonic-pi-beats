use_bpm 120

# Jazzcore

beat1 = "/Volumes/Roguentropy/samples/drum_loops/dnb/vene.wav"

live_loop :broken_beat, sync: :pm do
  ##| stop
  effect = [:compressor, :bitcrusher, :reverb].choose
  with_fx effect do
    
    sample beat1, beat_stretch: 10, amp: 1.5
    sleep 10
    
  end
end


pm = "/Volumes/Roguentropy/samples/Melody/jazz/piano4.wav"
live_loop :pm, sync: :synth_glitch do
  stop
  with_fx :compressor, mix: 0.5, amp: 1.5 do
    
    ##| sample pm, beat_stretch: 70, start: 0.05, finish: 0.2
    ##| sleep 10
    
    sample pm, beat_stretch: 71, start: 0.222, finish: 0.297
    sleep 5
    
    sample pm, beat_stretch: 70, start: 0.3, finish: 0.35
    sleep 5


    sp_m = "/Volumes/Roguentropy/set-dosa/other.wav"

    ##| with_fx :reverb, mix: 0.3 do
    ##|   sample sp_m, beat_stretch: 10
    ##|   sleep 10
    ##| end
    
  end
end


live_loop :synth_glitch do
  ##| stop
  with_fx :reverb, phase: 0.0625, decay: 4 do |ctl|
    
    tick
    control ctl, mix: knit(0,8, 1,2).shuffle.choose
    syn = [:cnoise, :pluck, :tb303, :tech_saws, :dull_bell].choose
    use_synth :tech_saws
    use_synth_defaults release: rrand(0.08, 0.13), cutoff: rrand(100,120)
    
    play scale(48-12, :chromatic, num_octaves: 3).choose,
      pan: rdist(0.25) if spread(4, 5).choose
    sleep 0.25
  end
end

define :f_god do |x|
  if x>60 then
    x = x-12
  end
  (ring x+3, x+4, x+6, x+8, x+9)
end

define :f_chord_ary do |x|
  oct = (octs x-2*12, 5).to_ary
  nts = []
  oct.each { |x| nts.push( (chord x, "M").to_ary ) }
  nts = nts.flatten
  ret = []
  nts.each { |x| ret.push(x) if x > 60 && x < 90 }
  ret
end

current_note = 40

live_loop :god_player do
  current_note = f_god(current_note).choose
  c = f_chord_ary(current_note)
  n = (note_info current_note).midi_string
  puts "note: #{n}, chord: #{c}"
  
  
  use_synth :hollow
  play c, attack: rrand(2,4), release: rrand(3,5), amp: 1.9
  
  use_synth :pluck
  play c[ rrand_i(2,5) ], attack: 3, release: 6, amp: 2
  
  sample :vinyl_rewind, rate: -1
  
  use_synth :tb303
  play (note n, octave: 2), attack: 3, release: 3
  
  with_fx :reverb, mix: 0.5 do
    with_fx :whammy, grainsize: 2, mix: 0.75 do
      play (note n, octave: 4), attack: 3, release: 3, amp: rrand(0.05, 0.15)
    end
  end
  sleep 5
end
