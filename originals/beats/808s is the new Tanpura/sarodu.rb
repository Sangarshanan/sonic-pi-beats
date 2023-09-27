use_bpm 100

sarod = "/Users/sangarshanan/Downloads/samples/Indian/sarod1.wav"
live_loop :sarod  do
  ##| stop
  with_fx :level do
    3.times do
      sample sarod, beat_stretch: 20
      sleep 7.5
    end
    5.times do
      sample sarod, start: 0.5, beat_stretch: 20
      sleep 7.5
    end
  end
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :drum_loop, delay: 7.5 do
  ##| stop
  sample drum_loop, amp: 2, beat_stretch: 10
  sleep 10
end
