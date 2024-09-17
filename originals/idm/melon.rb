use_bpm 150

live_loop :arovane_beat do
  ##| stop
  with_fx :bpf do # :reverb :bpf
    
    sample :arovane_beat_c, beat_stretch: 20, finish: 0.5
    
    sleep 10
  end
end

live_loop :start do
  with_fx :reverb do
    play :b2 , sustain: 1.7, release: 0.3, note_slide: 2, amp: 0.5 do |s|
      control s, note: :b1
    end
    sleep 10
  end
end

live_loop :flibble do
  use_random_seed 12
  
  with_fx :ixi_techno do
    sample :bd_haus, amp: 2
    sleep 2.5
  end
end

chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring
live_loop :deep_bass2 do
  ##| stop
  use_synth :dsaw
  effect = [:slicer, :reverb, :ixi_techno, :ping_pong].choose
  with_fx effect, lpf: 70, amp: 0.2, amp_slide: 2 do |fx|
    control fx, amp: 1
    3.times do
      play chords[0]
      sleep 2.5 # 0.25
    end
    play chords[2]
    sleep 1.25
    play chords[1]
    sleep 1.25
    c = chords.tick
  end
end

live_loop :synth, sync: :flibble do
  ##| stop
  use_synth_defaults release: 5, sustain: 0
  use_synth :gabberkick
  
  with_fx :slicer, phase: 0.5, invert_wave: 1, mix: 0.3 do
    with_fx :reverb, mix: 0.7 do
      
      with_fx :ixi_techno, cutoff: 80 do
        
        play chord(:C3, :major7, invert: 0)
        sleep 10
        play chord(:Ab3, :major7, invert: 0)
        sleep 10
        play chord(:Eb3, :major7, invert: 0)
        sleep 10
        play chord(:Bb, :major7, invert: 0)
        sleep 10
      end
    end
  end
end

