set_volume! 2

use_bpm 220

pm = "/Users/sangarshanan/Downloads/samples/songs/pm1.wav"
live_loop :pm_loop, sync: :chords do
  stop
  with_fx :reverb, mix: 0.5 do
    
    sample pm, amp: 2, beat_stretch: 120, finish: 0.034
    sleep 4
    sample pm, amp: 2, beat_stretch: 120, start: 0.034, finish: 0.08
    sleep 4
    sample pm, amp: 2, beat_stretch: 120, start: 0.13, finish: 0.2
    sleep 8
    
    
    use_random_seed 10  # 15, 10, 5
    
    # [1,2,3,4,5,6,77] # [79, 80, 81, 82, 83, 77].choose
    # [86, 87, 88, 89]
    
    4.times do
      sample pm, amp: 2, beat_stretch: 115, onset: [86, 87, 88, 89].choose
      sleep 4
    end
    
    sleep 8
    
    
  end
end

live_loop :fromMidiDevice do
  use_real_time
  n, vel = sync "/midi*/note_on"
  synth :piano, note: n, amp: 2, sustain: vel if vel > 0
end

live_loop :note, sync: :chords do
  stop
  use_synth :piano
  play 72, sustain: 8, amp: 0.5
  sleep 4
end

live_loop :chords do
  use_synth :piano
  with_fx :reverb, room: 0.8, mix: 0.6 do
    play [:c3, :e3, :f3, :a3], sustain: 8, amp: 2
    sleep 8
    play [:ds3, :g3, :a3, :d4], sustain: 8, amp: 2
    sleep 8
  end
end

live_loop :house_loop, sync: :chords do
  stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/house/1.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 2
    sleep 32
  end
end

# FUNKY DRUMS
ghost = -> { rrand(0.1, 0.2) }
normal = -> { rrand(0.5, 0.6) }
accent = -> { rrand(0.8, 0.9) }

swing_time = 0.1
puts swing_time

define :play_kick do
  sample :elec_hollow_kick, amp: 2
  play :A1, amp: normal.call
end

define :play_charles do
  sample :drum_cymbal_pedal, attack:0.02, amp:normal.call, rate:1.1
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks02.wav"

live_loop :drums do
  ##| stop
  
  # Two ways of modelling beats - with 0s and 1s OR with indexes
  [1, 0, 0, 0, 1, 0, 0, 0].each.with_index(1) do |kick, index|
    play_kick if kick == 1 and one_in(3)
    
    if index == 5
      play_charles
    end
    
    if [1,3,4,5,7,8].include? index
      # Rand here can be really nice
      sample :drum_cymbal_soft, amp: ((index == 3 or index == 7) ? accent.call*1.5 : normal.call ) #if rand < 0.8
    end
    
    
    # snare on 2 and 4
    if index == 5
      if one_in(4)
        sample :drum_snare_hard, amp: normal.call*0.8, pan: 0.4
      end
    end
    
    
    # And sometimes on the and of 4
    if (index % 2) == 0
      sample :drum_snare_soft, amp: normal.call if rand < 0.05
    end
    
    
    if(index % 2) == 0
      # offbeats need to be slightly late for swing
      sleep (0.5 - swing_time)
    else
      sleep (0.5 + swing_time)
    end
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :hihat, sync: :drums do
  ##| stop
  with_fx :reverb, mix: 0 do
    sample mar, amp: rrand(1.9, 2.4), rate: rrand(1.9, 2.1), cutoff: rrand(80, 120), pan: rrand(-0.25, 0.25)
  end
  sleep 1
end

