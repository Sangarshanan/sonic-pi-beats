use_bpm 100

flute = "/Users/sangarshanan/Downloads/samples/Indian/flute1.wav"
live_loop :flute   do
  ##| stop
  with_fx :level do
    sample flute, finish: 0.5, beat_stretch: 19, amp: 0.5
    sleep 9.6
    sample flute, start: 0.5, beat_stretch: 19, amp: 0.5
    sleep 9.6
  end
end

effect = "/Users/sangarshanan/Downloads/samples/Kaytranada/Instrument one-shot/BULLETS.wav"
live_loop :effect do
  ##| stop
  with_fx :reverb do
    sleep 8.5
    sample effect, amp: 0.8, rate: 1.5, beat_stretch: 6
    sleep 10.7
  end
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (1).wav"
live_loop :drum_loop, sync: :flute do
  ##| stop
  sample drum_loop, finish: 0.5, amp: 2
  sleep (sample_duration drum_loop)/2
end
