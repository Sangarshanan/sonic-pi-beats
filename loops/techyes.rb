# Techyes: insk insk isnk

define :drums do
    use_random_seed 500
    16.times do
      sample :bd_haus, rate: 2, cutoff: 120 if rand < 0.35
      
      ##| # [:tabla_ke4, :drum_snare_soft, :bd_haus]
      ##| sample :tabla_ke4, rate: 2, cutoff: 80 if rand < 0.35
      
      # choose([:drum_tom_hi_soft, :tabla_ghe5, :bd_haus])
      ##| sample :drum_tom_hi_soft, rate: 2, cutoff: 120 if rand >= 0.35
      
      sleep 0.125
    end
  end
  
  define :bd do
    sample :bd_haus, cutoff: 100, amp: 2
    sleep 0.5
  end
  
  10.times do
    bd
  end
  
  in_thread(name: :frame) do
    loop do
      bd
    end
  end
  
  in_thread(name: :frame1) do
    loop do
      drums
    end
  end
