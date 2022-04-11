# Super Mario: The Tune with some sprinkle

use_bpm 60
use_synth :pulse
use_synth_defaults release: 0.3, amp: 0.6

play_pattern_timed([:e5,:e5,nil,:e5,nil,:c5,:e5,nil,:g5], [0.15])
sleep 0.5
sample :perc_snap
sleep 0.5
play_pattern_timed([:c5,nil,nil,:g4,nil,nil,:e4,nil,
                    nil,:a4,nil,:b4,nil,:Bb4,:a4,nil], [0.15])
play_pattern_timed([:g4,:e5,:g5], [1/5.0])
play_pattern_timed([:a5,nil,:f5,:g5,
                    nil,:e5,nil,:c5,
                    :d5,:b4], [0.15])
sleep 0.5
sample :misc_burp