# Alt spaces: Sly Granny set

use_bpm 120 # this is the bpm of the set! (I suck at documentation)
# controls the master volume with my MIDI Controller
live_loop :volume_control do
  use_real_time
  control_num,val = sync "/midi:minilab3_midi:1/control_change"
  val_to_set = val.to_f/127*4 # Normalise
  puts "setting volume: #{val_to_set} "
  if control_num==74
    puts "controller number 21 detected: setting volume to #{val_to_set} "
    set_volume! (val_to_set)  # added *4
  elsif control_num==71
    val_to_set= (val.to_f+1)/128.0
    set :val_2 ,val_to_set
  elsif control_num==76
    val_to_set= (val.to_f+1)/128.0
    set :val_3 ,val_to_set
  elsif control_num==77
    val_to_set= (val.to_f+1)/128.0
    set :val_4 ,val_to_set
  elsif control_num==93
    val_to_set= (val.to_f+1)/128.0
    set :val_5 ,val_to_set
  elsif control_num==18
    val_to_set= (val.to_f+1)/128.0
    set :val_6 ,val_to_set
  end
end
"""
 Hello! I am @roguentropy
 Welcome to my music & coding dungeon/nerdom
 This set has is completely coded on Sonic Pi (Ruby)
 The reactive visuals are coded with Processing (Java)
 All of the code is up on Github Open source music ftw 
 I hope you enjoy :)
"""

# SAMPLES
dd1 = "/Volumes/Roguentropy/set-dosa/misc/dance-daddy_v.wav"
dd_other = "/Volumes/Roguentropy/set-dosa/misc/dance_other.wav"
dd2 = "/Volumes/Roguentropy/set-dosa/misc/dd_beat.wav"
vocal_loop1 = "/Volumes/Roguentropy/Samples/acapella/pookal-pookum.wav"
dis = "/Volumes/Roguentropy/Samples/drum_loops/misc/distorted1.wav"
chill_dub = "/Volumes/Roguentropy/Samples/drum_loops/dubstep/chill.wav"
sp_m = "/Volumes/Roguentropy/set-dosa/other.wav"
sp_2 = "/Volumes/Roguentropy/set-dosa/sleepy2.wav"
sp_2_other = "/Volumes/Roguentropy/set-dosa/other_2.wav"
spo1 = "/Volumes/Roguentropy/set-dosa/btbb1.wav"
spo2 = "/Volumes/Roguentropy/set-dosa/btbb2.wav"
clerb = "/Volumes/Roguentropy/Samples/memes/clerb.mp3"
run_file "/Volumes/Roguentropy/set-dosa/modules.rb"
# METRONOME
live_loop :met do
  sleep 0.937
end

live_loop :glitch_bass, sync: :hollow do
  stop
  effect = [:wobble, :panslicer, :ping_pong, :ixi_techno].choose
  with_fx effect, mix: rrand(0.4, 0.9) do
    sample [:glitch_perc3, :glitch_robot1].choose
  end
  sleep  7.5
end

live_loop :spon1, sync: :hollow do
  stop
  
  # Part 1
  
  with_fx :ixi_techno, mix: 0.8, amp: 8 do # :slicer, :reverb :ixi_techno
    sample spo1, beat_stretch: 15
    sleep 15
    2.times do
      sample spo1, beat_stretch: 15, start: 0.62
      sleep 5
    end
  end
  
  # Part 3
  
  ##| with_fx :reverb, amp: 8 do
  ##|   sample spo2, beat_stretch: 20 # rate: -1
  ##|   sleep 30
  ##| end
  
end

live_loop :mel_random, sync: :hollow  do
  stop
  
  # 0, 40, 50, 6, 20
  use_random_seed 0
  with_fx :reverb, amp: 1.1 do
    use_synth :pluck
    my_mel = ((scale :e, :minor) + (knit :e, 8) + (knit :r, 8)).shuffle.take(8)
    play my_mel.tick, sustain: 1.5
    sleep 0.233 # 0.233 0.937
  end
end

live_loop :memes, sync: :hollow do
  stop
  with_fx [:reverb].choose, mix: 0.4, amp: 12 do
    sample clerb, start: 0.39, finish: 0.51, beat_stretch: 65
    sleep 30
  end
end


### Sleepy Pei ###

live_loop :sleep_p, sync: :hollow  do
  stop
  
  # first beat
  
  with_fx :reverb, mix: 0.3 do
    sample sp_m, beat_stretch: 15, amp: 4
    sleep 15
  end
  
  # uncomment chill_dub in break
  
  ##| sample sp_2_other, beat_stretch: 15, amp: 3
  ##| sleep 15
  
  # comment break before playing this (drums alredy exist)
  
  ##| sample sp_2, beat_stretch: 15, amp: 3
  ##| sleep  15 # 15 14.8
  
  # make 14.8 before running next time
  # the comment out everything except the last part, uncomment knob3
  
  ##| sp_full = "/Volumes/Roguentropy/set-dosa/sleepy_full.wav"
  ##| sample sp_full, amp: 3, beat_stretch: 330
  ##| sleep 330
  
  # Knob 3
  
  ##| amp3=get(:val_3)
  ##| with_fx :lpf, amp: amp3 do
  
  ##|   sample sp_m, beat_stretch: 15, amp: 4
  ##|   sleep 15
  
  ##| end
  
end

#### Break Da Da Da Drums ###

live_loop :break1, sync: :hollow do
  stop

  ##| sample clerb, start: 0.39, finish: 0.7, amp: 12
  ##| sleep 15
  
  1.times do
    with_fx :reverb do
      sample dis, amp: 6, beat_stretch: 30
      sleep 30
    end
  end
  
  ##| 1.times do
  ##|   with_fx :reverb do
  ##|     sample chill_dub , beat_stretch: 7.5, amp: 5
  ##|     sleep 7.5
  ##|   end
  ##| end
  
  ##| for darbari
  
  ##| trap_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/Trap/loop4.wav" # 3, 4
  ##| with_fx :band_eq, amp: 3 do #  :bpf :hpf
  ##|   sample trap_loop1, beat_stretch: 30
  ##|   sleep 30
  ##| end
  
end

### Darbari Kanada ###

live_loop :vocal_darbari, sync: :hollow  do
  stop
  
  with_fx :reverb, amp: 2.5 do
    
    # Part 1
    
    ##| sample vocal_loop1, beat_stretch: 150, finish: 0.28
    ##| sleep 37.5
    
    5.times do     # First part to uncomment
      sample vocal_loop1, beat_stretch: 150, start: 0.213, finish: 0.25
      sleep 3.75
    end
    
    ##| sample vocal_loop1, beat_stretch: 150, start: 0.15, finish: 0.215
    ##| sleep 7.5
    ##| 4.times do
    ##|   sample vocal_loop1, beat_stretch: 150, start: 0.213, finish: 0.25
    ##|   sleep 3.75
    ##| end
    
    
    # Part 2
    
    ##| 1.times do
    ##|   sample vocal_loop1, beat_stretch: 150, start: 0.9
    ##|   sleep 7.5
    
    ##|   sample vocal_loop1, beat_stretch: 150, start: 0.72, finish: 0.785
    ##|   sleep 7.5
    ##| end
    
    ##| 2.times do
    ##|   sample vocal_loop1, start: 0.764, finish: 0.78
    ##|   sleep 3.75
    ##| end
    ##| 4.times do
    ##|   sample vocal_loop1, start: 0.764, finish: 0.78
    ##|   sleep 0.937
    ##| end
    ##| 1.times do
    ##|   sample vocal_loop1, start: 0.764, finish: 0.78
    ##|   sleep 3.75
    ##| end
    
    
    # Knob 4
    ##| amp4=get(:val_4)
    ##| with_fx :lpf, amp: amp4 do
    ##|   4.times do
    ##|     sample vocal_loop1, beat_stretch: 150, start: 0.213, finish: 0.28, amp: 3
    ##|     sleep 7.5
    ##|   end
    ##| end
    
    
  end
  
end


### YorkShire Trap bro ###

ytp = "Users/sangarshanan/Downloads/set-dosa/misc/ytp1.wav"
live_loop :ytp, sync: :hollow  do
  stop
  
  with_fx :reverb do
    sample ytp, amp: 5, finish: 0.58
    puts sample_duration ytp
    sleep 15
  end
  
  ##| ytp_f = "/Volumes/Roguentropy/set-dosa/misc/YorktownPuddle.wav"
  ##| sample ytp_f, amp: 5
  ##| sleep sample_duration ytp_f
    
  # comment out after running
  
  ##| with_fx :reverb do
  ##|   sample ytp, amp: 4, finish: 0.58
  ##|   puts sample_duration ytp
  ##|   sleep 15
  ##| end
  
end

### Dance Dance Vibes ###

live_loop :full_beat1, sync: :hollow do
  stop
  no = "/Volumes/Roguentropy/Samples/drum_loops/techno/1.wav"
  with_fx [:ixi_techno, :band_eq].choose  do # :ixi_techno, :band_eq
    sample no, amp: 3, beat_stretch: 30
    sleep 30
  end
end

live_loop :meri_dance_dance, sync: :hollow  do
  stop
  
  in_thread do
    with_fx :panslicer, mix: 0.6  do
      sample dd_other, beat_stretch: 68, finish: 0.88, amp: 2.5
      sleep 60
    end
  end
  
  sleep 60 ## !! comment out when running knob: 5 for the drop
  
  # comment out immediately after running

  ##| with_fx :reverb, mix: 0.6  do
  ##| sample dd1, beat_stretch: 68, finish: 0.88, amp: 8
  ##| sleep 60
  ##| end
  
  # Knob: 5 # comment out immediately after running
  
  ##| amp5=get(:val_5)
  ##| with_fx :lpf, amp: amp5 do
  ##|   1.times do
  ##|     with_fx :band_eq, mix: 0.9  do # :lpf :band_eq
  ##|       sample dd2, beat_stretch: 15, amp: 4
  ##|       sleep 15
  ##|     end
  ##|   end
  ##| end
  
end

#### Konnakol & Break ####


bm1 = "/Volumes/Roguentropy/set-dosa/1/BlackMagic/original.mp3"

live_loop :black_magic, sync: :full_beat1  do
  stop
  
  with_fx :band_eq do
    sample bm1, beat_stretch: 290, finish: 0.025, amp: 2
    sleep 7.5
  end
  
  # Knob: 6
  ##| amp6=get(:val_6)
  ##| with_fx :lpf, amp: amp6 do
  ##|   sample bm1, beat_stretch: 290, start: 0.522, finish: 0.548, rate: 1, amp: 2
  ##|   sleep 7.5
  ##| end
  
end

live_loop :kick1, sync: :full_beat1 do
  stop
  sample chill_dub, onset: 0, amp: 3
  sleep 0.937
end

live_loop :diagonal, sync: :hollow  do
  stop
  
  f1 = "/Volumes/Roguentropy/set-dosa/1/Diagonal_rmx/1.wav"
  full = "/Volumes/Roguentropy/set-dosa/1/Diagonal_rmx/full_audio.wav"
  
  with_fx :hpf, mix: 0.9 do
    sample f1, beat_stretch: 7.5, amp: 2.5
    sleep 7.5
  end
  
  # comment out full_beat1, #kick1, upper line and comment out below
  # comment immediately after running
  
  ##| sample full, amp: 2.5
  ##| sleep 658
  
  ##| with_fx :lpf do # :ixi_techno :lpf
  ##|   sample full, start: 0.917, finish: 0.923, amp: 1
  ##|   sleep 3.75
  ##| end
  
end

chanpam = "/Volumes/Roguentropy/set-dosa/jungle.wav"
live_loop :champam, sync: :diagonal do
  stop
  
  sample chanpam, beat_stretch: 330
  sleep sample_duration chanpam
  
  # Uncomment below line and comment above line before running
  
  ##| sample chanpam, beat_stretch: 330, start: 0.96
  ##| sleep 9.5
  
end

ld1 = "/Volumes/Roguentropy/set-dosa/chae_liquid_dream/ld1.wav"
live_loop :ld1, sync: :champam do
  stop
  
  sample ld1   # comment out after running
  sleep sample_duration ld1
  
  # Uncomment below line and comment above line before running
  
  
  ##| sample ld1, start: 0.99
  ##| sleep 10
  
end

yaku = "/Volumes/Roguentropy/set-dosa/Yaku.wav"
live_loop :yaku, sync: :ld1 do
  stop
  
  sample yaku   # comment out after running
  sleep sample_duration yaku
  
  ##| sample ld1, start: 0.99
  ##| sleep 10
  
end
