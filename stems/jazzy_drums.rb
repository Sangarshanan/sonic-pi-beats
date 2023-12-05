# https://in-thread.sonic-pi.net/t/melody-improvisation/988/12

use_bpm 220

# FUNKY DRUMS
ghost = -> { rrand(0.1, 0.2) }
normal = -> { rrand(0.5, 0.6) }
accent = -> { rrand(0.8, 0.9) }

swing_time = 0.1
puts swing_time

define :play_kick do
  sample :elec_hollow_kick, amp: normal.call
  play :A1, amp: normal.call
end

define :play_charles do
  sample :drum_cymbal_pedal, attack:0.02, amp:normal.call, rate:1.1
end

live_loop :drums do
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
