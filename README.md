# Approximate_Computing-Nexys4_Implementation
FPGA-based implementation of approximate computing using an 8-bit truncated multiplier on the Nexys 4 (Artix-7) board. Includes Verilog HDL modules, simulation testbenches, and seven-segment display integration for real-time output and error visualization.

# Approximate_Computing-Nexys4_Implementation

This repository contains an FPGA-based implementation of an **8-bit Approximate Multiplier** using Verilog on the **Nexys 4 (Artix-7) FPGA** development board. The project demonstrates the trade-offs between accuracy and power/performance in arithmetic computation using **approximate computing techniques**.

## 🔧 Features

- Exact and Approximate 8-bit Multiplier (with truncation of 2 LSBs)
- Display of Product and %Error on 8-digit Seven-Segment Display
- Error Flag for monitoring approximate behavior
- Resource & Power analysis using Xilinx Vivado

## 📂 Folder Structure

- `src/` – Verilog source files for modules
- `testbench/` – Testbench files and sample simulation waveforms
- `constraints/` – Nexys 4 XDC constraints file
- `reports/` – Power and resource usage reports
- `images/` – Photos or screenshots of board implementation
- `doc/` – Detailed project report or presentation
- `simulation/` – Simulation scripts (ModelSim, etc.)

## 📈 Approximation Technique

We implemented a **truncated multiplier** where the 2 least significant bits (LSBs) of both operands are set to 0. This reduces switching activity and conserves power at the cost of minor precision loss.

## 📊 Hardware

- FPGA: Nexys 4 (Artix-7)
- Tools: Vivado, ModelSim, GTKWave
- Language: Verilog HDL

## 🧪 Simulation

Testbenches are provided in the `/testbench` directory. Simulations verify correctness and compare exact vs. approximate multiplication outputs.

## 📷 Demonstration

![demo](images/demo_photo.jpg)

## 📜 License

[MIT License](LICENSE)

---


