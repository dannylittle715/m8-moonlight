use_bpm 75

define :human_arp do |chord|
  intervals = [rrand(0.02, 0.06), rrand(0.02, 0.06), rrand(0.02, 0.06), rrand(0.02, 0.06)]
  play_pattern_timed chord, intervals
end

in_thread(name: :main) do
  with_fx :bitcrusher, bits: 12 do
    with_fx :reverb do
      with_fx :ping_pong, amp: 0.7 do
        1.times do
          cue :tick
          human_arp chord(:C, '6*9')
          sleep 1
        end
      end
      with_fx :ixi_techno, cutoff_min: 80, cutoff_max: 100, res: 0.8 do
        4.times do
          cue :tick
          human_arp chord(:F, :maj9)
          sleep 1
        end
      end
    end
  end
end


in_thread(name: :metronome) do
  16.times do
    sync :tick
    sleep 1
    
  end
end

