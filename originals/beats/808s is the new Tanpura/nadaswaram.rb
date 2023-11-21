use_bpm 80

#

with_fx :reverb do
  sample "/Users/sangarshanan/Downloads/samples/Indian/mayil1_sample.wav", beat_stretch: 14
  sleep 14
  sample :vinyl_rewind
end

#

mayil1 = "/Users/sangarshanan/Downloads/samples/Indian/mayil1_sample.wav"
live_loop :mel1, delay: 0.3 do
  ##| stop
  with_fx :reverb do
    sample mayil1, beat_stretch: 14, amp: 1
    sleep 14
  end
end

mayil2 = "/Users/sangarshanan/Downloads/samples/Indian/mayil_sam2.wav"
live_loop :mel2 do
  ##| stop
  with_fx :reverb do
    sample mayil2, beat_stretch: 7, amp: 1
    sleep 7
  end
end

drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/BoomBap/boombap_75.wav"
live_loop :drum_loop do
  ##| stop
  sample drum_loop1, beat_stretch: 14, finish: 0.5
  sleep 7
end

live_loop :hiss, sync: :drum_loop do
  ##| stop
  sample :ambi_lunar_land, rate: 0.5, amp: 0.5, beat_stretch: 2
  sample :vinyl_hiss, rate: 0.8, amp: 0.3
  sleep 14
end

