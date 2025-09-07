# TESPAR RTL Implementation (D-S Generator + Alphabet Encoder)

## Overview
This project implements a **Time Encoded Signal Processing and Recognition (TESPAR)** system in Verilog HDL.  
The system extracts **D-S parameters** (Zero-crossing interval descriptors) from 8-bit signed input data and maps them into symbolic **Alphabet codes** using a lookup-based encoder.

The implementation is divided into three main modules:

1. **D-S Generator (`D_S_detector`)**  
   - Detects **zero-crossings** of the input sequence.  
   - Computes:  
     - `D` (zero-crossing descriptor)  
     - `S` (interval counter between crossings)  
   - Generates a `valid` signal when new `(D, S)` values are available.

2. **Alphabet Encoder (`tespar_lookup`)**  
   - Encodes `(D, S)` values into a **symbolic TESPAR Alphabet code** using a lookup table.  
   - Each `(D, S)` combination maps to a **5-bit code**.  
   - The mapping rules follow the TESPAR alphabet classification scheme.

3. **Top-Level TESPAR System (`tespar`)**  
   - Instantiates `D_S_detector` and `tespar_lookup`.  
   - Connects the outputs of `D_S_detector` into the `tespar_lookup` encoder.  
   - Produces the final TESPAR alphabet symbol stream.

A **testbench** (`TESPAR_tb`) is also provided to validate functionality on a predefined **input data sequence**.

---

## Functionality

### 1. Input Data  
The system takes **8-bit signed integers (2’s complement)** as input.  
For testing, a predefined sequence of **43 samples** is used:
-17, -5, 12, 34, 59, 21, 30, 43, 64, 70, 90, 55, 30, 21, 11, -3,
-30, -50, -68, -25, -10, 14, 30, 45, 79, 121, 80, 70, 60, 75,
99, 110, 80, 50, 40, 60, 76, 100, 80, 50, 30, 10, -19

These values are stored in an array (`data_mem`) inside the **testbench** and fed sequentially to the TESPAR system.

---

### 2. D-S Generator (`D_S_detector`)
- Detects **zero-crossings** by checking for a sign change between the current and previous samples.  
- On a zero-crossing:
  - `D` is set (captures the transition descriptor).  
  - `S` is set (number of samples since the last crossing).  
  - `valid` is asserted high for one cycle.  
- Otherwise, `S` increments until the next crossing.  

---

### 3. Alphabet Encoder (`tespar_lookup`)
- Uses **case-based lookup logic** to encode `(D, S)` into a **5-bit Alphabet code**.  
- Provides `valid_lookup` signal aligned with the `valid` flag from D-S generator.  
- Ensures correct TESPAR symbolic classification.

---

### 4. Top-Level TESPAR (`tespar`)
- Instantiates both submodules:  
  - `D_S_detector` → generates `(D, S, valid)`  
  - `tespar_lookup` → generates final TESPAR `code`  
- Produces a **stream of TESPAR symbols** representing the input data sequence.

---

### 5. Testbench (`TESPAR_tb`)
- Loads the **43-sample dataset** into a memory array (`data_mem`).  
- Applies samples one-by-one at each positive clock edge.  
- Provides reset sequence and clock generation.  
- Monitors `code` and `valid` signals.  
- Automatically stops simulation after feeding all inputs.  

---

## Simulation Flow
1. **Compile all modules** (`D_S_detector.v`, `tespar_lookup.v`, `tespar.v`, `TESPAR_tb.v`).  
2. Run simulation in simulator (ModelSim, Vivado, Icarus Verilog, etc.).  
3. Observe:
   - **Input (`din`)**: Signed 8-bit data stream.  
   - **Intermediate outputs (`D`, `S`)** from D-S generator.  
   - **Final encoded output (`code`)** from TESPAR encoder.  
   - **Valid flags** showing symbol readiness.  

---

## Expected Outcome
- At each **zero-crossing** in the input signal, a valid TESPAR **Alphabet symbol** (`code`) is generated.  
- The output sequence of symbols corresponds to the symbolic TESPAR representation of the input dataset.  

---

## Simulation Results

<img width="940" height="427" alt="image" src="https://github.com/user-attachments/assets/abbe569e-0ad4-40eb-a4cd-8f5f9389dbb1" />

*Figure: TESPAR outputs showing D-S detection and Alphabet encoding.*

---

## Tools Used
- **Language**: Verilog HDL  
- **Simulator**: Any RTL simulator (tested in ModelSim and Icarus Verilog)  
- **Target**: FPGA/ASIC RTL verification environment  


