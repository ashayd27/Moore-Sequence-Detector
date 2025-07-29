# Moore Sequence Detector (10010) State Transition Table

| Current State | Binary | Input | Next State | Next Binary | Output |
|---------------|--------|-------|------------|-------------|--------|
| S0 (Reset)    | 000    | 0     | S0         | 000         | 0      |
| S0 (Reset)    | 000    | 1     | S1         | 001         | 0      |
| S1            | 001    | 0     | S2         | 010         | 0      |
| S1            | 001    | 1     | S1         | 001         | 0      |
| S2            | 010    | 0     | S3         | 011         | 0      |
| S2            | 010    | 1     | S1         | 001         | 0      |
| S3            | 011    | 0     | S0         | 000         | 0      |
| S3            | 011    | 1     | S4         | 100         | 0      |
| S4            | 100    | 0     | S5         | 101         | 1      |
| S4            | 100    | 1     | S1         | 001         | 0      |
| S5 (Match)    | 101    | 0     | S0         | 000         | 0      |
| S5 (Match)    | 101    | 1     | S1         | 001         | 0      |

## Key Details:
- **Type**: Moore Machine (output depends only on current state)
- **Sequence Detected**: `10010` (non-overlapping by design)
- **Output**:
  - `1` only when reaching **S5** (complete sequence detected)
  - `0` for all other states
- **State Encoding**:
  - S0: `000` (Reset/Initial state)
  - S1: `001` ("1" detected)
  - S2: `010` ("10" detected)
  - S3: `011` ("100" detected)
  - S4: `100` ("1001" detected)
  - S5: `101` ("10010" detected)

## Other Information:
1. **Strict sequencing**: Any deviation from `10010` resets progress (e.g., `10011` fails at the last bit).
2. **3-bit state encoding**: Matches the Verilog implementation (`state[2:0]`).
