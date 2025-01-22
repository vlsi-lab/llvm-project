class CordicInstructionQ <bits<7> funct7, string mnemonic> : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2 = 0b11111;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = funct7; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1);
    let AsmString = "cordic." # mnemonic # "\t$rd, $rs1";
}

class CordicInstructionF <bits<7> funct7, string mnemonic> : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2 = 0b11111;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = funct7; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; /*opcode*/
    dag OutOperandList = (outs FPR32:$rd);
    dag InOperandList = (ins FPR32:$rs1);
    let AsmString = "cordic." # mnemonic # "\t$rd, $rs1";
}

class CordicInstructionQQ <bits<7> funct7, string mnemonic> : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = funct7; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "cordic." # mnemonic # "\t$rd, $rs1, $rs2";
}

class CordicInstructionFF <bits<7> funct7, string mnemonic> : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = funct7; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; /*opcode*/
    dag OutOperandList = (outs FPR32:$rd);
    dag InOperandList = (ins FPR32:$rs1, FPR32:$rs2);
    let AsmString = "cordic." # mnemonic # "\t$rd, $rs1, $rs2";
}

def SIN_Q : CordicInstructionQ<0b0000001, "sin.q">;
def COS_Q : CordicInstructionQ<0b0000010, "cos.q">;
def ATAN_Q : CordicInstructionQ<0b0000011, "atan.q">;
def ASIN_Q : CordicInstructionQ<0b0000100, "asin.q">;
def ACOS_Q : CordicInstructionQ<0b0000101, "acos.q">;
def EXP_Q : CordicInstructionQ<0b0000110, "exp.q">;
def ATAN2_Q : CordicInstructionQQ<0b0000111, "atan2.qq">;
def LOGN_Q : CordicInstructionQ<0b0001000, "logn.q">;
def SQRT_Q : CordicInstructionQ<0b0001001, "sqrt.q">;
def HYPOTENUSE_Q : CordicInstructionQQ<0b0001010, "hypotenuse.qq">;

def SIN_F : CordicInstructionF<0b0000001, "sin.f">;
def COS_F : CordicInstructionF<0b0000010, "cos.f">;
def ATAN_F : CordicInstructionF<0b0000011, "atan.f">;
def ASIN_F : CordicInstructionF<0b0000100, "asin.f">;
def ACOS_F : CordicInstructionF<0b0000101, "acos.f">;
def EXP_F : CordicInstructionF<0b0000110, "exp.f">;
def ATAN2_F : CordicInstructionFF<0b0000111, "atan2.ff">;
def LOGN_F : CordicInstructionF<0b0001000, "logn.f">;
def SQRT_F : CordicInstructionF<0b0001001, "sqrt.f">;
def HYPOTENUSE_F : CordicInstructionFF<0b0001010, "hypotenuse.ff">;

def : Pat<(int_riscv_sin_q GPR:$rs1), (SIN_Q GPR:$rs1)>;
def : Pat<(int_riscv_cos_q GPR:$rs1), (COS_Q GPR:$rs1)>;
def : Pat<(int_riscv_atan_q GPR:$rs1), (ATAN_Q GPR:$rs1)>;
def : Pat<(int_riscv_asin_q GPR:$rs1), (ASIN_Q GPR:$rs1)>;
def : Pat<(int_riscv_acos_q GPR:$rs1), (ACOS_Q GPR:$rs1)>;
def : Pat<(int_riscv_exp_q GPR:$rs1), (EXP_Q GPR:$rs1)>;
def : Pat<(int_riscv_atan2_q GPR:$rs1, GPR:$rs2), (ATAN2_Q GPR:$rs1, GPR:$rs2)>;
def : Pat<(int_riscv_logn_q GPR:$rs1), (LOGN_Q GPR:$rs1)>;
def : Pat<(int_riscv_sqrt_q GPR:$rs1), (SQRT_Q GPR:$rs1)>;
def : Pat<(int_riscv_hypotenuse_q GPR:$rs1, GPR:$rs2), (HYPOTENUSE_Q GPR:$rs1, GPR:$rs2)>;

def : Pat<(int_riscv_sin_f FPR32:$rs1), (SIN_F FPR32:$rs1)>;
def : Pat<(int_riscv_cos_f FPR32:$rs1), (COS_F FPR32:$rs1)>;
def : Pat<(int_riscv_atan_f FPR32:$rs1), (ATAN_F FPR32:$rs1)>;
def : Pat<(int_riscv_asin_f FPR32:$rs1), (ASIN_F FPR32:$rs1)>;
def : Pat<(int_riscv_acos_f FPR32:$rs1), (ACOS_F FPR32:$rs1)>;
def : Pat<(int_riscv_exp_f FPR32:$rs1), (EXP_F FPR32:$rs1)>;
def : Pat<(int_riscv_atan2_f FPR32:$rs1, FPR32:$rs2), (ATAN2_F FPR32:$rs1, FPR32:$rs2)>;
def : Pat<(int_riscv_logn_f FPR32:$rs1), (LOGN_F FPR32:$rs1)>;
def : Pat<(int_riscv_sqrt_f FPR32:$rs1), (SQRT_F FPR32:$rs1)>;
def : Pat<(int_riscv_hypotenuse_f FPR32:$rs1, FPR32:$rs2), (HYPOTENUSE_F FPR32:$rs1, FPR32:$rs2)>;

