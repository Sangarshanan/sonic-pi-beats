use_bpm 110

mel1 = ring(:f4, :e4, :f4, :d4, :f4, :c4, :f4, :b3)
t1 = ring(0.25,0.25,0.25,1,0.25,0.25,0.25,5)

mel2 = ring(:e4, :d4, :e4, :c4, :e4, :b3, :e4, :a3)

t2 = ring(0.25,0.25,0.25,0.25,0.25,0.25,0.25,5)

mel4 = ring(:a4, :g4, :a4, :f4, :a4, :e4, :a4, :d4)
mel5 = ring(:g4, :f4, :g4, :e4, :g4, :d4, :g4, :c4)


live_loop :melody do
  tick(:i)
  mel = [mel1, mel2, mel1, mel2, mel4, mel5, mel1, mel2].ring.look(:i)
  tt = [t1, t1, t1, t2].ring.look(:i)
  
  tick_reset(:ii)
  mel.length.times do
    use_synth :bass_foundation
    tick(:ii)
    play mel.look(:ii) -1, amp: 0.3, attack: 0.3, sustain: tt.look(:ii)
    sleep tt.look(:ii)
  end
end

grid1 = [1,0,2,0,   1,0,2,0,   1,0,2,0,   1,0,2,0]

live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample :drum_heavy_kick, cutoff: 70, amp: 0.3 if grid1[index] == 1
    sample :drum_splash_hard, cutoff: 70, rate: 3, beat_stretch: 0.5, amp: 0.3 if grid1[index] == 2
    
    sleep 0.25
  end
end

live_loop :clap do
  sample :sn_generic, rate: 3, amp: 0.3, cutoff: 70
  sleep 2
end
