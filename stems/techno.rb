# BEAT House dancy

drums = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/Drums125.wav"

live_loop :drums1 do
  stop
  with_fx :level do
    sample drums, amp: 0.9
    sleep (sample_duration drums)
  end
end

live_loop :drums2, sync: :tune1 do
  ##| stop
  with_fx :ixi_techno do
    sample drums, amp: 0.9
    sleep (sample_duration drums)
  end
end

# Trance

# Trance kick
live_loop :t_kick do
  ##| stop
  sample :bd_tek, amp: 4 if spread(1,4).look
  sample :bd_tek, amp: 4, pan: rdist(0.25) if spread(11,32).look
  sleep 1
end
  
# BASSLINE
live_loop :bass do
  ##| stop
  r = 1
  case r
  when 1
    rel = [0.25].choose
  when 2
    rel = [0.15,0.2,0.4].choose
  when 3
    rel = [0.15,0.25,0.25,0.25,0.5].choose
  end
  
  use_synth :saw
  use_synth_defaults release: rel, cutoff: [60,80,100,120].look
  n = :gs1
  play n, amp: 4
  play n+0.25, amp: 4, pan: rdist(0.25)
  play n+0.25+12, amp: 2, pan: rdist(0.5)
  sleep 0.25
end

