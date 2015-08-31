////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology               //
//                                                                            //
// Engineer:       Matthias Baer - baermatt@student.ethz.ch                   //
//                                                                            //
// Additional contributions by:                                               //
//                 Sven Stucki - svstucki@student.ethz.ch                     //
//                                                                            //
//                                                                            //
// Create Date:    19/09/2013                                                 //
// Design Name:    RISC-V processor core                                      //
// Module Name:    defines.sv                                                 //
// Project Name:   RI5CY                                                      //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Defines for various constants used by the processor core.  //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Adapted for RISC-V                                         //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// BTW: If you want to create more of those fancy ASCII art comments:         //
// http://patorjk.com/software/taag/#f=Standard&t=Fancy%20ASCII%20Art         //
////////////////////////////////////////////////////////////////////////////////

`ifndef _CORE_DEFINES
`define _CORE_DEFINES


////////////////////////////////////////////////
//    ___         ____          _             //
//   / _ \ _ __  / ___|___   __| | ___  ___   //
//  | | | | '_ \| |   / _ \ / _` |/ _ \/ __|  //
//  | |_| | |_) | |__| (_) | (_| |  __/\__ \  //
//   \___/| .__/ \____\___/ \__,_|\___||___/  //
//        |_|                                 //
////////////////////////////////////////////////

`define OPCODE_SYSTEM     7'h73
`define OPCODE_FENCE      7'h0f
`define OPCODE_OP         7'h33
`define OPCODE_OPIMM      7'h13
`define OPCODE_STORE      7'h23
`define OPCODE_LOAD       7'h03
`define OPCODE_BRANCH     7'h63
`define OPCODE_JALR       7'h67
`define OPCODE_JAL        7'h6f
`define OPCODE_AUIPC      7'h17
`define OPCODE_LUI        7'h37
`define OPCODE_CUST0      7'h0b
`define OPCODE_CUST1      7'h2b

// PULP custom
`define OPCODE_STORE_POST 7'h27
`define OPCODE_LOAD_POST  7'h07
`define OPCODE_HWLOOP     7'h6b


// instruction masks (for tracer)
`define INSTR_CUSTOM0    { 25'b?, `OPCODE_CUST0 }
`define INSTR_CUSTOM1    { 25'b?, `OPCODE_CUST1 }
`define INSTR_LUI        { 25'b?, `OPCODE_LUI }
`define INSTR_AUIPC      { 25'b?, `OPCODE_AUIPC }
`define INSTR_JAL        { 25'b?, `OPCODE_JAL }
`define INSTR_JALR       { 17'b?, 3'b000, 5'b?, `OPCODE_JALR }
// BRANCH
`define INSTR_BEQ        { 17'b?, 3'b000, 5'b?, `OPCODE_BRANCH }
`define INSTR_BNE        { 17'b?, 3'b001, 5'b?, `OPCODE_BRANCH }
`define INSTR_BLT        { 17'b?, 3'b100, 5'b?, `OPCODE_BRANCH }
`define INSTR_BGE        { 17'b?, 3'b101, 5'b?, `OPCODE_BRANCH }
`define INSTR_BLTU       { 17'b?, 3'b110, 5'b?, `OPCODE_BRANCH }
`define INSTR_BGEU       { 17'b?, 3'b111, 5'b?, `OPCODE_BRANCH }
// LOAD
`define INSTR_LB         { 17'b?, 3'b000, 5'b?, `OPCODE_LOAD }
`define INSTR_LH         { 17'b?, 3'b001, 5'b?, `OPCODE_LOAD }
`define INSTR_LW         { 17'b?, 3'b010, 5'b?, `OPCODE_LOAD }
`define INSTR_LBU        { 17'b?, 3'b100, 5'b?, `OPCODE_LOAD }
`define INSTR_LHU        { 17'b?, 3'b101, 5'b?, `OPCODE_LOAD }
// STORE
`define INSTR_SB         { 17'b?, 3'b000, 5'b?, `OPCODE_STORE }
`define INSTR_SH         { 17'b?, 3'b001, 5'b?, `OPCODE_STORE }
`define INSTR_SW         { 17'b?, 3'b010, 5'b?, `OPCODE_STORE }
// OPIMM
`define INSTR_ADDI       { 17'b?, 3'b000, 5'b?, `OPCODE_OPIMM }
`define INSTR_SLTI       { 17'b?, 3'b010, 5'b?, `OPCODE_OPIMM }
`define INSTR_SLTIU      { 17'b?, 3'b011, 5'b?, `OPCODE_OPIMM }
`define INSTR_XORI       { 17'b?, 3'b100, 5'b?, `OPCODE_OPIMM }
`define INSTR_ORI        { 17'b?, 3'b110, 5'b?, `OPCODE_OPIMM }
`define INSTR_ANDI       { 17'b?, 3'b111, 5'b?, `OPCODE_OPIMM }
`define INSTR_SLLI       { 7'b0000000, 10'b?, 3'b001, 5'b?, `OPCODE_OPIMM }
`define INSTR_SRLI       { 7'b0000000, 10'b?, 3'b101, 5'b?, `OPCODE_OPIMM }
`define INSTR_SRAI       { 7'b0100000, 10'b?, 3'b101, 5'b?, `OPCODE_OPIMM }
// OP
`define INSTR_ADD        { 7'b0000000, 10'b?, 3'b000, 5'b?, `OPCODE_OP }
`define INSTR_SUB        { 7'b0100000, 10'b?, 3'b000, 5'b?, `OPCODE_OP }
`define INSTR_SLL        { 7'b0000000, 10'b?, 3'b001, 5'b?, `OPCODE_OP }
`define INSTR_SLT        { 7'b0000000, 10'b?, 3'b010, 5'b?, `OPCODE_OP }
`define INSTR_SLTU       { 7'b0000000, 10'b?, 3'b011, 5'b?, `OPCODE_OP }
`define INSTR_XOR        { 7'b0000000, 10'b?, 3'b100, 5'b?, `OPCODE_OP }
`define INSTR_SRL        { 7'b0000000, 10'b?, 3'b101, 5'b?, `OPCODE_OP }
`define INSTR_SRA        { 7'b0100000, 10'b?, 3'b101, 5'b?, `OPCODE_OP }
`define INSTR_OR         { 7'b0000000, 10'b?, 3'b110, 5'b?, `OPCODE_OP }
`define INSTR_AND        { 7'b0000000, 10'b?, 3'b111, 5'b?, `OPCODE_OP }
// FENCE
`define INSTR_FENCE      { 4'b0, 8'b?, 13'b0, `OPCODE_FENCE }
`define INSTR_FENCEI     { 17'b0, 3'b001, 5'b0, `OPCODE_FENCE }
// SYSTEM
`define INSTR_CSRRW      { 17'b?, 3'b001, 5'b?, `OPCODE_SYSTEM }
`define INSTR_CSRRS      { 17'b?, 3'b010, 5'b?, `OPCODE_SYSTEM }
`define INSTR_CSRRC      { 17'b?, 3'b011, 5'b?, `OPCODE_SYSTEM }
`define INSTR_CSRRWI     { 17'b?, 3'b101, 5'b?, `OPCODE_SYSTEM }
`define INSTR_CSRRSI     { 17'b?, 3'b110, 5'b?, `OPCODE_SYSTEM }
`define INSTR_CSRRCI     { 17'b?, 3'b111, 5'b?, `OPCODE_SYSTEM }
`define INSTR_ECALL      { 12'b000000000000, 13'b0, `OPCODE_SYSTEM }
`define INSTR_EBREAK     { 12'b000000000001, 13'b0, `OPCODE_SYSTEM }
`define INSTR_ERET       { 12'b000100000000, 13'b0, `OPCODE_SYSTEM }
`define INSTR_WFI        { 12'b000100000010, 13'b0, `OPCODE_SYSTEM }
`define INSTR_RDCYCLE    { 5'b11000, 5'b0, 2'b00, 5'b0, 3'b010, 5'b?, `OPCODE_SYSTEM }
`define INSTR_RDCYCLEH   { 5'b11001, 5'b0, 2'b00, 5'b0, 3'b010, 5'b?, `OPCODE_SYSTEM }
`define INSTR_RDTIME     { 5'b11000, 5'b0, 2'b01, 5'b0, 3'b010, 5'b?, `OPCODE_SYSTEM }
`define INSTR_RDTIMEH    { 5'b11001, 5'b0, 2'b01, 5'b0, 3'b010, 5'b?, `OPCODE_SYSTEM }
`define INSTR_RDINSTRET  { 5'b11000, 5'b0, 2'b10, 5'b0, 3'b010, 5'b?, `OPCODE_SYSTEM }
`define INSTR_RDINSTRETH { 5'b11001, 5'b0, 2'b10, 5'b0, 3'b010, 5'b?, `OPCODE_SYSTEM }

// RV32M
`define INSTR_MUL        { 7'b0000001, 10'b?, 3'b000, 5'b?, `OPCODE_OP }
/* not implemented
`define INSTR_MULH       { 7'b0000001, 10'b?, 3'b001, 5'b?, `OPCODE_OP }
`define INSTR_MULHSU     { 7'b0000001, 10'b?, 3'b010, 5'b?, `OPCODE_OP }
`define INSTR_MULHU      { 7'b0000001, 10'b?, 3'b011, 5'b?, `OPCODE_OP }
`define INSTR_DIV        { 7'b0000001, 10'b?, 3'b100, 5'b?, `OPCODE_OP }
`define INSTR_DIVU       { 7'b0000001, 10'b?, 3'b101, 5'b?, `OPCODE_OP }
`define INSTR_REM        { 7'b0000001, 10'b?, 3'b110, 5'b?, `OPCODE_OP }
`define INSTR_REMU       { 7'b0000001, 10'b?, 3'b111, 5'b?, `OPCODE_OP }
*/

// PULP custom instructions

// Post-indexed load
`define INSTR_LBPOST     { 17'b?, 3'b011, 5'b?, `OPCODE_LOAD_POST }
`define INSTR_LHPOST     { 17'b?, 3'b110, 5'b?, `OPCODE_LOAD_POST }
`define INSTR_LWPOST     { 17'b?, 3'b111, 5'b?, `OPCODE_LOAD_POST }

// Source/Destination register instruction index
`define REG_S1 19:15
`define REG_S2 24:20
`define REG_D  11:07


`ifndef SYNTHESIS
// synopsys translate_off
`define TRACE_EXECUTION

function void prettyPrintInstruction(input [31:0] instr, input [31:0] pc);
  string opcode;
  begin
    unique case (instr[6:0])
      `OPCODE_SYSTEM: opcode = "SYSTEM";
      `OPCODE_FENCE:  opcode = "FENCE";
      `OPCODE_OP:     opcode = "OP";
      `OPCODE_OPIMM:  opcode = "OPIMM";
      `OPCODE_STORE:  opcode = "STORE";
      `OPCODE_LOAD:   opcode = "LOAD";
      `OPCODE_BRANCH: opcode = "BRANCH";
      `OPCODE_JALR:   opcode = "JALR";
      `OPCODE_JAL:    opcode = "JAL";
      `OPCODE_AUIPC:  opcode = "AUIPC";
      `OPCODE_LUI:    opcode = "LUI";
      default:        opcode = "Unknown";
    endcase // unique case (instr[6:0])

    $display("%t: %s Instruction 0x%h at 0x%h.", $time, opcode, instr[31:0], pc[31:0]);
    $display("%t:   | fct7  | rs2 | rs1 |   | rd  | opc.  |", $time);
    $display("%t: 0b %b %b %b %b %b %b", $time, instr[31:25], instr[`REG_S2],
             instr[`REG_S1], instr[14:12], instr[`REG_D], instr[6:0]);
    $display();
  end
endfunction // prettyPrintInstruction
// synopsys translate_on
`endif



//////////////////////////////////////////////////////////////////////////////
//      _    _    _   _    ___                       _   _                  //
//     / \  | |  | | | |  / _ \ _ __   ___ _ __ __ _| |_(_) ___  _ __  ___  //
//    / _ \ | |  | | | | | | | | '_ \ / _ \ '__/ _` | __| |/ _ \| '_ \/ __| //
//   / ___ \| |__| |_| | | |_| | |_) |  __/ | | (_| | |_| | (_) | | | \__ \ //
//  /_/   \_\_____\___/   \___/| .__/ \___|_|  \__,_|\__|_|\___/|_| |_|___/ //
//                             |_|                                          //
//////////////////////////////////////////////////////////////////////////////

`define ALU_OP_WIDTH 6

// Movhi Operation
`define ALU_MOVHI 6'b001111
// Standard Operations
`define ALU_ADD   6'b000_000
`define ALU_SUB   6'b000_010
`define ALU_AND   6'b000_011
`define ALU_OR    6'b000_100
`define ALU_XOR   6'b000_101

`define ALU_AVG   6'b000_110
`define ALU_AVGU  6'b000_111
// Shift Operations
`define ALU_SLL   6'b0010_00
`define ALU_SRL   6'b0010_01
`define ALU_SRA   6'b0010_10
`define ALU_ROR   6'b0010_11
// Set Lower Than Operations
`define ALU_SLTS  6'b0011_00
`define ALU_SLTU  6'b0011_01
// Extension Operations
`define ALU_EXTHS 6'b010_000
`define ALU_EXTWS 6'b010_001
`define ALU_EXTBS 6'b010_010
`define ALU_EXTWZ 6'b010_011
`define ALU_EXTHZ 6'b010_100
`define ALU_EXTBZ 6'b010_110
// No Operation
`define ALU_NOP   6'b011111
// Comparison Operations
`define ALU_EQ    6'b10_0000
`define ALU_NE    6'b10_0001
`define ALU_GTU   6'b10_0010
`define ALU_GEU   6'b10_0011
`define ALU_LTU   6'b10_0100
`define ALU_LEU   6'b10_0101
`define ALU_GTS   6'b10_1010
`define ALU_GES   6'b10_1011
`define ALU_LTS   6'b10_1100
`define ALU_LES   6'b10_1101

`define ALU_MIN   6'b10_1110
`define ALU_MINU  6'b11_1110
`define ALU_MAX   6'b10_1111
`define ALU_MAXU  6'b11_1111

`define ALU_ABS   6'b11_1010

`define ALU_INS   6'b11_1101
`define ALU_EXT   6'b11_1100

`define ALU_CNT   6'b11_0000
`define ALU_FF1   6'b11_0010
`define ALU_FL1   6'b11_0011
`define ALU_CLB   6'b11_0001


// Vector Mode
`define VEC_MODE32  2'b00
`define VEC_MODE16  2'b10
`define VEC_MODE8   2'b11
`define VEC_MODE216 2'b01

// ALU comparison mode
`define ALU_CMP_FULL 2'b00
`define ALU_CMP_ANY  2'b01
`define ALU_CMP_ALL  2'b10


/////////////////////////////////////////////////////////
//    ____ ____    ____            _     _             //
//   / ___/ ___|  |  _ \ ___  __ _(_)___| |_ ___ _ __  //
//  | |   \___ \  | |_) / _ \/ _` | / __| __/ _ \ '__| //
//  | |___ ___) | |  _ <  __/ (_| | \__ \ ||  __/ |    //
//   \____|____/  |_| \_\___|\__, |_|___/\__\___|_|    //
//                           |___/                     //
/////////////////////////////////////////////////////////

// internal CSR addresses
`define CSR_IDX_MSCRATCH  0
`define CSR_IDX_MEPC      1

`define CSR_MAX_IDX       1

// CSR operations
`define CSR_OP_NONE  2'b00
`define CSR_OP_WRITE 2'b01
`define CSR_OP_SET   2'b10
`define CSR_OP_CLEAR 2'b11


// SPR for HWLoops
`define SP_GRP_HWLP          5'h0C

// SPR for debugger, not accessible by CPU
`define SP_DVR0       16'h3000
`define SP_DCR0       16'h3008
`define SP_DMR1       16'h3010
`define SP_DMR2       16'h3011

`define SP_DVR_MSB 8'h00
`define SP_DCR_MSB 8'h01
`define SP_DMR_MSB 8'h02
`define SP_DSR_MSB 8'h04


///////////////////////////////////////////////
//   ___ ____    ____  _                     //
//  |_ _|  _ \  / ___|| |_ __ _  __ _  ___   //
//   | || | | | \___ \| __/ _` |/ _` |/ _ \  //
//   | || |_| |  ___) | || (_| | (_| |  __/  //
//  |___|____/  |____/ \__\__,_|\__, |\___|  //
//                              |___/        //
///////////////////////////////////////////////

// forwarding operand mux
`define SEL_REGFILE      2'b00
`define SEL_FW_EX        2'b01
`define SEL_FW_WB        2'b10

// operand a selection
`define OP_A_REGA_OR_FWD 2'b00
`define OP_A_CURRPC      2'b01
`define OP_A_ZIMM        2'b10
`define OP_A_ZERO        2'b11

// operand b selection
`define OP_B_REGB_OR_FWD 2'b00
`define OP_B_REGC_OR_FWD 2'b01
`define OP_B_IMM         2'b10

// operand b immediate selection
`define IMM_I      3'b000
`define IMM_S      3'b001
`define IMM_U      3'b010
`define IMM_PCINCR 3'b011

// operand c selection
`define OP_C_REGC_OR_FWD 1'b0
`define OP_C_JT          1'b1

// branch types
`define BRANCH_NONE 2'b00
`define BRANCH_JAL  2'b01
`define BRANCH_JALR 2'b10
`define BRANCH_COND 2'b11 // conditional branches


///////////////////////////////////////////////
//   ___ _____   ____  _                     //
//  |_ _|  ___| / ___|| |_ __ _  __ _  ___   //
//   | || |_    \___ \| __/ _` |/ _` |/ _ \  //
//   | ||  _|    ___) | || (_| | (_| |  __/  //
//  |___|_|     |____/ \__\__,_|\__, |\___|  //
//                              |___/        //
///////////////////////////////////////////////

// PC mux selector defines
`define PC_BOOT          3'b000
`define PC_INCR          3'b001
`define PC_JUMP          3'b010
`define PC_BRANCH        3'b011
`define PC_EXCEPTION     3'b100
`define PC_ERET          3'b101
`define PC_HWLOOP        3'b110
`define PC_BRANCH_PRED   3'b111

// Exception PC mux selector defines
`define EXC_PC_NO_INCR   2'b00
`define EXC_PC_ILLINSN   2'b01
`define EXC_PC_IRQ       2'b10
`define EXC_PC_IRQ_NM    2'b11

// Exceptions offsets
// target address = {boot_addr[31:5], EXC_OFF} (boot_addr must be 32 BYTE aligned!)
`define EXC_OFF_RST      5'h10
`define EXC_OFF_IRQ      5'h00
`define EXC_OFF_IRQ_NM   5'h04
`define EXC_OFF_ILLINSN  5'h08
//      unused           5'h0c


// Exception causes
`define EXC_CAUSE_ECALL  {1'b0, 4'd11};
`define EXC_CAUSE_EBREAK {1'b0, 4'd03};


// Hardware loop registers
// Caution: Changing this parameter is not sufficient to increase the number of
// hwloop registers! There are adjustments needed in hwloop_controller and
// controller (decoder).
`define HWLOOP_REGS 2


// Debug module
`define N_WP      2     // #Watchpoints
`define DCR_DP    0
`define DCR_CC    3:1
`define DCR_SC    4
`define DCR_CT    7:5

`define DMR1_ST   22
`define DMR2_WGB0 12
`define DMR2_WBS0 22

`define DSR_IIE   0
`define DSR_INTE  1


//`define BRANCH_PREDICTION

`endif
