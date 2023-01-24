use_bpm 100

mela = ring(:e4, :c4).repeat(6) +
  ring(:a4, :c4, :e4, :c4, :e4, :c4, :b4) +
  ring(:d4, :e4).repeat(8) +
  ring(:d4)
tta = ring(0.5)

in_thread do
  1.times do
    
    tick(:i)
    melodya = [mela].ring.look(:i)
    timea = [tta].ring.look(:i)
    
    tick_reset(:ii)
    melodya.length.times do
      use_synth :piano
      tick(:ii)
      play melodya.look(:ii), amp: 0.3, attack: 0.1,  cutoff: 70, sustain: timea.look(:ii)
      sleep timea.look(:ii)
    end
  end
end

melb = ring(:a4, :e5).repeat(2) +
  ring(:b4, :e5).repeat(2) +
  ring(:c5, :e5).repeat(2) +
  ring(:d5, :e5).repeat(2)
ttb = ring(1, 2).repeat(8)

in_thread do
  sleep 20
  3.times do
    tick(:i)
    melody_main = [melb].ring.look(:i)
    time_main = [ttb].ring.look(:i)
    
    tick_reset(:ii)
    melody_main.length.times do
      use_synth :prophet
      tick(:ii)
      play melody_main.look(:ii), amp: 2, attack: 0.1,  cutoff: 60, sustain: time_main.look(:ii)
      sleep time_main.look(:ii)
    end
  end
end


mel2 = ring(:a3, :b3, :c4, :b3, :a3, :b3, :c4, :b3)
t2 =   ring(1, 1, 1, 1, 1, 1, 2, 2)

mel3 = ring(:f2, :g2, :a2, :g2, :f2, :f2,
            :g2, :g2, :a2, :a2, :g2, :g2).repeat(2)
t3 =   ring(3)

in_thread do
  sleep 10
  2.times do
    
    tick(:i)
    melody2 = [mel2, mel3].ring.look(:i)
    tt2 = [t2, t3].ring.look(:i)
    
    tick_reset(:ii)
    melody2.length.times do
      use_synth :dsaw
      tick(:ii)
      play melody2.look(:ii), sustain: tt2.look(:ii) - 0.25, amp: 0.3, attack: 0.1, cutoff: 70
      sleep tt2.look(:ii)
    end
  end
end

grid1 = [1,0,1,0,   2,0,0,1,   1,0,1,0,   2,0,0,0]
grid2 = [1,0,1,0,   2,0,0,1,   1,2,1,0,   2,0,0,0]

define :soul_beat do |grid|
  16.times do |index|
    puts index, grid[index]
    sample :drum_heavy_kick if grid[index] == 1
    sample :drum_snare_soft if grid[index] == 2
    sleep 0.25
  end
end

sleep 20
live_loop :drum1 do
  soul_beat grid1
  soul_beat grid2
end


live_loop :hi_hat do
  sample :drum_cymbal_closed
  sleep 0.5
end
