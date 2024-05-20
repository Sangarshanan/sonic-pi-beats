use_bpm 100

bass = "/Users/sangarshanan/Downloads/samples/bass/techno1.wav"
live_loop :bassline1, sync: :god_player  do
  stop
  with_fx :slicer, mix: 0.5 do
    sample bass, beat_stretch: 12, rate: 1
    sleep 12
  end
end

live_loop :beat1, sync: :god_player do
  ##| stop
  effect = [:reverb, :ixi_techno, :octaver].choose
  with_fx effect, mix: rrand(0.4, 1) do
    sample :arovane_beat_e, beat_stretch: 18, amp: 2
  end
  sleep 18
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

current_note = 60

live_loop :god_player do
  current_note = f_god(current_note).choose
  c = f_chord_ary(current_note)
  n = (note_info current_note).midi_string
  puts "note: #{n}, chord: #{c}"
  
  use_synth :hollow
  play c, attack: rrand(2,4), release: rrand(3,5), amp: 1.9
  
  use_synth :dark_ambience
  play c[ rrand_i(2,5) ], attack: 3, release: 6, amp: 2
  
  use_synth :fm
  play (note n, octave: 2), attack: 3, release: 3, amp: 0.25
  
  with_fx :gverb, mix: 0.5 do
    with_fx :whammy, grainsize: 2, mix: 0.75 do
      play (note n, octave: 4), attack: 3, release: 3, amp: rrand(0.05, 0.15)
    end
  end
  sleep 4
end


in_thread do
  use_transpose -12
  with_fx :reverb,room: 0.8,mix: 0.7 do
    use_synth :beep
    32.times do
      play c.choose,release: 0.125,amp: 0.4,pan: rrand(-1,1)
      sleep 0.125
    end
  end
end


