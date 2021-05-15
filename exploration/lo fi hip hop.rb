use_bpm 55

define :human_arp do |chord|
  intervals = [rrand(0.02, 0.06), rrand(0.02, 0.08), rrand(0.02, 0.1), rrand(0.02, 0.1)]
  play_pattern_timed chord, intervals, release: 0.5
end


in_thread(name: :chords) do
  with_fx :bitcrusher, bits: 10 do
    with_fx :reverb do
      with_fx :ping_pong, amp: 0.7 do
        # full song: 4 times
        1.times do
          2.times do
            sync :measure
            human_arp chord(:C, '6*9')
            sleep 3.5
          end
          1.times do
            sync :measure
            sample :guit_e_slide
            human_arp chord(:F, :maj9)
            sleep 3.5
            sync :measure
            human_arp chord(:F, :maj9)
            sleep 3.5
          end
        end
        
        # full song: 8 times
        2.times do
          2.times do
            sync :measure
            human_arp (ring :Bb3, :A4, :D4, :G4, :E5)
            sleep 3.5
          end
          2.times do
            sync :measure
            human_arp chord(:A3, :m11)
            sleep 3.5
          end
        end
        
        # full song: 8 times
        2.times do
          2.times do
            sync :measure
            human_arp chord(:F3, :m9)
            sleep 0.5
            human_arp (ring :C4, :Eb4, :F4) if one_in(2)
            sleep 3
          end
          2.times do
            sync :measure
            human_arp (ring :F4, :B4, :G5, :Eb5, :Bb5)
            sleep 0.5
            human_arp (ring :B4, :F5, :Ab5) if one_in(2)
            sleep 3
          end
        end
        
        # full song: 8 times
        2.times do
          2.times do
            sync :measure
            human_arp (ring :Bb3, :A4, :D4, :G4, :E5)
            sleep 3.5
          end
          2.times do
            sync :measure
            human_arp chord(:A3, :m11)
            sleep 3.5
          end
        end
        
        # full song: 4 times
        1.times do
          2.times do
            sync :measure
            human_arp chord(:C, '6*9')
            sleep 3.5
          end
          1.times do
            sync :measure
            sample :guit_e_slide
            human_arp chord(:F, :m6)
            sleep 3.5
            sync :measure
            human_arp chord(:F, :m9)
            sleep 3.5
          end
        end
        
      end
    end
  end
end


in_thread(name: :drums) do
  
  16.times do
    sync :beat
    sample :bd_gas
    sleep rrand(0.35, 0.4)
    sample :elec_tick if one_in(2)
    sleep rrand(0.35, 0.4)
    sample :elec_plip if one_in(2)
    sync :beat
    sleep rrand(0, 0.06)
    sample :perc_snap, amp: 0.4 if one_in(4)
    sample :mehackit_phone1, amp: 0.5 if one_in(4)
    sample :drum_snare_soft, rate: 0.7, finish: 0.8
    sleep 0.4
    sample :elec_tick
    sleep 0.5
    sync :beat
    sample :bd_gas
    sleep 1
    sync :beat
    sample :perc_snap, amp: 0.4 if one_in(4)
    sample :glitch_perc1, amp: 0.5,  finish: 0.2, release: 0.2  if one_in(3)
    sample :drum_snare_soft, rate: 0.7, finish: 0.8
    sleep 1
  end
end


in_thread(name: :metronome) do
  16.times do
    cue :measure
    cue :beat
    sleep 1
    cue :beat
    sleep 1
    cue :beat
    sleep 1
    cue :beat
    sleep 1
  end
end


10.times do
  sample :vinyl_hiss, release: 0.1, attack: 0.1, amp: 0.4
  sleep 7.9
end

