# Feel Good Inc by Gorillaz

use_bpm 140

melb = ring(
  :ds3, :ds3, :f3, :fs3, :b3, :as3,
  :gs3, :gs3, :b3, :as3, :fs3, :ds3,
)

tb = ring(
  1.5, 0.5, 0.5, 1, 1, 3.5,
  1.5, 0.5, 0.5, 1, 1, 3.5
)


live_loop :bassline, sync: :kick do
  ##| stop
  tick(:i)
  with_synth :fm do
    play melb.look(:i), amp: 0.8, sustain: tb.look(:i) - 0.4
    sleep tb.look(:i)
  end
end

live_loop :feel_good_1, delay: 18 do
  ##| stop
  use_synth :tech_saws
  play :f5, release: 1
  sample :glitch_perc2, pitch: 1
  sleep 1
  play :Ds5, release: 2
  sample :glitch_perc4, pitch: 0.5
  sleep 15
end


live_loop :kick do
  sample :bd_fat, amp: 2
  sleep 2.5
  sample :bd_fat, amp: 2
  sleep 1.5
end

live_loop :snare, delay: 1 do
  ##| stop
  sample :sn_dolf, amp: 2
  sleep 2
end


initial =  ring(:ds4, :es4, :fs4, :gs4, :as4, :cs5, :as4, :gs4, :gs4)

mel1 =
  initial +
  ring(:fs4, :ds4, :fs4, :gs4, :es4, :ds4, :cs4) +
  initial +
  ring(:fs4, :ds4, :fs4, :fs4, :gs4)

t1 = ring(
  1, 0.5, 1, 1, 1, 1, 1, 1.5,
  1, 0.5, 1, 1, 1.5, 0.5, 0.5, 2,
  1, 0.5, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 0.5, 3
)


live_loop :melody, sync: :kick do
  stop
  30.times do
    tick(:i)
    with_synth :blade do
      play mel1.look(:i), release: t1.look(:i) * 2, cutoff: 80, attack: 0.1, sustain: t1.look(:i) - 0.25
      sleep t1.look(:i)
    end
  end
  stop
end


