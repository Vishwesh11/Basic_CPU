# Basic_RISC_CPU

    +> SequenceController.sv ===>>> Sequence COntroller to control the CPU process from Instruction_add/fetch to Write_back.
    +> ALU ====>>> the CPU's execcution unit. 
    +> Program_counter ====>>> Have the track of next instruction address to fetch from Memory
    +> Memory ====>>> Holds Instruction as well as data for the current CPU design 
    +> Instruction_reg ====>>> Instruction Register that gets the Istruciton from memory and outputs as opcode and its reg fields for further processing. 
    +> Accum  ====>>> Accumulator that holds one of the Value for alu operation 

    +> cpu ====>>> CPU is the top module that interconnects all the components and does data and control path functionality of CPU.

    ***====================================================================
    The Elaborated design from Xillinxs Vivado for this CPU :
![image](https://github.com/Vishwesh11/Basic_RISC_CPU/assets/54211110/67688a65-530c-4f17-93ca-d8a87427c672)
