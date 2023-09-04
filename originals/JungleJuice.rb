# JungleJuice

use_bpm 120

## CONTROLS ##

lupiit = 0
flute_before_lupit = true
safari = 0
hihat = 0
hihat_speed = 0.5
djembe = 0
throat = 0

# Rhythm
bass = 0
sample1 = 0
sample2 = 0

## CONTROLS ##

live_loop :met do
  sleep 1
end

live_loop :sample2, sync: :met do
  if sample2 < 1 then stop end
  with_fx :slicer, phase: 0.5 do
    sample '/Users/sangarshanan/Downloads/samples/Folk/celtic.wav', pitch: 2, amp: 2
    sleep 30
  end
end


live_loop :sample1, sync: :met do
  if sample1 < 1 then stop end
  with_fx :slicer do
    sample '/Users/sangarshanan/Downloads/samples/crate1/Sample 17.wav', rate: -1, amp: 3
    sleep 10
  end
end


live_loop :bass, sync: :met do
  if bass < 1 then stop end
  sy1 = :fm
  use_random_seed 100
  
  16.size.times do
    c = chord(:c2, :M7).shuffle.choose
    synth sy1, note: c, sustain: 0.25, release: 0.1, amp: 1
    sleep 0.25
  end
end

live_loop :closedHiHat, sync: :met do
  pattern = "8---4-6---4---6-".ring
  pattern.length.times do
    
    sample '/Users/sangarshanan/Downloads/samples/Jungle/Kick15.wav', amp: (pattern[look].to_f / 9) * 2.5, sustain: 0.2 if (pattern[tick] != "-")
    
    ##| sample '/Users/sangarshanan/Downloads/samples/crate2/Basses/BassStab1.wav', amp: (pattern[look].to_f / 9) * 2.5, sustain: 0.2 if (pattern[tick] != "-")
    
    sleep 4/pattern.length.to_f
  end
end


live_loop :throat, sync: :met do
  if throat < 1 then stop end
  with_fx :reverb do
    sample '/Users/sangarshanan/Downloads/samples/jungle/throat_sing.wav', amp: 2
    sleep 26
  end
end


live_loop :luuppibiitti, sync: :closedHiHat do
  if lupiit < 1 then stop end
  
  if flute_before_lupit == true
    with_fx :reverb do
      sample "/Users/sangarshanan/Downloads/samples/jungle/bamboo-athmo.wav", amp: 3
      sleep 16
    end
  end
  
  sample :loop_compus, beat_stretch: 8, amp: 2
  sleep 8
end

live_loop :safari, sync: :met do
  if safari < 1 then stop end
  sample :loop_safari, amp: 2
  sleep 8
end

live_loop :djembe, sync: :met do
  if djembe < 1 then stop end
  sample "/Users/sangarshanan/Downloads/samples/Kaytranada/Perc/Shaker Djembe.wav", amp: 0.8
  sleep 2
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"
live_loop :hihat, sync: :closedHiHat do
  if hihat < 1 then stop end
  sample :drum_cymbal_pedal, amp: 0.2
  sample mar, amp: 0.2
  sleep hihat_speed
end

live_loop :midi_piano do
  use_synth :tb303
  use_real_time
  n,v = sync "/midi*/note_on"
  play n,amp: 0.2,sustain: 1.5
end
