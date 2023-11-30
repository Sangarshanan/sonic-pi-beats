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



