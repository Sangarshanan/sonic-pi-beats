use_bpm 80

kick =  [1,1,0,0,1,0,1,0,1,0,0,0,1,1,1,1]
snare = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
hat =   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

raga = "/Users/sangarshanan/Downloads/samples/raga-bhimpalasi.wav"


live_loop :kick do
  ##| stop
  16.times do |hit|
    sample :bd_fat, amp: 1.5 if kick[hit] == 1
    sleep 0.25
  end
end

live_loop :Snare do
  16.times do |hit|
    sample :sn_dolf, amp: 1.5 if snare[hit] == 1
    sleep 0.25
  end
end

live_loop :hat do
  ##| stop
  16.times do |hit|
    sample :drum_cymbal_closed,  release:0.3, amp: 0.000015, pan: rrand(-1,1) if spread(13,16).tick
    sleep 0.25
  end
end

live_loop :mel1, sync: :kick do
  ##| stop
  tick
  use_synth :organ_tonewheel #:saw
  root = :c1-knit(0,16*2, 4,16*2).look+12+knit(3,8, 7,8).look+12+12
  play root+[0,0,0,12].look, slide: 2
  play root+[0,0,12].look, release: [0.8,0.1,0.7,0.2,0.4].look
  sleep [2,1,1,2,1,1,1].look*0.5
end


live_loop :sam, sync: :kick do
  ##| stop
  with_fx :reverb do
    sample raga, amp: 0.6
    sleep (sample_duration raga) - 0.5
  end
end

live_loop :background do
  use_synth :growl
  play :gs2, attack: 5, release: 5
  sleep 5
end
