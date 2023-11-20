
use_bpm 160

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

live_loop :luuppibiitti, sync: :bass do
  stop
  sample :loop_compus, beat_stretch: 8, amp: 2
  sleep 8
end


live_loop :beats, sync: :bass do
  ##| stop
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

live_loop :carnatic_violin, sync: :bass do
  ##| stop
  with_fx :reverb do
    sample "/Users/sangarshanan/Downloads/samples/Indian/violin-carnatic.wav", amp: 2
    sleep 12
  end
end

live_loop :drumloop do
  at [2.5, 6.5] do
    sample :sn_generic, amp: rrand(0.6, 1), rate: rrand(0.95, 1.05)
  end
  sleep 8
end
