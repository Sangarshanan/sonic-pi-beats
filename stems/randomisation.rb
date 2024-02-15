# randomisation


# melody

use_synth :pluck
live_loop :mel do
  # 6 to 20
  # 40 to 50
  use_random_seed 50
  my_mel = ((scale :e, :minor) + (knit :e, 8) + (knit :r, 8)).shuffle.take(8)
  play my_mel.tick
  sleep 0.25
end

# bass
use_synth :pluck
live_loop :bas do
  use_random_seed 9 
  my_bas = ((chord :e2, :m9) + (knit :r, 8)).shuffle.take(8)
  play my_bas.tick
  sleep 0.25
end


# Arpeggiator

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

use_synth :tri
m_play_arpeggio(p_name: :min, p_length: 4, p_type: 3, p_has_basenote: false)
sleep 0.25
m_play_arpeggio(p_name: :min, p_length: 5, p_invert: 1, p_sleep: 1)
sleep 0.25
m_play_arpeggio(p_name: :min, p_length: 6, p_invert: 2, p_type: 1)
sleep 0.25
m_play_arpeggio(p_name: :min, p_length: 6, p_type: 2)


