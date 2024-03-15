set_volume! 2

use_bpm 100

live_loop :amen_break, sync: :bass_drum do
  stop
  effect = [:slicer, :reverb, :ixi_techno].choose
  p = [0.25, 0.5, 0.125].choose
  with_fx effect, phase: p, wave: 0, mix: rrand(0.4, 1) do
    r = [1, 1, 1].choose
    sample [:loop_amen, :loop_breakbeat].choose, beat_stretch: 2, rate: r , amp: 4
  end
  sleep 2
end

live_loop :bass_drum do
  ##| stop
  sample :bd_haus, cutoff: 70, amp: 2
  sleep 1
end

live_loop :landing, sync: :bass_drum do
  ##| stop
  bass_line = (knit :d1, 5, [:c1, :c2, :c3, :c4, :c5].choose, 1)
  with_fx :slicer, phase: [0.25, 0.5].choose, invert_wave: 1, wave: 0 do
    s = synth :square, note: bass_line.tick, sustain: 4, cutoff: 60
    control s, cutoff_slide: 4, cutoff: 120
  end
  sleep 4
end

live_loop :pulpul do
  ##| stop
  with_fx :reverb, amp: 1, mix: 0.25 do
    use_synth :tb303
    nuotti = (chord :C2, :minor).choose
    play nuotti, cutoff: rrand(10, 130), release: 0.1, amp: 0.7, release: 0.1
    sleep 0.25
  end
end

vocal = "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav"
live_loop :vocal, sync: :bass_drum do
  ##| stop
  with_fx :slicer, mix: 0.3 do
    sample vocal, beat_stretch: 90, start: 0.40, finish: 0.445, amp: 2
    sleep 1
  end
end


