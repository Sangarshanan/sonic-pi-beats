# BEAT House dancy

drums = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/Drums125.wav"

live_loop :drums1 do
  stop
  with_fx :level do
    sample drums, amp: 0.9
    sleep (sample_duration drums)
  end
end

live_loop :drums2, sync: :tune1 do
  ##| stop
  with_fx :ixi_techno do
    sample drums, amp: 0.9
    sleep (sample_duration drums)
  end
end

