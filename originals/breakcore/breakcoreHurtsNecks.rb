use_bpm 120

live_loop :break, sync: :beat1 do
  ##| stop
  with_fx :reverb do
    sample "/Volumes/Roguentropy/samples/drum_loops/dnb/1.wav", beat_stretch: 10
    sleep 10
  end
end

def m_play_arpeggio(p_tonic: 60, p_name: :maj, p_length: 3, p_invert: 0, p_sleep: 2,
                    p_type: 0, p_random: 0, p_has_basenote: false, p_has_droplastnote: true)
  use_random_seed Time.new.to_i
  
  l_chord = (chord p_tonic, p_name, num_octaves: 4)
  
  l_chord = l_chord.drop(p_invert)
  
  l_basenote = l_chord.take(1) - 12
  print l_basenote
  
  l_chord = l_chord.take(p_length + p_random)
  print l_chord.notes
  
  # Jetzt mischeln wir diese, nehmen die ersten gemäss Anzahl und Sortieren
  l_chord = l_chord.shuffle.take(p_length).sort
  print l_chord.notes
  
  if p_type == 1
    l_chord = l_chord.reverse
  else
    if p_type == 2
      l_chord = l_chord.reflect
    else
      if p_type == 3
        l_chord = l_chord.reverse.reflect
      end
    end
  end
  
  if p_has_droplastnote == true && p_type > 1
    l_chord = l_chord.drop_last(1)
  end
  
  print l_chord.notes
  p_length_arp = l_chord.length
  
  if p_has_basenote
    play l_basenote, sustain: p_sleep
  end
  
  l_chord.each do |p_note|
    play p_note
    sleep p_sleep * 1.0 / p_length_arp
  end
end

live_loop :arp, sync: :beep do
  stop
  use_synth :gabberkick # :piano
  with_fx :reverb, amp: 0.8, mix: 0.5 do
    
    1.times do
      
      m_play_arpeggio(p_name: :min, p_length: 4, p_type: 3, p_has_basenote: false)
      
      ##| m_play_arpeggio(p_name: :min, p_length: 6, p_invert: 2, p_type: 1)
      
      ##| m_play_arpeggio(p_name: :min, p_length: 6, p_invert: 1, p_has_basenote: false)
      
      
      sleep 0.5
      
      3.times do
        m_play_arpeggio(p_name: :min, p_length: 3, p_type: 1, p_has_basenote: false)
        sleep 0.5
      end
      
      
    end
  end
end


live_loop :beep do
  with_fx :ping_pong, room: 0.8, mix: 0.6, amp: 0.5 do
    with_fx :echo, phase: 0.5, decay: 4 do
      play :c3, release: 0.3
      sleep 5
    end
  end
end


live_loop :beat1 do
  ##| stop
  effect = [:ixi_techno, :octaver, :wobble].choose
  with_fx effect, mix: rrand(0.4, 1) do
    sample :glitch_bass_g
  end
  sleep 5
end
