use_bpm 120

vocal = "/Users/sangarshanan/Downloads/samples/songs/chaudhary_vocal.wav"
live_loop :chaudary2 do
  ##| stop
  with_fx :bitcrusher do
    sample vocal, beat_stretch: 600, start: 0.1, finish: 0.11
    sleep 4
  end
end


beat2 = "/Users/sangarshanan/Downloads/samples/songs/chaudhary_music.wav"
live_loop :chaudary, sync: :chaudary2 do
  ##| stop
  with_fx :ixi_techno, amp: 1.4 do
    sample beat2, beat_stretch: 600, start: 0.1, finish: 0.11
    sleep 6
  end
end


trap_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/Trap/6.wav"
live_loop :trap_loop1, sync: :chaudary  do
  ##| stop
  with_fx :bpf do #  :bpf :hpf
    with_fx :lpf do
      sample trap_loop1, beat_stretch: 32, finish: 0.5, amp: 0.8
      sleep 16
    end
  end
end
