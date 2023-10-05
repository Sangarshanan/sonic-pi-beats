use_bpm 100

sarod = "/Users/sangarshanan/Downloads/samples/Indian/sarod1.wav"
live_loop :sarod  do
  stop
  with_fx :level do
    sample sarod, beat_stretch: 20
    sleep 20
    2.times do
      sample sarod, start: 0.5, beat_stretch: 20
      sleep 10
    end
    2.times do
      sample sarod, finish: 0.5, beat_stretch: 20
      sleep 10
    end
  end
end

guit = "/Users/sangarshanan/Downloads/samples/lofi/LofiJuice/kendrickFmin.wav"
live_loop :guit do
  ##| stop
  with_fx :octaver, mix: 0.5 do
    sample guit, beat_stretch: 20, amp: 0.4
    sleep 20
  end
end

live_loop :sarod_half  do
  ##| stop
  with_fx :panslicer do
    sleep 2.5
    sample sarod, beat_stretch: 21, start: 0.38, finish: 0.48, amp: 0.3
    sleep 2.5
  end
end

base_note = (scale :c2, :minor_pentatonic, num_octaves: 1).shuffle

live_loop :bass do
  ##| stop
  use_random_seed 3200
  8.times do
    n = base_note.tick
    synth :fm, note: n, amp: 0.5, release: 0, sustain: 2.5
    sleep 2.5
  end
end

sitar_acid = "/Users/sangarshanan/Downloads/samples/Indian/sitar-acid.wav"
live_loop :sitar_acid, sync: :drum_loop   do
  ##| stop
  with_fx :reverb do
    sample sitar_acid, finish: 0.5, beat_stretch: 20, amp: 0.5
    sleep 10
    sample sitar_acid, start: 0.5, beat_stretch: 20, amp: 0.5
    sleep 10
  end
end


drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :drum_loop, sync: :sarod do
  stop
  sample drum_loop, amp: 2, beat_stretch: 10
  sleep 10
end
