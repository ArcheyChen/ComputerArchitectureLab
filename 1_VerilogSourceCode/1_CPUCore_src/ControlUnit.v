`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB (Embeded System Lab)
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: ControlUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: RISC-V Instruction Decoder
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ControlUnit(
    input wire [6:0] Op,
    input wire [2:0] Fn3,
    input wire [6:0] Fn7,
    output wire JalD,
    output wire JalrD,
    output reg [2:0] RegWriteD,
    output wire MemToRegD,
    output reg [3:0] MemWriteD,
    output wire LoadNpcD,
    output reg [1:0] RegReadD,
    output reg [2:0] BranchTypeD,
    output reg [3:0] AluContrlD,
    output wire [1:0] AluSrc2D,
    output wire AluSrc1D,
    output reg [2:0] ImmType        
    );
    
    initial begin
        RegWriteD = 3'b0;
        MemWriteD = 4'b0;
        RegReadD = 2'b0;
        BranchTypeD = 3'b0;
        AluContrlD = 4'b0;
        ImmType = 3'b0;
    end
    
   /* always@(*) begin
        case(Op)
            0000011:    begin
                            MemToRegD <= 0;
                            case(Fn3)
                                
                            endcase
                        end
        endcase
    end
    */
endmodule

//����˵��
    //ControlUnit       �Ǳ�CPU��ָ��������������߼���·
//����
    // Op               ��ָ��Ĳ����벿��
    // Fn3              ��ָ���func3����
    // Fn7              ��ָ���func7����
//���
    // JalD==1          ��ʾJalָ���ID����׶�
    // JalrD==1         ��ʾJalrָ���ID����׶�
    // RegWriteD        ��ʾID�׶ε�ָ���Ӧ�� �Ĵ���д��ģʽ ������ģʽ������Parameters.v��
    // MemToRegD==1     ��ʾID�׶ε�ָ����Ҫ��data memory��ȡ��ֵд��Ĵ���,
    // MemWriteD        ��4bit�����ö������ʽ������data memory��32bit�ְ�byte����д��,MemWriteD=0001��ʾֻд�����1��byte����xilinx bram�Ľӿ�����
    // LoadNpcD==1      ��ʾ��NextPC�����ResultM
    // RegReadD[1]==1   ��ʾA1��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�RegReadD[0]==1��ʾA2��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�����forward�Ĵ���
    // BranchTypeD      ��ʾ��ͬ�ķ�֧���ͣ��������Ͷ�����Parameters.v��
    // AluContrlD       ��ʾ��ͬ��ALU���㹦�ܣ��������Ͷ�����Parameters.v��
    // AluSrc2D         ��ʾAlu����Դ2��ѡ��
    // AluSrc1D         ��ʾAlu����Դ1��ѡ��
    // ImmType          ��ʾָ�����������ʽ���������Ͷ�����Parameters.v��   
//ʵ��Ҫ��  
    //ʵ��ControlUnitģ��   