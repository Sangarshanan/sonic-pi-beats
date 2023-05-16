# rapp snitch knishes

use_bpm 170

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap03.wav"

mel =
  ring(:B4,:A4,:G4,:Fs4,:D4,:B3,:D4).repeat(3) +
  ring(:Fs4,:E4,:D4,:Cs4,:A3,:Fs3,:A3).repeat(2) +
  ring(:Fs4,:Fs4,:E4,:Cs4,:B3,:Cs4,:Cs4,:A3,:B3) +
  ring(:Ds4,:Fs4,:Ds4).repeat(2) +
  ring(:D4,:Fs4,:D4,:A4,:A4,:A4,:Fs4,:Fs4,:A4,:Fs4,:A4,:Fs4,:A4)


tt =
  ring(1,0.5, 0.5,0.5,0.5,0.5,0.5).repeat(5) +
  ring(1,1,0.5,0.5,0.5,0.5,1,0.5,2.5) +
  ring(1,0.5,2.5).repeat(2) +
  ring(0.5,0.5,0.5,1,0.5,1,1,0.5,0.5,0.5,0.5,0.5,0.5)

live_loop :melody do
  tick(:i)
  mel.length.times do
    use_synth :pluck
    with_fx :ixi_techno, room: 80, release: 2, mix: 0.5 do
      tick(:ii)
      play mel.look(:ii), cutoff: 50, note_slide: 0.25, amp: 1.5, sustain: tt.look(:ii)
    end
    sleep tt.look(:ii)
  end
end


grid1 = [1,0,0,0,   2,0,0,1,   0,0,1,0,   2,0,0,1]

live_loop :drum1, sync: :melody do
  16.times do |index|
    puts index, grid1[index]
    sample kick if grid1[index] == 1
    sample snare if grid1[index] == 2
    
    sleep 0.5
  end
end


grid2 = [1,1,2,0,   1,0,1,0,   1,0,1,0,   1,0,1,0]

live_loop :drum2, sync: :drum1 do
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed if grid2[index] == 1
    sample :drum_cymbal_open, sustain: 0.3 if grid2[index] == 2
    
    sleep 0.5
  end
end


