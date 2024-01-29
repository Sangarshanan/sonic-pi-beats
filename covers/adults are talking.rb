# The Adults Are Talking

use_bpm 160

define :mel_times do |note, number, duration|
  
  number.times do
    play note
    sleep duration
  end
end

define :mel1_2 do |note|
  play note
  sleep 1
  2.times do
    play note
    sleep 0.5
  end
end

define :drum_pattern do |pattern|
  v = pattern.tick(:pattern)
  puts v
  if v == "x"
    return sample :bd_ada
  elsif v == "o"
    return sample :sn_dolf, amp: 0.5
  elsif v == "-"
    return sample :drum_cymbal_pedal, amp: 0.5
  end
end

live_loop :disco do
  16.times do
    drum_pattern "x-o-"
    sleep 0.5
  end
end

live_loop :chords, sync: :disco do
  use_synth :bass_foundation
  use_synth_defaults sustain: 0.8, attack: 0.1
  4.times do
    play [:g1, :as2, :d3, :f3]
    sleep 1
  end
  4.times do
    play [:c2, :c3, :e3, :g3]
    sleep 1
  end
  4.times do
    play [:f1, :c3, :f3, :a3]
    sleep 1
  end
  4.times do
    play [:as1, :as2, :d3, :f3]
    sleep 1
  end
end


live_loop :main_mel, sync: :disco do
  ##| stop
  use_synth :pluck
  use_synth_defaults attack: 0.1, sustain: 2
  with_fx :flanger, mix: 0.8 do
    with_fx :lpf, cutoff: 115 do
      # 1
      mel_times :As3, 2, 1
      mel1_2 :g3
      
      # 2
      mel_times :As3, 3, 0.5
      mel1_2 :g3
      mel_times :A3, 1, 0.5
      
      
      # 3
      mel_times :As3, 2, 1
      mel1_2 :e3
      
      #4
      play :as3
      sleep 0.5
      play :as3
      sleep 1
      play :e3
      sleep 1
      play :e3
      sleep 0.5
      play :f3
      sleep 0.5
      play :g3
      sleep 0.5
      
      # 5
      mel_times :A3, 2, 1
      mel1_2 :F3
      
      #6
      play :a3
      sleep 0.5
      play :a3
      sleep 1
      mel1_2 :f3
      mel_times :g3, 1, 0.5
      
      #7
      mel_times :a3, 2, 1
      mel1_2 :d3
      
      # 8
      play :a3
      sleep 0.5
      play :a3
      sleep 1
      play :d3, sustain: 0.75
      sleep 1.5
      play :g3
      sleep 0.5
      play :a3
      sleep 0.5
    end
  end
end

synth2 = "/Users/sangarshanan/Downloads/samples/apple/Chill/Kyoto Night Synth.wav"
live_loop :synth2, sync: :disco do
  ##| stop
  with_fx :reverb, mix: 0.5 do
    sample synth2, beat_stretch: 16, amp: 0.5
    sleep 16
  end
end
