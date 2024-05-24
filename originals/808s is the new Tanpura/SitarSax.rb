use_bpm 100

sitar_1 = 0
sitar_2 = 1

sax = 0
chords = 1
sitar_repeat = 0

drum = 0

sitar = "/Users/sangarshanan/Downloads/samples/Indian/sitar1.wav"
live_loop :sitar, sync: :chords   do
  if sitar_1 < 1 then stop end
  with_fx :flanger do
    sample sitar, finish: 0.5, beat_stretch: 10, amp: 0.5
    sleep 5
    sample sitar, start: 0.5, beat_stretch: 10, amp: 0.5
    sleep 5
  end
end

sitar2 = "/Users/sangarshanan/Downloads/samples/Indian/sitar2.wav"
live_loop :sitar2, sync: :chords  do
  if sitar_2 < 1 then stop end
  with_fx :flanger do
    
    sample sitar2, finish: 0.5, beat_stretch: 20, amp: 0.2
    sleep 10
    sample sitar2, start: 0.5, beat_stretch: 20, amp: 0.2
    sleep 10
    
  end
end

live_loop :repeat_sitar, sync: :chords do
  if sitar_repeat < 1 then stop end
  
  with_fx :ping_pong, mix: 0.5 do
    3.times do
      sample sitar2, start: 0.75, beat_stretch: 20, amp: 0.1
      sleep 10
    end
  end
end

saz = "/Users/sangarshanan/Downloads/samples/Melody/Jazz/sax1.wav"
live_loop :saz, sync: :chords   do
  if sax < 1 then stop end
  with_fx :reverb do
    sample saz, beat_stretch: 20, amp: 0.5, rate: 0.5
    sleep 40
  end
end

chno = ring(62,69,67,68)
live_loop :chords do
  if chords < 1 then stop end
  
  with_fx :slicer , phase: 3, wave: 0, mix: 1 do
    tick
    synth :beep, note: chord(chno.look-12, :major7), sustain: 2.2, amp: 0.5
    sleep 2.5
  end
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (3).wav"
live_loop :drum_loop, sync: :chords do
  if drum < 1 then stop end
  
  sample drum_loop, finish: 0.5, amp: 3
  sleep (sample_duration drum_loop)/2
end
