set_volume! 2
use_bpm 120

raag = "/Users/sangarshanan/Downloads/samples/Indian/raag_vocal.wav"
live_loop :raag_drone  do
  ##| stop
  with_fx :whammy, mix: 0.4 do
    with_fx :lpf, mix: 0.8 do
      sample raag, beat_stretch: 60, amp: 2, start: 0.55, finish: 0.799, cutoff: 70
      sleep 15
    end
  end
end

live_loop :d_lop, sync: :raag_drone do
  ##| stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/techno/2.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 30, amp: 4
    sleep 30
  end
end

raag = "/Users/sangarshanan/Downloads/samples/Indian/raag_vocal.wav"
live_loop :raag_music, sync: :raag_drone  do
  ##| stop
  with_fx :reverb, mix: 0.4 do
    sample raag, beat_stretch: 60, amp: 3, start: 0.55, finish: 0.799, cutoff: 70
    sleep 15
  end
end

s = "/Users/sangarshanan/Downloads/samples/drum_loops/dubstep/drop.wav"
with_fx :band_eq do
  sample s, beat_stretch: 15
  sleep 15
end

