`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB��Embeded System Lab��
// Engineer: Haojun Xia
// Create Date: 2019/03/14 11:21:33
// Design Name: RISCV-Pipline CPU
// Module Name: NPC_Generator
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: Choose Next PC value
//////////////////////////////////////////////////////////////////////////////////
module NPC_Generator(
    input wire [31:0] PCF,JalrTarget, BranchTarget, JalTarget,
    input wire BranchE,JalD,JalrE,
    output reg [31:0] PC_In
    );
    
    initial begin
        PC_In = 32'b0;
    end
    
    always@(*) begin
        if(JalrE == 1)
            PC_In <= JalrTarget;
        else if(BranchE == 1)
            PC_In <= BranchTarget;
        else if(JalD == 1)
            PC_In <= JalTarget;
        else
            PC_In <= PCF + 32'd4;
    end
    
endmodule

//����˵��
    //NPC_Generator����������Next PCֵ��ģ�飬���ݲ�ͬ����ת�ź�ѡ��ͬ����PCֵ
//����
    //PCF              �ɵ�PCֵ
    //JalrTarget       jalrָ��Ķ�Ӧ����תĿ��
    //BranchTarget     branchָ��Ķ�Ӧ����תĿ��
    //JalTarget        jalָ��Ķ�Ӧ����תĿ��
    //BranchE==1       Ex�׶ε�Branchָ��ȷ����ת
    //JalD==1          ID�׶ε�Jalָ��ȷ����ת
    //JalrE==1         Ex�׶ε�Jalrָ��ȷ����ת
//���
    //PC_In            NPC��ֵ
//ʵ��Ҫ��  
    //ʵ��NPC_Generatorģ��  
