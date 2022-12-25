# https://soundcloud.com/rogue-entropy/astral-pipes

use_bpm 100

# https://rhasspy.github.io/larynx/local/fr-fr/gilles_le_blanc-glow_tts/samples/si_mon_tonton_tond_ton_tonton.wav
live_loop :tonton do
  with_fx :autotuner, phase: 0.125, mix: 0.4 do
    sample "/Users/sangarshanan/Downloads/si_mon_tonton_tond_ton_tonton.wav", rate: -1, amp: 0.01, cutoff: 80
    sleep 2
  end
end

live_loop :beats do
  sample :bd_tek, amp: 0.4, amp: 0.0001
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample  :drum_cymbal_soft, sustain: 0, release: 0.1, amp: 0.0001
    sleep 0.5
  end
end


live_loop :drum2 do
  sample :bd_tek, amp: 0.7
  sleep 1
  sample :sn_generic, rate: 3, amp: 0.0001
  sleep 1
end

live_loop :oooloop do
  tick(:note) if factor? tick, 4
  use_synth :square
  density 2 do
    play (knit :c2, 2, :e1, 1, :f3, 1).look(:note), release: 0, attack: 0.25, amp: 0.0001, cutoff: rrand_i(70, 130)
    sleep 0.5
  end
end

mel1 = ring(57,57,57,57,60,60,60,60)

t1 = ring(0.75,0.75,1,1.5,0.75,0.75,1,1.5)

live_loop :melody do
  use_synth :piano
  tick(:i)
  play mel1.look(:i),sustain: 0.25, amp: 0.0001
  sleep t1.look(:i)
end


