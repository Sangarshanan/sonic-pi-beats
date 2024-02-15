# Ahir Bhairav

use_bpm 100

up_down = 0

clap = 1
noisehat = 1
kickk = 1
hhat = 1

live_loop :up_down, sync: :tabla_loop do
  if up_down < 1 then stop end
  use_synth :tb303
  with_fx [:ixi_techno, :reverb, :octaver].choose, amp: 0.4, mix: 0.8  do
    # Play with interval 0.25, 0.5, 1, 2, 3 and then drop the beat
    play_pattern_timed scale(:c1, :ahirbhairav, num_octaves: 3)[6..24], 1, release: 0.1, attack: 0.1
    play_pattern_timed scale(:c1, :ahirbhairav, num_octaves: 3)[6..24].reverse, 1, release: 0.1, attack: 0.1
  end
end

live_loop :tabla_loop do
  stop
  use_random_seed 1000
  24.times do
    sample :loop_tabla, onset: pick, release: 0.2, amp: 5
    sleep (knit, 0.25, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.25, 4, 0.25, 2).tick
  end
end

kick =  [1,1,0,0,1,0,1,0,1,0,0,0,1,0,1,0]
snare = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
hat =   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]


k = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks13.wav"

live_loop :kick, sync: :Snare do
  if kickk < 1 then stop end
  16.times do |hit|
    sample k, amp: 4 if kick[hit] == 1
    sleep 0.25
  end
end

live_loop :bass_hit, sync: :Snare do
  if clap < 1 then stop end
  at [1.5, 2.5, 5.5, 6.5] do
    sample :bass_hit_c, amp: 2
  end
  sleep 8
end

c = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap06.wav"

live_loop :Snare, sync: :up_down do
  if clap < 1 then stop end
  16.times do |hit|
    sample c, amp:rrand(1.5,2.6) if snare[hit] == 1
    sleep 0.25
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :hat, sync: :kick do
  if hhat < 1 then stop end
  16.times do |hit|
    sample mar, amp: 0.3, pan: rrand(-1,1)
    sample :drum_cymbal_closed,  release:0.3, amp: rrand(0.5, 1), pan: rrand(-1,1) if spread(13,16).tick
    sleep 0.25
  end
end

live_loop :noisehat, sync: :kick do
  if noisehat < 1 then stop end
  use_synth :noise
  play :c4, amp: 2, release: 0.025, cutoff: 110 if spread(5,16).tick
  sleep 0.25
  
  in_thread do
    sleep 7.5
    play :c4, release: 0.025, cutoff: 110 if spread(5,16).tick
    sleep 7.5
  end
  
end

