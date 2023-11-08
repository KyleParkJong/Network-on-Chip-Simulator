# NoC simulator for simulating intra-chip data flow in Neural Network Accelerator
> Kyle Jonghyuk Park, Ko Ryeowook

# Introduction
> In cutting-edge neural network accelerators, our project analyzes SIMBA, NVIDIA's NN accelerator, and its Network on-Chip (NoC) structure. We aim to uncover its strengths and weaknesses while also addressing the need for advanced simulators. To this end, we have developed a unique simulator that supports __both multicast and unicast__ data transmissions, filling a critical gap in existing tools. Our work contributes to the advancement of neural network accelerator research, enabling efficient data processing in the era of AI and deep learning.

[Simba: Scaling Deep-Learning Inference with Multi-Chip-Module-Based Architecture](https://research.nvidia.com/publication/2019-10_simba-scaling-deep-learning-inference-multi-chip-module-based-architecture)

# Project Summary
- Developed a 2D Mesh NoC simulator in Verilog to verify different tile structures and efficient dataflow of a neural network accelerator
- Implemented the Based Routing Conformed Paths (BRCP) model for both unicast and multicast transmissions in NoC
- Implemented a multicast algorithm by advancing the Hierarchical Leader-Based (HL) scheme 
- Parameterized the simulator's options to improve usability

# Reference
- Simba: Scaling Deep-Learning Inference with Multi-Chip-Module-Based Architecture [LINK](https://research.nvidia.com/publication/2019-10_simba-scaling-deep-learning-inference-multi-chip-module-based-architecture)
- D. K. Panda, S. Singal and R. Kesavan, "Multidestination message passing in wormhole k-ary n-cube networks with base routing conformed paths," in IEEE Transactions on Parallel and Distributed Systems, vol. 10, no. 1, pp. 76-96, Jan. 1999, doi: 10.1109/71.744844. [LINK](https://ieeexplore.ieee.org/document/744844)

# Helpful books
- On-Chip Networks, Second Edition (Natalie Enright Jerger, Tushar Krishna, Li-Shiuan Peh)
- Principles and Practices of Interconnection Networks (William James Dally, Brian Towles)