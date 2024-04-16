use_bpm 160


bass1 = "/Users/sangarshanan/Downloads/samples/bass/atonal.wav"
live_loop :bss_loop do
  ##| stop
  sample bass1, beat_stretch: 16, amp: 2
  sleep 16
end

drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/dubstep/1.wav"
live_loop :drum_drop, sync: :bss_loop, delay: 0.8 do
  ##| stop
  with_fx :reverb, mix: 0.5 do
    sample drum_loop1, beat_stretch: 32, amp: 10
    sleep 32
  end
end

live_loop :starter do
  ##| stop
  with_fx :wobble, mix: 0.3, phase: 0.25 do
    sample :loop_weirdo, beat_stretch: 8
  end
  sleep 8
end

live_loop :bass, sync: :starter do
  ##| stop
  with_fx :reverb do
    sample :bd_haus, amp: 1.5
    sleep 1
  end
end

synth2 = "/Users/sangarshanan/Downloads/samples/apple/Chill/Kyoto Night Synth.wav"
live_loop :synth2, sync: :starter do
  stop
  with_fx :reverb, mix: 0.5 do
    sample synth2, beat_stretch: 16, amp: 0.5
    sleep 16
  end
end

live_loop :luuppibiitti, sync: :bass do
  ##| stop
  sample :loop_compus, beat_stretch: 8, amp: 2
  sleep 8
end

live_loop :beats, sync: :bass do
  stop
  sample :bd_tek, amp: 0.4
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample  :drum_cymbal_soft, sustain: 0, release: 0.1, amp: 0.4
    sleep 0.5
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"
live_loop :hihat, sync: :bass do
  stop
  sample :drum_cymbal_pedal, amp: 0.2
  sample mar, amp: 0.5
  sleep 0.25
end

live_loop :dowdowdow, sync: :bass do
  ##| stop
  with_fx :reverb, mix: 0.5 do
    use_synth :tb303
    c = [:C2, :F2, :B2].choose
    chordi = (chord c, :minor).choose
    play chordi, cutoff: rrand(10, 120), release: 0.7, amp: 0.7
    sleep 0.5
  end
end


v = "/Users/sangarshanan/Downloads/samples/Indian/violin-carnatic.wav"

live_loop :carnatic_violin do
  stop
  use_random_seed 1234 # change to3 1234 123
  4.times do
    sample v, beat_stretch: 10, onset: rrand(5,100)
    sleep 1
  end
end

live_loop :drumloop do
  at [2.5, 6.5] do
    sample :sn_generic, amp: rrand(0.6, 1), rate: rrand(0.95, 1.05)
  end
  sleep 8
end

synth1 = "/Users/sangarshanan/Downloads/samples/apple/Chill/Prismatic Rhythm Guitar.wav"
live_loop :synth1, sync: :starter do
  stop
  with_fx :panslicer, mix: 0.5 do
    sample synth1, beat_stretch: 16
    sleep 16
  end
end

