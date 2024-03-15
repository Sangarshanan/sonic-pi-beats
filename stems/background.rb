## Dark

live_loop :dark_background do
    use_synth :dark_ambience
    play_pattern_timed scale(:e3, :major_pentatonic), 5
  end

## Choir

with_fx :reverb do
  in_thread do
    loop do
      r = [0.5, 0.75, 1].choose
      8.times do
        sample :ambi_choir, rate: r, pan: rrand(-1, 1)
        sleep 0.5
      end
    end
  end
end

# Play around with rates
live_loop :beats do
  sample :guit_em9, rate: [0.25, 0.5, -1].choose, amp: 2
  sleep 8
end

live_loop :beats do
  sample :glitch_perc1, rate: [0.25, 0.5, -1].choose, amp: 0.5
  sleep 2
end

# Random rate piano
live_loop :piano, auto_cue: false do
  with_fx :slicer, phase: 0.25, wave: 1 do
    sample :ambi_piano, amp: 2, rate: [1,-1,2,1.5].choose
    sleep 2
  end
end

# Fx sound effects
with_fx :wobble, phase: 2, cutoff_max: 80, cutoff_min: 20, mix: 0 do
  synth :dsaw, note: 20, release: 10, amp: 0.2
end

# Hollow
live_loop :hollow do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 4
  sleep 3
end


# Haunting sine waves

use_synth :sine
use_random_seed 100
fadeAt = 236

define :liss do |p,t,b| # sets up two beating sime waves
  n=play p,release: t,amp: 0,pan: -1
  n2=play p+b,release: t,amp: 0,pan: 1
  control n,amp: 1,amp_slide: t/2.0 #fade in (release fades out again)
  control n2,amp: 1,amp_slide: t/2.0 #fade in (release fades out again)
end

with_fx :gverb, room: 20,mix: 0.7 do
  with_fx :panslicer, phase: 2,wave: 3 do |s| #pan slice at changing rates
    set :s,s #save pointer to panslicer
    with_fx :level,amp: 0 do |v| #envelope to fade in at start out at end
      at [0,fadeAt],[1,0] do |a|
        control v,amp: a,amp_slide: 4
        if a==0
          sleep 4
        end
      end
      
      live_loop :haunt do
        p=rrand_i(72,84)
        t=rrand(4,12)
        b=rrand(0.1,0.4)
        liss p,t,b
        sleep t
        control get(:s), phase: rrand(0.20,1) #change pansliceer rate
      end
      
      live_loop :haunt2,delay: 0.2 do #2nd pair of sines delayed start
        p=rrand_i(72,84)
        t=rrand(4,12)
        b=rrand(0.1,0.4)
        liss p,t,b
        sleep t
      end
      
      live_loop :haunt3,delay: 0.4 do #3rd pair of sines delayed and octave lower
        p=rrand_i(60,72)
        t=rrand(4,12)
        b=rrand(0.1,0.4)
        liss p,t,b
        sleep t
      end
    end
  end
end


### Noise

live_loop :noise do
  use_synth :noise
  use_synth_defaults attack: 4, sustain: 12, release: 4 # de/increase from 1 to whatever to go from single notes to a sound plane
  4.times do
    with_fx :rbpf, centre: (scale(:c4, :minor_pentatonic, num_octaves: 3).choose), res: 0.95 do # change scale for melody/harmony and resonance for noise to notes
      with_fx :slicer, phase: [0.35, 0.65, 0.85].choose do
        with_fx :slicer, phase: 0.25, pulse_width: 0.8, smooth: 0.1, invert_wave: 1 do # interleave slicer to create rhythmic complexity
          play :c1, amp: 1
        end
      end
    end
    sleep 1
  end
end

