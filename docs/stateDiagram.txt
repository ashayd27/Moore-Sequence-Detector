# Moore Sequence Detector (1010) State Transition Table

| Current State | Binary | Input | Next State | Next Binary | Output |
|---------------|--------|-------|------------|-------------|--------|
| S0 (Reset)    | 000    | 0     | S0         | 000         | 0      |
| S0 (Reset)    | 000    | 1     | S1         | 001         | 0      |
| S1            | 001    | 0     | S2         | 010         | 0      |
| S1            | 001    | 1     | S1         | 001         | 0      |
| S2            | 010    | 0     | S0         | 000         | 0      |
| S2            | 010    | 1     | S3         | 011         | 0      |
| S3            | 011    | 0     | S4         | 100         | 1      |
| S3            | 011    | 1     | S1         | 001         | 0      |
| S4 (Match)    | 100    | 0     | S0         | 000         | 0      |
| S4 (Match)    | 100    | 1     | S1         | 001         | 0      |

## Key Details:
- **Type**: Moore Machine (output depends only on current state)
- **Sequence Detected**: 1010 (with overlapping sequences allowed)
- **Output**: 
  - 1 when reaching S4 (complete sequence detected)
  - 0 for all other states
- **State Encoding**:
  - S0: 000 (Reset/Initial state)
  - S1: 001 ("1" detected)
  - S2: 010 ("10" detected)
  - S3: 011 ("101" detected)
  - S4: 100 ("1010" detected, output=1)

## Notes:
1. After a complete match (S4), the FSM can immediately begin detecting the next sequence
2. The binary encoding matches the Verilog implementation in the repository
3. Inputs are processed one bit per clock cycle
