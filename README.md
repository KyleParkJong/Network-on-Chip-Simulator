# NoC Simulator for simulating intra-chip data flow in Neural Network Accelerator
> Kyle Jonghyuk Park, Ko Ryeowook

# Introduction
> In cutting-edge neural network accelerators, our project analyzes SIMBA, NVIDIA's NN accelerator, and its Network on-Chip (NoC) structure. We aim to uncover its strengths and weaknesses while also addressing the need for advanced simulators. To this end, we have developed a unique simulator that supports __both multicast and unicast__ data transmissions, filling a critical gap in existing tools. Our work contributes to the advancement of neural network accelerator research, enabling efficient data processing in the era of AI and deep learning.

# Project Summary
- Developed a 2D Mesh NoC simulator in Verilog to verify different tile structures and efficient dataflow of a neural network accelerator
    * Flit-based flow control: wormhole
    * Virtual Channel
    * Lookahead routing pipeline (4-cycle)
    * Credit-based buffer backpressure
- Implemented the Based Routing Conformed Paths (BRCP) model to support both unicast and multicast
    + "Forward & Absorb" multicast mechanism
    + Can avoid multicast-unicast routing deadlock since multicast and unicast share the same network paths
    + Unicast vs Multicast: Mulitcast priority
- Applied advanced multicast algorithm: Advanced Hierarchical Leader-Based (HL) scheme (NoC Simulator (HL))
    * More efficient in cycle than the original HL scheme
- Parameterized the simulator's options to improve usability (define.v, parameters.v)
    * Routing Algorithm: XY / YX DOR
    * Arbiter Configurations: Fixed priority / Round robin priority
    * Priority Configuration
    * Flit Configuration

# Block Diagram
## Top
<img src="/image/top.png" width="65%" height="65%" title="top" alt="top"></img>

## Router
<img src="/image/router.png" width="45%" height="45%" title="router" alt="router"></img>

## Routing Computation & Crossbar
<img src="/image/routing computation.png" width="45%" height="45%" title="rc" alt="rc"></img>
<img src="/image/crossbar.png" width="45%" height="45%" title="cb" alt="cb"></img>

* Forward & Absorb

## PE Cycle module
<img src="/image/simba pe2.png" width="45%" height="45%" title="simba pe2" alt="simba pe2"></img>
<img src="/image/pe cycle.png" width="40%" height="40%" title="pe cycle" alt="pe cycle"></img>

* PE cycle module is only used for cycle simulation
* 1 MAC: 8 cycles, total 128 MAC: 1024 cycles 
    + Refer to SIMBA paper: ResNet-50 (res4a_branch1)
* If you don't need a cycle simulation for PE computation, you can delete this module. The NoC Simulator will still work.

# Original HL scheme
<img src="/image/original hl.png" width="65%" height="65%" title="original hl" alt="original hl"></img>

* Multicast algorithm for sending data from one source to multiple destinations
* The HL scheme is proposed by a paper that proposed BRCP model ("Multidestination message passing in wormhole k-ary n-cube networks with base routing conformed paths")

# Advanced HL scheme
<img src="/image/advanced_hl.png" width="80%" height="80%" title="advanced hl" alt="advanced hl"></img>

1. Divide the Mesh NoC into four quadrants and determine L1, L2 with the algorithm specified for the quadrant where the source is located.
2. Through U-mesh algorithm, send data with one L2 as the first destination among multiple L2s
3. Proceed multicast in the specified col and row directions based on the quadrant where the source is located.

## Advanced HL vs Original HL
<img src="/image/table.png" width="65%" height="45%" title="table" alt="table"></img>
<img src="/image/graph.png" width="45%" height="45%" title="graph" alt="graph"></img>

# Simulation Result
# Case 1: NoC Simulator (HL)
### Simulation Scenario
<img src="/image/case1.png" width="45%" height="45%" title="case1" alt="case1"></img>

### Case 1 result
<img src="/image/case1 result.png" width="100%" height="100%" title="result" alt="result"></img>

<img src="/image/case1 wave.png" width="100%" height="100%" title="wave" alt="wave"></img>

# Case 2: NoC Simulator (2VC, PE cycle)
### Simulation Scenario
<img src="/image/case2.png" width="50%" height="50%" title="case2" alt="case2"></img>

* Contention between row-by-row multicast, and partial-sum (PSUM) unicast transmissions sent after PE internal MAC operations during SIMBA dataflow.

### Case 2 result
Row 2: IA Multicast & PE MAC cycle
<img src="/image/case2 wave1.png" width="45%" height="45%" title="case1" alt="case1"></img>

Row 3: IA Multicast & PSUM contention
<img src="/image/case2 wave2.png" width="45%" height="45%" title="case1" alt="case1"></img>

### Simulator log and options
<img src="/image/result2.png" width="45%" height="45%" title="result2" alt="result2"></img>

- Simulation logs & Simulator Configuration options (define.v, parameters.v)

# Reference
- Simba: Scaling Deep-Learning Inference with Multi-Chip-Module-Based Architecture [LINK](https://research.nvidia.com/publication/2019-10_simba-scaling-deep-learning-inference-multi-chip-module-based-architecture)
- D. K. Panda, S. Singal and R. Kesavan, "Multidestination message passing in wormhole k-ary n-cube networks with base routing conformed paths," in IEEE Transactions on Parallel and Distributed Systems, vol. 10, no. 1, pp. 76-96, Jan. 1999, doi: 10.1109/71.744844. [LINK](https://ieeexplore.ieee.org/document/744844)
- NoCGEN: "An open-source on-chip router model originally developed for [Matsutani_HPCA09]" [LINK](https://github.com/matutani/nocgen)

# Helpful books
- On-Chip Networks, Second Edition (Natalie Enright Jerger, Tushar Krishna, Li-Shiuan Peh)
- Principles and Practices of Interconnection Networks (William James Dally, Brian Towles)