use_bpm 130

ta_l = [
  0.5, 0.25, 0.25, 0.25, 0.5, 0.25, 2
]

sample :glitch_bass_g, rate: 0.25, amp: 2

define :main_chords do
  play [:a3, :e5, :a5], sustain: 4
  sleep 4
  play [:fs3, :a4, :fs5], sustain: 4
  sleep 4
end

melody1_times = ta_l.length * 8
drums1_times = 4
melody2_sleep_duration = (ta_l.sum * 8) + 7
second_mel_sleep_time = 40
melody3_sleep_duration = melody2_sleep_duration + second_mel_sleep_time + 31
chorus_sleep = 120
counter = 0

live_loop :melody, delay: 7 do
  ta = ta_l.ring
  melody1_times.times do
    tick(:i)
    with_fx :reverb, amp: 0.3 do
      with_synth :dsaw do
        play [:cs5, :cs6]
        sleep ta.look(:i)
      end
    end
  end
  counter+=1
  puts counter
  if counter < 2
    sleep second_mel_sleep_time
  else
    sleep 1000000
  end
end


live_loop :chords, delay: 7 do
  with_fx :slicer, amp: 0.8 do
    with_synth :fm do
      main_chords
      play [:gs3, :ds5, :gs5], sustain: 2
      sleep 2
      play [:gs3, :bs4, :gs5], sustain: 2
      sleep 2
      main_chords
      play [:ds4, :b4, :gs5], sustain: 4
      sleep 4
    end
  end
end


live_loop :kick, delay: 7.5 do
  drums1_times.times do
    with_fx :level, amp: 0.9 do
      6.times do
        sample :sn_dolf
        sleep 1
      end
      1.times do
        sample :sn_dolf
        sleep 0.5
      end
      2.times do
        sample :sn_dolf
        sleep 0.25
      end
      1.times do
        sample :sn_dolf
        sleep 1
      end
    end
  end
  sleep second_mel_sleep_time
end

mel2 = ring(
  :fs4, :e4, :ds4, :cs4, :cs4,
  :b3, :cs4, :e4, :cs4, :cs4, :bs3
).repeat(2) + ring(
  :fs4, :fs4, :fs4, :e4,
  :fs4, :gs4, :fs4, :e4, :ds4
) + ring(:ds4).repeat(100)

td = ring(
  1, 0.5, 0.5, 1, 1.5,
  0.5, 0.5, 0.5, 1, 3, 2,
).repeat(2) + ring(
  0.5, 0.5, 0.75, 2, 0.5, 0.5, 0.75, 0.75, 2
) + ring(0.5).repeat(100)
ampb = ring(0.9).repeat(50) + ring(0.7).repeat(5) + ring(0.5).repeat(5) + ring(0.001).repeat(1000)

live_loop :mel2, delay: melody2_sleep_duration do
  tick
  with_fx :flanger do
    with_synth :blade do
      play mel2.look, sustain: td.look, amp: ampb.look
      sleep td.look
    end
  end
end

melc = ring(
  :fs4, :fs4, :fs4, :es4, :ds4, :ds4,
  :cs4, :cs4, :cs4, :ds4, :as3, :cs4, :ds4
) + ring(
  :fs4, :fs4, :fs4, :es4, :ds4, :ds4,
  :cs4, :cs4, :cs4, :ds4, :as3, :cs4, :ds4, :gs3, :fs3
)

tc = ring(
  1, 1, 0.5, 0.5, 1, 4,
  1, 1, 0.5, 0.5, 1, 1, 3
).repeat(1) + ring(
  1, 1, 0.5, 0.5, 1, 4,
  1, 1, 0.5, 0.5, 1, 1, 1, 0.75, 10
)

live_loop :mel3, delay: melody3_sleep_duration do
  ##| stop
  28.times do
    tick
    with_fx :reverb, amp: 0.9 do
      with_synth :bass_foundation do
        play melc.look, sustain: tc.look
        sleep tc.look
      end
    end
  end
  sleep 1000
end

live_loop :chords3, sync: :mel3 do
  ##| stop
  use_synth :fm
  play [:ds3, :as3, :ds4, :fs4], sustain: 8
  sleep 8
  play [:b2, :b3, :ds4, :fs4], sustain: 8
  sleep 8
  play [:cs3, :cs4, :e4, :gs4], sustain: 8
  sleep 8
end


#### CHORUS ####

mel_chorus = ring(
  :a4, :b4, :a4, :gs4, :fs4, :gs4, :fs4,
  :gs4, :a4, :gs4, :a4, :a4,
  :a4, :b4, :a4, :gs4, :fs4, :gs4, :fs4,
  :e4, :e4, :e4, :ds4, :cs4, :b3, :a3
)
t_chorus = ring(
  0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 3,
  0.5, 0.5, 3, 1, 1,
  0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 3,
  1, 1, 0.5, 0.5, 0.5, 0.5, 2
)

live_loop :chorus, sync: :kick, delay: chorus_sleep do
  ##| stop
  tick
  with_fx :hpf, amp: 0.9 do
    with_synth :dsaw do
      play mel_chorus.look, sustain: t_chorus.look
      sleep t_chorus.look
    end
  end
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks03.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare02.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats01.wav"

kick_snare= [
  1,0,2,1, 0,1,2,0,
  0,1,2,0, 1,0,2,0,
]

live_loop :drum2, delay: chorus_sleep + 30 do
  16.times do |index|
    puts index, kick_snare[index]
    sample kick if kick_snare[index] == 1
    sample snare if kick_snare[index] == 2
    sleep 0.25
  end
end

live_loop :hi_hat, delay: chorus_sleep do
  sample hat1, amp: 0.5
  sleep 0.5
end
