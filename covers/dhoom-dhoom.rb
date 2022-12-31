use_bpm 100

mel1 = ring(:e4, :b4, :a4, :b4, :a4, :b4, :g4, :a4 ,:b4, :a4, :g4 ,:f4)
mel2 = mel1.drop_last(2)
mel3 = ring(:d4 ,:e4 ,:f4 ,:g4 ,:f4 ,:e4 ,:d4 ,:f4 ,:e4 ,:f4, :e4)

t1 = ring(0.5,0.25,0.5,0.25,0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25)
t2 = ring(0.5,0.25,0.5,0.25,0.25,0.25,0.5,0.25,0.25,1)
t3 = ring(0.5,0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.5,0.25,0.5)


live_loop :dark_background do
  use_synth :dark_ambience
  play_pattern_timed scale(:e4, :minor), 5
end

live_loop :melody do
  tick(:i)
  mel = [mel1,mel2,mel1,mel3].ring.look(:i)
  tt = [t1,t2,t1,t3].ring.look(:i)
  
  tick_reset(:ii)
  mel.length.times do
    use_synth :prophet
    tick(:ii)
    play mel.look(:ii), sustain: 0.25, amp: 0.3, attack: 0.1
    sleep tt.look(:ii)
  end
end


live_loop :chords do
  use_synth :dsaw
  3.times do
    play chord(:E4, :minor), amp: 0.3, decay: 4
    sleep 4
  end
  play chord(:D4, :minor), amp: 0.3, decay: 4
  sleep 4
end

live_loop :beats do
  sample :bd_tek, amp: 0.5
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample  :drum_cymbal_soft, sustain: 0, release: 0.1, amp: 0.5
    sleep 0.5
  end
end
