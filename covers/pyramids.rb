# Pyramids from Channel Orange

use_bpm 100

use_synth :prophet

notes = (ring :f5, :cs5, :c5)
quarter = 0.25
half = 0.5
full = 1
one_half = 1.5
double = 2


in_thread(name: :frame) do
  cue :frame
  loop do
    sample :ambi_choir, amp: half, beat_stretch: double
    sleep half
  end
end


define :quick_notes do |a|
  play a, amp: half
  sleep quarter
  play a, amp: half
  sleep half
  play a, amp: half
  sleep quarter
  play a, amp: half, sustain: full, release: full
  sleep double
end

notes.length().times do
  a = notes.tick
  
  play a, sustain: full, release: full, amp: half
  sleep one_half
  
  2.times do
    quick_notes a
  end
  
  play a, amp: half
  sleep half
end

play :as4, sustain: full, release: full, amp: half
sleep one_half

play :gs4, amp: half
sleep quarter
play :gs4, amp: half
sleep half
play :gs4, amp: half
sleep quarter
play :as4, sustain: full, release: full, amp: half
sleep double

play :gs4, amp: half
sleep half

4.times do
  play :as4, amp: half
  sleep half
end


