use_bpm 100

kick1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks12.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats07.wav"
hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats10.wav"

k = [
  [1, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 1, 0],
  [1, 0, 0, 1, 2, 0, 0, 1, 1, 0, 0, 0, 2, 0, 1, 1],
  [1, 1, 0, 1, 2, 1, 0, 0, 1, 1, 0, 0, 2, 0, 0, 2]
]

bass = ring(57,57,59,60,55,53,52,52,55)
tb = ring(2,1,1,3,1,3,2,1,2)

with_fx :wobble, phase: 1, cutoff_max: 90, mix: 1 do
  sample "/Users/sangarshanan/Downloads/samples/ya_like_jazzz.wav"
end

live_loop :bass, sync: :kick do
  stop
  tick
  with_fx :wobble, phase: 1, cutoff_max: 90, mix: 1 do
    synth :dsaw, note: bass.look-24, release: 1
    sleep tb.look*0.5
  end
end

live_loop :kick do
  ##| stop
  r = rrand_i(0, 2)
  16.times do |i|
    use_random_seed 132
    sample kick1, amp: 5 if k[r][i] == 1
    sample snare, amp: 3 if k[r][i] == 2
    sleep 0.25
  end
end

define :h do |x, a, p, h|
  stop
  density x do
    sample h, amp: a, pan: p
    sleep 1
  end
end

live_loop :hat, sync: :kick do
  in_thread do
    with_fx :echo, decay: 2 do
      h 2, 0.5, rrand(-0.75, 0.75), hat1
    end
  end
  in_thread do
    h [4, 4, 4, 6, 6, 8, 12, 3].choose, 0.8, 0, hat2
  end
  h 2, 0.1, rrand(-0.25, 0.25), hat1
end


live_loop :synths, sync: :kick do
  stop
  use_synth :mod_saw
  use_synth_defaults amp: 0.2, attack: 0, sustain: 1, release: 0.25, mod_range: 12, mod_phase: 0.5, mod_invert_wave: 1
  notes = (ring :F, :C, :D, :D, :G, :C, :D, :D)
  notes.each do |n|
    tick
    play note(n, octave: 1), cutoff: (line 90, 130, steps: 16).look
    play note(n, octave: 2), cutoff: (line 90, 130, steps: 32).look
    sleep 1
  end
end

live_loop :melo, sync: :synths do
  stop
  tick(:i)
  with_fx :echo, phase: 0.75, decay: 6, mix: 0.9 do
    8.times do
      tick(:ii)
      synth :dtri, note: ring(61,63,56,58,51,52,58,59).look(:ii)+24, amp: 0.1
      sleep ring(0.25,0.5).look(:ii)
    end
  end
end
