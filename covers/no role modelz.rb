use_bpm 190

_common_mel = ring(:C5, :C5, :As4, :Gs4, :As4, :Gs4, :g4, :f4, :c4, :c4)
t1 = ring(1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 3)
t2 = ring(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 2)

mid_mel = ring(:C5, :C5, :As4, :Gs4, :f4, :c4, :c4)
t3 = ring(1, 0.5, 0.5, 2, 1, 1, 3)

end_mel = _common_mel[1.._common_mel.length]
main_mel = _common_mel +  end_mel
tt_main = t1+t2

mel = (main_mel * 2) + (mid_mel + end_mel)
tt = (tt_main * 2) + (t3 + t2)


live_loop :melody, sync: :kick do
  ##| stop
  tick(:i)
  mel.length.times do
    use_synth :tech_saws
    with_fx :reverb do
      with_fx :krush do
        tick(:ii)
        play mel.look(:ii), amp: 0.2, sustain: tt.look(:ii) - 0.5, pitch: 1.5
      end
    end
    sleep tt.look(:ii)
  end
end

live_loop :chords do
  ##| stop
  use_synth :fm
  3.times do
    play [ :cs4, :f4, :g4 ]
    sleep 2
  end
  5.times do
    play [ :cs4, :f4, :a4 ]
    sleep 2
  end
  3.times do
    play [ :g3, :c4, :f4 ]
    sleep 2
  end
  5.times do
    play [ :c4, :ds4, :g4 ]
    sleep 2
  end
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats01.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare01.wav"

live_loop :kick do
  ##| stop
  with_fx :reverb, amp: 5 do
    sample kick
    sleep 6
    sample kick
    sleep 4
    sample kick
    sleep 6
    sample kick
    sleep 2
    sample kick
    sleep 4
    sample kick
    sleep 4
    sample kick
    sleep 6
  end
end

define :pattern1 do |pattern|
  sleep 4
  sample pattern
  sleep 8
  sample pattern
  sleep 8
  sample pattern
  sleep 8
  sample pattern
  sleep 4
end

live_loop :hat1 do
  with_fx :compressor, amp: 2 do
    pattern1 hat1
  end
end

sleep 32
live_loop :snare do
  with_fx :flanger, amp: 2 do
    pattern1 snare
  end
end

hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats02.wav"
live_loop :hat do
  ##| stop
  sample hat2, amp: 0.1
  sleep 1
end
