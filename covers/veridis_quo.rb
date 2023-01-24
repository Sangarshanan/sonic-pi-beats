use_bpm 100

mel1 = ring(:f4, :e4, :f4, :d4, :f4, :c4, :f4, :b3)
t1 = ring(0.25,0.25,0.25,1,0.25,0.25,0.25,2)

live_loop :melody do
  tick(:i)
  mel = [mel1].ring.look(:i)
  tt = [t1].ring.look(:i)
  
  tick_reset(:ii)
  mel.length.times do
    use_synth :tech_saws
    tick(:ii)
    play mel.look(:ii), amp: 0.3, attack: 0.1, sustain: tt.look(:ii)
    sleep tt.look(:ii)
  end
end
