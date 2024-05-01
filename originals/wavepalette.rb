use_bpm 100

set_volume! 2

live_loop :garzul, sync: :hollow do
  ##| stop
  effect = [:ixi_techno, :whammy, :slicer].choose
  p = [0.25, 0.5, 0.125].choose
  with_fx effect, phase: p, wave: 0, mix: rrand(0.5, 0.8) do
    r = [1, -1, 0.5].choose
    sample :loop_garzul, beat_stretch: 20, rate: r, amp: 2
  end
  sleep 20
end

live_loop :hollow do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 4
  sleep 3
end

violin = "/Users/sangarshanan/Downloads/samples/Indian/violin-carnatic.wav"
live_loop :violin, sync: :garzul do
  ##| stop
  with_fx :ping_pong, mix: 0.5 do
    sample violin, beat_stretch: 16, amp: 2
    sleep 20
  end
end

live_loop :synth1, sync: :hollow  do
  stop
  
  use_synth_defaults amp: 0.8, release: 4, sustain: 0
  use_synth :dsaw
  
  with_fx :slicer, phase: 0.5, invert_wave: 1, mix: 0.3 do
    with_fx :reverb, mix: 0.7, room: 0.8 do
      
      with_fx :ping_pong, cutoff: 100 do
        play chord(:eb3, :dom7, invert: 0)
        sleep 8
        play chord(:f3, :m7, invert: 0)
        sleep 8
      end
    end
  end
end

