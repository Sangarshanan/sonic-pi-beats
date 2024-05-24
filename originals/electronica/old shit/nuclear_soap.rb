use_bpm 100

conga = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Conga1.wav"
stick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Stick1.wav"
mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

grid1= [
  1,0,1,0, 2,0,2,0,
  1,0,1,0, 2,0,1,0,
]

live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample conga, cutoff: 80, amp: 2 if grid1[index] == 1
    sample stick if grid1[index] == 2
    sleep 0.25
  end
end

live_loop :mar do
  sleep 1
  sample mar
  sleep 1
end


live_loop :hi_hat do
  sample :drum_cymbal_closed
  sleep 0.5
end

live_loop :printer_loop do
  ##| stop
  with_fx :ixi_techno, mix: 0.3, phase: 0.25 do
    sample :loop_3d_printer, rate: -2
  end
  sleep 6
end

live_loop :boom do
  ##| stop
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 3, rate: 1
  end
  sleep 8
end

live_loop :flibble do
  ##| stop
  sample :ambi_choir, rate: 0.3
  sample :tabla_dhec, rate: -1
  sleep 1
end


live_loop :chords do
  ##| stop
  use_synth :mod_beep
  play chord(:A4, :minor), amp: 0.8, decay: 2
  sleep 2
  play chord(:D4, :minor), amp: 0.8, decay: 2
  sleep 2
  play chord(:G4, :minor), amp: 0.8, decay: 2
  sleep 2
  play chord(:C4, :minor), amp: 0.8, decay: 2
  sleep 2
end
