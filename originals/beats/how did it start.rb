use_bpm 100

bass1 = "/Users/sangarshanan/Downloads/samples/apple/Chill/Icy Crystals Bass.wav"
live_loop :mel1 do
  ##| stop
  sample bass1, beat_stretch: 8, amp: 1
  sleep 8
end

drum_loop1 = "/Users/sangarshanan/Downloads/samples/apple/VintageBreaks/Bouncy Break.wav"
live_loop :drum_loop, sync: :mel1 do
  ##| stop
  with_fx :slicer, mix: 0.5 do
    sample drum_loop1, beat_stretch: 16, amp: 1, finish: 0.5
    sleep 8
  end
end
