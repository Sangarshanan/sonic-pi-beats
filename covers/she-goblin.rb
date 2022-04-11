# An Excerpt from She- Tyler the Creator & Frank Ocean

use_bpm 65

define :acd_prog do
  play :As4, release: 0.5
  sleep 0.2
  play :Cs5, release: 0.5
  sleep 0.2
  play :Ds5, release: 2.5
  sleep 2
end

define :hook do
  
  use_synth :pretty_bell
  
  play :Ds5, release: 2.5
  sleep 2
  
  play :Cs5, release: 0.5
  sleep 0.2
  play :As4, release: 0.5
  sleep 0.2
  play :Gs4, release: 2.5
  sleep 2
  
  acd_prog
  
  play :Cs5, release: 1
  sleep 0.4
  play :As4, release: 1
  sleep 0.4
  play :Gs4, release: 2.5
  sleep 2
  
  play :Fs4, release: 1
  sleep 0.7
  play :F4, release: 2.5
  sleep 2
  play :Fs4, release: 1
  sleep 0.3
  play :Gs4, release: 2.5
  sleep 2
  
  acd_prog
  
  play :Cs5, release: 1
  sleep 0.4
  play :As4, release: 2.5
  sleep 2
  play :C5, release: 0.5
end

define :gdg_prog do
  play :Gs4
  sleep 0.6
  play :Ds4
  sleep 0.6
  play :Gs4
  sleep 0.4
  play :Gs4
  sleep 0.4
  play :Gs4
  sleep 0.4
  play :Ds4
  sleep 0.8
end

define :fdf_prod do
  play :Fs4
  sleep 0.6
  play :Ds4
  sleep 0.6
  play :Fs4
  sleep 0.4
  play :Fs4
  sleep 0.4
  play :Fs4
  sleep 0.4
  play :Ds4
  sleep 0.8
end

define :fcf_prod do
  play :F4
  sleep 0.6
  play :Cs4
  sleep 0.6
  play :F4
  sleep 0.4
  play :F4
  sleep 0.4
  play :F4
  sleep 0.4
  play :Cs4
  sleep 0.8
end

define :progression do
  gdg_prog
  gdg_prog
  fdf_prod
  fcf_prod
  fdf_prod
  fcf_prod
end

use_synth :prophet
progression
hook
use_synth :supersaw
progression

sample :ambi_lunar_land, beat_stretch: 3
