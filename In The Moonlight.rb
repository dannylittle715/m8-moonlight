use_bpm 60
##| use_bpm 150


define :human_arp do |chord|
  intervals = [rrand(0.02, 0.1), rrand(0.02, 0.1), rrand(0.02, 0.1), rrand(0.02, 0.1)]
  play_pattern_timed chord, intervals, release: 0.5
end

define :intro_loop do |n|
  n.times do
    2.times do
      sync :measure
      human_arp chord(:D, :m9)
      sleep 3.5
    end
    2.times do
      sync :measure
      human_arp (ring :G3, :B3, :F4, :A4, :E5)
      sleep 3.5
    end
  end
end

define :a_section_loop do |n, synth|
  use_synth synth
  n.times do
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
end

define :b_section_loop do |n|
  n.times do
    2.times do
      sync :measure
      human_arp (ring :Bb3, :A4, :D4, :G4, :E5)
      sleep 3.4
    end
    2.times do
      sync :measure
      human_arp chord(:A3, :m11)
      sleep 3.4
    end
  end
end

define :c_section_loop do |n|
  n.times do
    2.times do
      sync :measure
      human_arp chord(:F3, :m9)
      sleep 0.5
      human_arp (ring :C4, :Eb4, :F4) if one_in(2)
      sleep 2.8
    end
    2.times do
      sync :measure
      human_arp (ring :F4, :B4, :G5, :Eb5, :Bb5)
      sleep 0.5
      human_arp (ring :B4, :F5, :Ab5) if one_in(2)
      sleep 2.8
    end
  end
end

define :a2_section_loop do |n|
  n.times do
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
      human_arp chord(:F, :m6)
      sleep 3.5
    end
  end
end

define :drum_loop_1 do |n|
  n.times do
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

define :drum_loop_1_low_cut do |n|
  n.times do
    sync :beat
    sample :bd_gas, cutoff: 40
    sleep rrand(0.35, 0.4)
    sample :elec_tick, cutoff: 80 if one_in(2)
    sleep rrand(0.35, 0.4)
    sample :elec_plip, cutoff: 80 if one_in(2)
    sync :beat
    sleep rrand(0, 0.06)
    sample :perc_snap, amp: 0.4, cutoff: 80 if one_in(4)
    sample :mehackit_phone1, amp: 0.5, cutoff: 80 if one_in(4)
    sample :drum_snare_soft, rate: 0.7, finish: 0.8, cutoff: 60
    sleep 0.4
    sample :elec_tick, cutoff: 80
    sleep 0.5
    sync :beat
    sample :bd_gas, cutoff: 40
    sleep 1
    sync :beat
    sample :perc_snap, amp: 0.4, cutoff: 80 if one_in(4)
    sample :glitch_perc1, amp: 0.5,  finish: 0.2, release: 0.2, cutoff: 80  if one_in(3)
    sample :drum_snare_soft, rate: 0.7, finish: 0.8, cutoff: 60
    sleep 1
  end
end


define :bass_intro do |n|
  use_synth :tb303
  n.times do
    sync :measure
    play :D2, release: 0.4, cutoff: 50
    sleep 3.5
    play :A1, release: 0.4, cutoff: 50
    sleep 0.4
    sync :measure
    play :D2, release: 0.4, cutoff: 50
    sleep 1.9
    sync :beat
    play_pattern_timed(ring :D1, :E1, :F1, :Fs1), [0.5, 0.5, 0.25, 0.4], release: 0.4, cutoff: 50
    sync :beat
    play :G1, release: 0.5, cutoff: 60
    sleep 2
    sync :measure
    play :G1, release: 0.5, cutoff: 60
    sleep 1.9
    sync :beat
    play_pattern_timed(ring :A1, :G1, :F1, :E1), [0.5, 0.5, 0.25], release: 0.4, cutoff: 50
  end
end

define :bass_a1 do |n|
  use_synth :tb303
  n.times do
    sync :measure
    play :C2, release: 0.4, cutoff: 50
    sleep 3.9
    sync :measure
    play :C2, release: 0.4, cutoff: 50
    sleep 1.9
    sync :beat
    play :G1, release: 0.4, cutoff: 50
    sleep 1
    play :C2, release: 0.4, cutoff: 50
    sleep 1
    play :F2, release: 0.4, cutoff: 50
    sleep 2.9
    sync :measure
    play :F2, release: 0.4, cutoff: 50
    sleep 3.9
  end
end

define :bass_b do |n|
  use_synth :tb303
  n.times do
    sync :measure
    play :Bb2, release: 0.4, cutoff: 50
    sleep 3.5
    play :F1, release: 0.4, cutoff: 50
    sleep 0.4
    sync :measure
    play :Bb2, release: 0.4, cutoff: 50
    sleep 2.9
    sync :beat
    play_pattern_timed(ring :C1, :E1, :G1), [0.25, 0.25], release: 0.4, cutoff: 50
    sync :measure
    play :A2, release: 0.4, cutoff: 50
    sleep 3.75
    play_pattern_timed(ring :E1, :A2, :E1, :A1), [0.25, 0.25, 0.25], release: 0.4, cutoff: 50
    sleep 3
  end
end

define :bass_c do |n|
  use_synth :tb303
  n.times do
    sync :measure
    play :F2, release: 0.4, cutoff: 50
    sleep 3.9
    sync :measure
    play :F2, release: 0.4, cutoff: 50
    sleep 0.9
    sync :beat
    play_pattern_timed(ring :Eb3, :C3, :Ab2), [0.33, 0.33], release: 0.4, cutoff: 50
    sync :measure
    play :G2, release: 0.4, cutoff: 50
    sleep 3.9
    sync :measure
    play :G2, release: 0.4, cutoff: 50
    sleep 0.9
    sync :beat
    play_pattern_timed(ring :G3, :D3, :G2), [0.33, 0.33], release: 0.4, cutoff: 50
    
  end
end

in_thread(name: :chords) do
  with_fx :bitcrusher, bits: 10 do |bc|
    with_fx :reverb do
      with_fx :ping_pong, amp: 0.7 do
        intro_loop 2
        a_section_loop 4, :pretty_bell
        b_section_loop 4
        control bc, bits: 8
        c_section_loop 4
        control bc, bits: 10
        b_section_loop 4
        a2_section_loop 4
      end
    end
  end
end



in_thread(name: :drums) do
  drum_loop_1_low_cut 16
  drum_loop_1 24
  sleep 16
  drum_loop_1_low_cut 16
  drum_loop_1 24
end

in_thread(name: :bass) do
  bass_intro 5
  bass_a1 1
  sleep 32
  bass_b 2
  bass_c 4
  sleep 32
  bass_b 2
  bass_a1 2
end


in_thread(name: :metronome) do
  80.times do
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

in_thread do
  40.times do
    sample :vinyl_hiss, release: 0.1, attack: 0.1, amp: 1
    sleep 7.9
  end
end

