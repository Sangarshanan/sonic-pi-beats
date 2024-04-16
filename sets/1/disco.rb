use_bpm 120

define :drum_pattern do |pattern|
  v = pattern.tick(:pattern)
  puts v
  if v == "x"
    return sample :bd_haus, cutoff: 70, amp: 2
  elsif v == "o"
    return sample :sn_dolf, amp: 0.5
  elsif v == "-"
    return sample :drum_cymbal_pedal, amp: 0.5
  end
end

live_loop :bass_drum do
  ##| stop
  drum_pattern "x"
  sleep 1
end

live_loop :snare do
  drum_pattern "  o "
  sleep 0.5
end

live_loop :hat do
  drum_pattern "-"
  sleep 0.5
end


live_loop :bass1, sync: :bass_drum do
  stop
  nn = ring(67,62,60,62,64,67,60,62,67,69,62,64,67,69,62,64).tick(:i)
  16.times do
    if spread(5,16).tick(:ii)
      synth :fm, note: nn-24, depth: 3, release: 1.5
    end
    sleep 0.25
  end
end

live_loop :acid_bass, sync: :bass_drum do
  ##| stop
  with_fx :reverb, amp: 1, mix: 0.25 do
    use_synth :tb303
    nuotti = (chord :C2, :minor).choose
    play nuotti, cutoff: rrand(10, 130), release: 0.1, amp: 0.7, release: 0.1
    sleep 0.25
  end
end

#####

live_loop :density do
  ##| stop
  density 4 do
    4.times do
      play [:e4, :c5].choose, release: 0.1
      sleep 1
    end
  end
end

live_loop :beat do
  sample :bd_haus, cutoff: 90
  sleep 1
end

live_loop :deep_bass do
  ##| stop
  use_synth :bass_foundation
  with_fx :ixi_techno, lpf: 70, amp: 0.2, amp_slide: 2 do |fx|
    control fx, amp: 1
    176.times do
      amps = (ring 1, 0.5, 0.5, 0.5, 0.75, 0.5, 0.5, 0.5)
      play :C2, attack: 0.05, release: 0.4, amp: amps.tick
      sleep 0.25
    end
  end
end
