# https://in-thread.sonic-pi.net/t/psytrance-loop-bass-line-kick/8399/2

use_bpm 150

with_fx :reverb do
  
  # Trance kick
  live_loop :t_kick do
    ##| stop
    sample :bd_tek, amp: 4 if spread(1,4).look
    sample :bd_tek, amp: 4, pan: rdist(0.25) if spread(11,32).look
    sleep 1
  end
  
  n = :ds1
  
  # NOISE
  live_loop :noise do
    n2 = n+[24,24,24,24,36].look
    n2 = n+24
    with_fx :ping_pong,phase: 0.75 do
      play n2+12+12, amp: 0.3 if (spread(1,16)).look
      play n2+12, amp: 0.2 if (spread(7,16)).look
    end
    sleep 0.25
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
    play n, amp: 4
    play n+0.25, amp: 4, pan: rdist(0.25)
    play n+0.25+12, amp: 2, pan: rdist(0.5)
    sleep 0.25
  end
  
end

