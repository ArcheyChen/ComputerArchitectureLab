`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: qihao
// Create Date: 03/09/2019 09:03:05 PM
// Design Name: 
// Module Name: DataExt 
// Target Devices: 
// Tool Versions: 
// Description: 
//////////////////////////////////////////////////////////////////////////////////

`include "Parameters.v"   
module DataExt(
    input wire [31:0] IN,
    input wire [1:0] LoadedBytesSelect,
    input wire [2:0] RegWriteW,
    output reg [31:0] OUT
    );    
    
    reg [31:0] tmp;
    
   initial begin
       OUT = 32'b0;
   end
   
   always@(*) begin
       case(RegWriteW)
           `LB:    begin
                       tmp <= IN >> (LoadedBytesSelect*8);
                       OUT <= { {24{tmp[7]}}, tmp[7:0] };
                   end
           `LH:    begin
                       tmp <= IN >> (LoadedBytesSelect*8);
                       OUT <= { {16{tmp[15]}}, tmp[15:0] };
                   end
           `LW:    OUT <= IN;
           `LBU:   OUT <= (IN >> (LoadedBytesSelect*8)) & 32'hff;
           `LHU:   OUT <= (IN >> (LoadedBytesSelect*8)) & 32'hffff;
           default:OUT <= 32'b0; 
       endcase
   end
    
endmodule

//����˵��
    //DataExt������������ֶ���load�����Σ�ͬʱ����load�Ĳ�ͬģʽ��Data Mem��load�������з��Ż����޷�����չ������߼���·
//����
    //IN                    �Ǵ�Data Memory��load��32bit��
    //LoadedBytesSelect     �ȼ���AluOutM[1:0]���Ƕ�Data Memory��ַ�ĵ���λ��
                            //��ΪDataMemory�ǰ��֣�32bit�����з��ʵģ�������Ҫ���ֽڵ�ַת��Ϊ�ֵ�ַ����DataMem
                            //DataMemһ�η���һ���֣�����λ��ַ������32bit������ѡ��������Ҫ���ֽ�
    //RegWriteW             ��ʾ��ͬ�� �Ĵ���д��ģʽ ������ģʽ������Parameters.v��
//���
    //OUT��ʾҪд��Ĵ���������ֵ
//ʵ��Ҫ��  
    //ʵ��DataExtģ��  