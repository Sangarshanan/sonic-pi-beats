use_bpm 100

live_loop :garzul, sync: :hollow do
  stop
  effect = [:ixi_techno, :slicer].choose
  
  p = [0.25, 0.5, 0.125].choose
  
  with_fx effect, phase: p, wave: 0, mix: rrand(0.5, 0.8) do
    r = [1, -1, 0.5].choose
    sample :loop_garzul, beat_stretch: 20, rate: r
  end
  sleep 20
end

live_loop :hollow do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 2
  sleep 3
end

violin = "/Users/sangarshanan/Downloads/samples/Indian/violin-carnatic.wav"
live_loop :violin, sync: :garzul do
  ##| stop
  with_fx :wobble, mix: 0.5 do
    sample violin, beat_stretch: 16, amp: 1
    sleep 20
  end
end

##| pm = "/Users/sangarshanan/Downloads/samples/Melody/jazz/piano3.wav"
##| sleep 5
##| with_fx :flanger do
##|   with_fx :ping_pong do
##|     sample pm, beat_stretch: 100, amp: 1.5
##|     sleep 100
##|   end
##| end
