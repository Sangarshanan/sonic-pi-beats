use_bpm 100

sitar = "/Users/sangarshanan/Downloads/samples/Indian/sitar1.wav"
live_loop :sitar   do
  ##| stop
  with_fx :level do
    sample sitar, finish: 0.5, beat_stretch: 10, amp: 0.3
    sleep 5
    sample sitar, start: 0.5, beat_stretch: 10, amp: 0.3
    sleep 5
    
  end
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (3).wav"
live_loop :drum_loop, sync: :sitar do
  ##| stop
  sample drum_loop, finish: 0.5, amp: 3
  sleep (sample_duration drum_loop)/2
end
