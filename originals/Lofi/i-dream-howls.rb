# chill beats to scratch your balls to

use_bpm 60

## CONTROLS ##

# Drum
drum = 0
misc_perc = 0

# Rhythm
warped_loop = 0
warped_amp = 0.5
melody = 0
fmin_mel = 0

live_loop :met do
  sleep 1
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (3).wav"
live_loop :drum_loop, sync: :met do
  if drum < 1 then stop end
  
  # comment after run
  
  ##| with_fx :level do
  ##|   sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/relax everythings fine.wav", finish: 0.5
  ##|   sleep 5
  ##|   sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/relax everythings fine.wav", start: 0.5
  ##|   sleep 1
  ##| end
  
  ##| comment out after first run
  
  sample drum_loop, finish: 0.5, amp: 2
  sleep (sample_duration drum_loop)/2
end


fmin = "/Users/sangarshanan/Downloads/samples/lofi/LofiJuice/kendrickFmin.wav"
live_loop :fmin, sync: :met do
  if fmin_mel < 1 then stop end
  
  # comment out after first run
  
  ##| with_fx :reverb do
  ##|   sample '/Users/sangarshanan/Downloads/samples/lofi/voiceover/calm confident never hesitate.wav'
  ##|   sleep 6
  ##| end
  
  ##| comment out after first run
  
  with_fx :reverb do
    sample fmin, rate: -1, amp: 0.5
    sleep 20
  end
end

live_loop :hiss do
  sample :vinyl_hiss, amp: 0.4
  sleep 1
end

sample_warped = "/Users/sangarshanan/Downloads/samples/lofi/LofiJuice/sadpluck.wav"
live_loop :warped, sync: :met do
  if warped_loop < 1 then stop end
  with_fx :flanger do
    sample sample_warped, stop: 0.5, amp: warped_amp
    sleep (sample_duration sample_warped)/2
  end
end

live_loop :melody, sync: :drum_loop do
  if melody < 1 then stop end
  use_bpm 80
  use_synth_defaults amp: 0.3
  use_synth :bass_foundation
  
  with_fx :level do
    play_pattern_timed [:D3,:G3,:Bb3,:D4,:D4,:C4,:Bb3,:A3], [0.5, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5]
    play :Bb3, sustain: 3
    sleep 3
    play_pattern_timed [:G3,:Bb3,:D4,:G4,:G4,:G4,:F4,:Eb4], [0.5,0.5,0.5,1,0.5,0.5,0.5,0.5]
    play :F4, sustain: 3
    sleep 3
    play_pattern_timed [:A3,:D4,:F4,:A4,:G4,:F4,:E4,:F4,:G4,:F4,:E4,:D4,:C4,:Bb3,:C4,:D4,:C4,:G3], [
      0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,0.5
    ]
    play :A3, sustain: 3
    sleep 3
  end
end

live_loop :marble, sync: :met do
  if misc_perc < 1 then stop end
  sleep 2
  sample "/Users/sangarshanan/Downloads/samples/lofi/perc-pack/marble.wav", amp: 2
  sleep 2
end

live_loop :cup, sync: :met do
  if misc_perc < 1 then stop end
  sleep 4
  sample "/Users/sangarshanan/Downloads/samples/lofi/perc-pack/icey cup.wav", amp: 1
  sleep 4
end

live_loop :glitch, sync: :met do
  sleep 4
  if misc_perc < 1 then stop end
  sample :glitch_perc1, rate: [0.25, 0.5, -1].choose, amp: 0.8
end

live_loop :all_fine, sync: :met do
  if drum < 1 then stop end
  sleep 25
  with_fx :level do
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/relax everythings fine.wav", finish: 0.5
    sleep 6
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/relax everythings fine.wav", start: 0.5
    sleep 1
  end
end
