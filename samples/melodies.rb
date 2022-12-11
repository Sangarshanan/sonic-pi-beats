# Melody techniques


# Basic Chords with FX

live_loop :chords_with_fx do
    use_synth :piano
    use_synth_defaults release: 1.5
    # :echo :reverb :slicer
    with_fx :reverb do
      
      play (ring, chord(:c3, :M7), chord(:a3, :m7), chord(:d3, :m7), chord(:g3, :major7)).tick, sustain: 1.25
      
      ##| play (ring, chord(:d4, :major7), chord(:b4, :major7), chord(:g4, :major7), chord(:a4, :maj)).tick, sustain: 1.25
      
      sleep 2
    end
  end


# Chords with dsaw Bassline

root_note = 55

live_loop :chords_with_bass do
tick
with_fx :reverb, room: 1, release: 4, mix: 0.4 do
    synth :piano, note: chord(ring(root_note,root_note-5,root_note+2,root_note-2).look-0, ring(:major,:major,:minor7,:major7).look, invert:ring(0,2,0,1).look), amp: 0.5, release: 6, hard: 0.3, vel: 0.5
    synth :dsaw, note: ring(root_note,root_note-5,root_note+2,root_note-2).look-24, sustain: 4, detune: 0.3, cutoff: 70
    sleep 4
end
end
