# NoC Simulator for simulating intra-chip data flow in Neural Network Accelerator
> Kyle Jonghyuk Park, Ko Ryeowook

# Introduction
> In cutting-edge neural network accelerators, our project analyzes SIMBA, NVIDIA's NN accelerator, and its Network on-Chip (NoC) structure. We aim to uncover its strengths and weaknesses while also addressing the need for advanced simulators. To this end, we have developed a unique simulator that supports __both multicast and unicast__ data transmissions, filling a critical gap in existing tools. Our work contributes to the advancement of neural network accelerator research, enabling efficient data processing in the era of AI and deep learning.

[Simba: Scaling Deep-Learning Inference with Multi-Chip-Module-Based Architecture](https://research.nvidia.com/publication/2019-10_simba-scaling-deep-learning-inference-multi-chip-module-based-architecture)

# Project Summary
- Developed a 2D Mesh NoC simulator in Verilog to verify different tile structures and efficient dataflow of a neural network accelerator
    * Flit-based flow control: wormhole
    * Virtual Channel
    * Lookahead routing pipeline (4-cycle)
    * Credit-based buffer backpressure
- Implemented the Based Routing Conformed Paths (BRCP) model to support both unicast and multicast
    + "Forward & Absorb" multicast mechanism
    + Can avoid multicast-unicast routing deadlock since multicast and unicast share the same network paths
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
<img src="/image/simba acc.png" width="45%" height="45%" title="simba acc" alt="simba acc"></img>
<img src="/image/pe cycle.png" width="45%" height="45%" title="pe cycle" alt="pe cycle"></img>

* PE cycle module is only used for cycle simulation
* MAC: 8 cycles, total 128 MAC: 1024 cycles 
    + Refer to SIMBA paper: ResNet-50 (res4a_branch1)

# Reference
- Simba: Scaling Deep-Learning Inference with Multi-Chip-Module-Based Architecture [LINK](https://research.nvidia.com/publication/2019-10_simba-scaling-deep-learning-inference-multi-chip-module-based-architecture)
- D. K. Panda, S. Singal and R. Kesavan, "Multidestination message passing in wormhole k-ary n-cube networks with base routing conformed paths," in IEEE Transactions on Parallel and Distributed Systems, vol. 10, no. 1, pp. 76-96, Jan. 1999, doi: 10.1109/71.744844. [LINK](https://ieeexplore.ieee.org/document/744844)

# Helpful books
- On-Chip Networks, Second Edition (Natalie Enright Jerger, Tushar Krishna, Li-Shiuan Peh)
- Principles and Practices of Interconnection Networks (William James Dally, Brian Towles)