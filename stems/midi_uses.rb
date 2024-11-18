
# Trigger samples

use_bpm 120

set :kv,0
live_loop :trigger_sample do
  use_real_time
  # MIDI to trigger
  note, velocity = sync  "/midi:minilab3_midi:10/note_on"
  
  if velocity>0 then
    
    # Sample to Trigger
    with_fx :ixi_techno, phase: 0.5, res: 0.5, mix: 0.8 do
      synth :fm,note: hz_to_midi(80)  ,release: 20
      synth :fm,note: hz_to_midi(82)  ,release: 20
      sleep 7.5
    end
    
  else
    kill get(:kv)
  end
end
