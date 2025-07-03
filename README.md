# Mealy Sequence Detector (10010)

A 5-state Mealy finite state machine (FSM) implemented in Verilog to detect the binary sequence `10010` in a serial input stream. Supports detection of **overlapping sequences** as well

---

## Project Structure
```
Mealy-Sequence-Detector/
├── src/
│   └── sequence_detector.v         # FSM Verilog implementation
├── test/
│   └── sequence_detector_tb.v      # Testbench for simulation
├── waves/
│   └── waveform.vcd                # GTKWave simulation output (generated)
├── docs/
│   └── state_diagram.txt           # Placeholder for FSM diagram
├── README.md                       
```

## Features
- Designed using Mealy architecture
- Detects overlapping sequences
- Modular code: separate testbench and FSM
- Outputs waveform dump for simulation tools like GTKWave

## How to Run (using Icarus Verilog)
```bash
iverilog -o testbench test/sequence_detector_tb.v src/sequence_detector.v
vvp testbench
```
Then open the generated waveform:
```bash
gtkwave waves/waveform.vcd
```

## State Diagram
You can draw the FSM using tools like draw.io or LaTeX TikZ. See `docs/state_diagram.txt` for guidance.
