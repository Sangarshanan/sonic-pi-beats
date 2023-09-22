# Oooman

use_bpm 60

grid = [0,1]

womaniya = "/Users/sangarshanan/Downloads/samples/OWomaniya.wav"
live_loop :chopped_woman, sync: :safari do
  ##| stop
  2.times do |index|
    puts index, grid[index]
    sleep 3.8
    sample womaniya, start: 0.8, finish: 0.95, amp: 3 if grid[index] == 1
    sample womaniya, finish: 0.1, amp: 4 if grid[index] == 0
    sleep 0.2
  end
end

live_loop :safari do
  stop
  sample :loop_safari, amp: 2, finish: 0.5
  sleep 4
end

with_fx :reverb do
  live_loop :vortex do
    use_random_seed rrand(100, 1000)
    use_synth :fm
    notes = (scale :c2, :minor_pentatonic, num_octaves: 1)
    16.times do
      play notes.choose, release: 0.5, amp: 0.5
      sleep 0.25
    end
  end
end


define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.125, amp: 0.5
  end
end

live_loop :synth1, sync: :safari do
  ##| stop
  use_synth :saw
  use_synth_defaults release: 5, cutoff: 60
  
  key = :f3
  chords = [
    chord(key, :M7),
    chord(key-5, :M7),
    chord(key-3, :M7),
  ]
  with_fx :reverb, mix: 0.5, room: 0.7 do
    with_fx :compressor do
      for chord in chords do
        play_times chord
        sleep 4
      end
    end
  end
end
