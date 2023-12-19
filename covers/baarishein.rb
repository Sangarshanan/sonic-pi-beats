use_bpm 90

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"


live_loop :mar do
  sample mar, amp: 0.1
  sleep 1
end


live_loop :chords do
  ##| stop
  use_synth :bass_foundation
  use_octave -1
  
  with_fx :reverb, cutoff: 10, release: 0.1, attack: 0.1 do
    play [:D4, :Fs4, :A4], sustain: 4
    sleep 4
    play [:B4, :D4, :Fs4], sustain: 4
    sleep 4
    play [:G4, :B4, :D4], sustain: 4
    sleep 4
    play [:D4, :Fs4, :A4], sustain: 2
    sleep 2
    play [:A4, :Cs4, :E4], sustain: 2
    sleep 2
  end
end

