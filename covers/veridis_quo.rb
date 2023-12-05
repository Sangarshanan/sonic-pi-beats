use_bpm 110

mel1 = ring(:f4, :e4, :f4, :d4, :f4, :c4, :f4, :b3)
t1 = ring(0.25,0.25,0.25,1,0.25,0.25,0.25,5.5)

mel2 = ring(:e4, :d4, :e4, :c4, :e4, :b3, :e4, :a3)

t2 = ring(0.25,0.25,0.25,0.25,0.25,0.25,0.25,6.25)

mel4 = ring(:a4, :g4, :a4, :f4, :a4, :e4, :a4, :d4)
mel5 = ring(:g4, :f4, :g4, :e4, :g4, :d4, :g4, :c4)


live_loop :melody do
  tick(:i)
  mel = [mel1, mel2, mel1, mel2, mel4, mel5, mel1, mel2].ring.look(:i)
  tt = [t1, t1, t1, t2].ring.look(:i)
  
  tick_reset(:ii)
  mel.length.times do
    use_synth :organ_tonewheel
    tick(:ii)
    play mel.look(:ii) -1, amp: 0.3, release: 0.2, sustain: tt.look(:ii)
    sleep tt.look(:ii)
  end
end


kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"

grid1= [
  1,0,0,0,
  2,0,0,0,
]

live_loop :drum, sync: :melody do
  stop
  8.times do |index|
    puts index, grid1[index]
    sample kick, amp: 1.5 if grid1[index] == 1
    sample snare if grid1[index] == 2
    sleep 0.25
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"
live_loop :hihat, sync: :drum do
  stop
  sample mar, amp: 0.1
  sleep 0.5
end
