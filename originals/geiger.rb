use_bpm 120
use_random_seed 42069

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"
mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas3.wav"

grid1= [
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,3,0,
]


live_loop :drum, sync: :perc do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample kick, amp: 1.5 if grid1[index] == 1
    sample snare if grid1[index] == 2
    sample hat1 if grid1[index] == 3
    sleep 0.25
  end
end

live_loop :mar do
  ##| stop
  sample mar
  sleep [2,1].choose
end

live_loop :perc do
  sample "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Clave3.wav", amp: rrand(1, 1.5), release: rrand(0.6, 0.9)
  sleep [0.5, 1, 0.75, 0.25].choose
end

live_loop :clap, sync: :drum do
  ##| stop
  sample :sn_generic, rate: 3, amp: 0.7
  sleep 2
end
