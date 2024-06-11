use_bpm 100

live_loop :garzul, sync: :hollow do
  ##| stop
  
  effect = [:ixi_techno, :slicer, :wobble].choose
  ##| effect = [:reverb].choose
  
  p = [0.25, 0.5, 0.125].choose
  
  with_fx effect, phase: p, wave: 0, mix: rrand(0.5, 0.8) do
    
    r = [1, -1, 0.5].choose
    ##| r = 0.5
    
    sample :loop_garzul, beat_stretch: 20, rate: r, amp: 0.8
  end
  sleep 20
end

live_loop :hollow do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 2
  sleep 3
end

# Piano
pm = "/Users/sangarshanan/Downloads/samples/Melody/jazz/piano3.wav"
live_loop :jazz, sync: :hollow do
  ##| stop
  sleep 5
  with_fx :flanger do
    with_fx :ping_pong do
      sample pm, beat_stretch: 100
      sleep 100
    end
  end
end

violin = "/Users/sangarshanan/Downloads/samples/Indian/violin-carnatic.wav"
live_loop :violin, sync: :garzul do
  ##| stop
  with_fx :wobble, mix: 0.5 do
    sample violin, beat_stretch: 16, amp: 1
    sleep 20
  end
end

live_loop :break, sync: :violin do
  ##| stop
  with_fx :ixi_techno, mix: 0.7 do
    sample "/Users/sangarshanan/Downloads/samples/drum_loops/dnb/1.wav", beat_stretch: 10, amp: 0.5
    sleep 10
  end
end

live_loop :beep, sync: :violin do
  ##| stop
  with_fx :ping_pong, room: 0.8, mix: 0.6, amp: 1.5 do
    with_fx :echo, phase: 0.5, decay: 4 do
      play :c3, release: 0.3
      sleep 5
    end
  end
end

live_loop :beat1, sync: :violin do
  stop
  effect = [:ixi_techno, :octaver, :wobble, :reverb].choose
  with_fx effect, mix: rrand(0.4, 1) do
    sample :glitch_bass_g, amp: 0.7
  end
  sleep 5
end

live_loop :base, sync: :violin do
  ##| stop
  sy1 = :fm
  use_random_seed 100
  
  16.size.times do
    c = chord(:g1, :major).shuffle.choose
    synth sy1, note: c, sustain: 0.25, release: 0.1, amp: 0.8
    sleep 0.5
  end
end


live_loop :guit, sync: :violin do
  with_fx :octaver do
    sample :ambi_choir, beat_stretch: 1, amp: 1.3
    sleep 2
  end
end


