# Trap beat https://gist.github.com/interstar/4ed48718cb44ae6d9715988ae160e3f1

use_bpm 145

# Kicks
def kick(v)
  sample :bd_mehackit, amp: 2*v
end

# The regular kick
live_loop :kick1 do
  kick(1)
  sleep 5
  kick(1)
  sleep 3
end

# the irregular "bounce" kick
live_loop :kick2 do
  v=[0,0,0,0,0.7,0.9].choose
  kick(v)
  sleep 7
end

# The 808 / bass
def _808(p,v,d)
  play p-24, amp: v, attack: 0.3, decay: d, sustain: 0, release: 0.5
end

def snare(v)
  sample :sn_generic, rate: 2, amp: 3*v, attack: 0, sustain: 0, release: 0, decay: 0.06
  sample :drum_snare_hard, rate: 2, amp: 1.5*v, attack: 0.01, sustain: 0, release: 0, decay: 0.03
end

with_fx :distortion do
  live_loop :snare do
    vs = [0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,1]
    vs.each {
      |v|
      snare(v)
      sleep 1
    }
  end
end

def hat(v)
  sample :drum_cymbal_closed, amp: 1.5*v, attack: 0, decay: 0.01, sustain: 0, release: 0
end

live_loop :hats do
  a = [0,0,0,1,1,2,2,2,2].choose
  case a
  when 0
    8.times do
      hat(1)
      sleep 0.5
    end
  when 1
    8.times do
      hat(1)
      sleep 0.25
    end
  when 2
    2.times do
      hat(1)
      sleep 0.3
      hat(1)
      sleep 0.3
      hat(1)
      sleep 0.4
    end
  end
end

#### Melodies ####

loop2 = "/Users/sangarshanan/Downloads/samples/Hiphop-Samples/loop2.wav"
live_loop :loop2 do
  with_fx :slicer, mix: 0.5 do
    sample loop2, amp: 0.8, beat_stretch: 40
    sleep 40
  end
end


## Density Trap ##

hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats02.wav"

define :hatty do |d|
  density d do
    sample hat1, onset: 0, amp: 2, release: 0.1, attack: 0.1
    sleep 1
  end
end

live_loop :hatty do
  hatty (ring, 6,8,10,8,6).choose
end


