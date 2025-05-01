# https://in-thread.sonic-pi.net/t/markov-chains-for-beginners/5304
# SUCCESSION

use_bpm 120

a =[:C4,
    :B2, :C4, :D4, :C4, :Bb2, :Ab2, :Fs2, :G2, :Ab2, :G2,
    :G4, :F4, :Eb4, :Cs4, :D4, :Eb4, :D4,
    :D4, :C4, :B4, :Ab4, :G4, :F4, :Eb4, :D4
    ]

b = [3,
     0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1,
     0.5,0.5,0.5,0.5,0.5,0.5,0.5,
     0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1,
     ]

def to_markov(a,chain = {})
  a.each_with_index do |n, i|
    chain[n] = [] if !chain.key?(n)
    if a[i+1]
      next_n = a[i+1]
      chain[n].push(next_n)
    end
  end
  chain
end

melody_chain = to_markov a
rhythm_chain = to_markov b

print melody_chain
print rhythm_chain

note = melody_chain.keys.choose
rest = rhythm_chain.keys.choose

live_loop :markov do
  ##| stop
  with_fx :reverb, room: 0.8,mix: 0.6 do
    use_synth :piano
    with_fx :band_eq do
      play note, sustain: rest*0.9, release: rest*0.1, amp: 0.2
      sleep rest
      note = melody_chain[note].choose
      rest = rhythm_chain[rest].choose
    end
  end
end


cm = chord(:c3, '7')
ab = chord(:bb2, :minor)
dh_f = chord(:db3, :major)
f3 = chord(:f3, :minor)

live_loop :chord_progression do
  use_synth :hollow
  play cm, attack: 0.1, release: 3.5, sustain: 4
  sleep 4
  play ab, attack: 0.1, release: 3.5, sustain: 4
  sleep 4
  play dh_f, attack: 0.1, release: 3.5, sustain: 4
  sleep 4
  play f3, attack: 0.1, release: 3.5, sustain: 4
  sleep 4
end


