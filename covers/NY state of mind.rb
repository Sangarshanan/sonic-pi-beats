use_bpm 90

# NY state of mind

define :main_mel do
  play_pattern_timed [
    :cs2, :gs2, :d3, :gs2, :cs3, :gs2, :b2
  ],[
    0.75,0.25,0.5,0.25,0.75,0.25,1.25
  ]
end

beep_note = :elec_ping
live_loop :beep do
  ##| stop
  with_fx :flanger do
    3.times do
      sample beep_note, pitch: 3, amp: 6
      sleep 0.75
    end
    sleep 0.25
    2.times do
      sample beep_note, pitch: 3, amp: 6
      sleep 0.75
    end
  end
end

live_loop :drony, sync: :beep do
  with_fx :slicer do
    sample :ambi_drone, amp: 0.2
    sleep 8
  end
end

#### Bass ###

live_loop :bass, sync: :drum1 do
  stop
  use_synth :fm
  main_mel
  use_synth_defaults release: 0.1
end


#### Melody ###

live_loop :piano, sync: :bass do
  stop
  use_synth :piano
  use_synth_defaults release: 0.1
  main_mel
end


live_loop :chord, sync: :bass  do
  stop
  use_synth :piano
  sleep 3.5
  with_fx :reverb do
    play [:cs6, :e6, :gs6], amp: 2
    sleep 0.5
  end
end

# DRUM BEAT #
grid1 = [
  1,0,0,0,0,0,
  2,0,0,0,0,0,
  0,0,2,1,0,0,
  2,0,0,0,0,1,
  1,0,0,1,0,0,
  2,0,0,0,0,0,
  0,0,2,1,0,0,
  2,0,0,0,0,0
]

#for faint accents on the hihat
hh = [2, 8, 14, 20, 26, 32, 38, 44]

live_loop :drum1 do
  48.times do |index|
    puts index, grid1[index]
    with_fx :reverb, mix: 0.3 do
      sample :drum_heavy_kick, release: 0.8 if grid1[index] == 1
      sample :drum_snare_hard, amp: 0.5, release: 0.1 if grid1[index] == 2
      sample :drum_cymbal_closed if index % 3 == 0
      hh.length.times do |i|
        sample :drum_cymbal_closed, amp: 0.05 if index == hh[i]
      end
    end
    sleep 1/6.0
  end
end
