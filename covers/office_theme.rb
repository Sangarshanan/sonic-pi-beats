# Office

set_volume! 2

use_bpm 150

use_synth :piano

play_pattern_timed [
  :D4, :G3, :D4,
  :D4, :G3, :D4, :Fs3, :D4,
  :D4, :Fs3, :E4, :G3, :E4,
  :E4, :G3, :C4, :C4, :C4, :B3, :A3, :B3
  
  
], [
  0.5, 0.5, 1.75,
  0.5, 0.5, 0.5, 0.5, 1.75,
  0.5, 0.5, 0.5, 0.5, 1.75,
  0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5
]

use_synth :bass_foundation
use_synth_defaults attack: 0.1

live_loop :melody do
  with_fx :reverb do
    
    2.times do
      play :G3, sustain: 2
      sleep 2
      play :G4, sustain: 4
      sleep 4
      play_pattern_timed [:Fs4, :G4, :Fs4, :D4], [0.5]
      play :E4, sustain: 4
      sleep 4
      
      2.times do
        play :c4, sustain: 0.9
        sleep 1
      end
      play_pattern_timed [:C4, :B3, :A3, :B3], [0.5]
      
      play :G3, sustain: 2
      sleep 2
      play :G4, sustain: 4
      sleep 4
      play_pattern_timed [:Fs4, :G4, :A4, :Fs4], [0.5]
      play :E4, sustain: 2
      sleep 2
      play_pattern_timed [:D4, :E4, :D4, :B3], [0.5]
      2.times do
        play :c4, sustain: 0.9
        sleep 1
      end
      play_pattern_timed [:C4, :B3, :A3, :B3], [0.5]
    end
    play :G3, sustain: 10
    sleep 10
  end
end

kick =  [1,1,0,0,1,0,1,0,1,0,0,0,1,1,1,1]
snare = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
hat =   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]


live_loop :kick do
  ##| stop
  16.times do |hit|
    sample :bd_haus, hp4:30 if kick[hit] == 1
    sleep 0.5
  end
end

live_loop :Snare, sync: :kick, delay: 4 do
  ##| stop
  16.times do |hit|
    sample :sn_dolf, amp:rrand(1,1.5) if snare[hit] == 1
    sleep 0.5
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :hat, sync: :kick, delay: 10 do
  ##| stop
  16.times do |hit|
    sample mar, amp: 0.3, pan: rrand(-1,1)
    sample :drum_cymbal_closed,  release:0.3, amp: rrand(0.5, 1), pan: rrand(-1,1) if spread(13,16).tick
    sleep 0.25
  end
end
