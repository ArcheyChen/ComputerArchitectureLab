`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// Company: USTC ESLAB��Embeded System Lab��

// Engineer: Haojun Xia & Xuan Wang

// Create Date: 2019/02/22

// Design Name: RISCV-Pipline CPU

// Module Name: HarzardUnit

// Target Devices: Nexys4

// Tool Versions: Vivado 2017.4.1

// Description: Deal with harzards in pipline

//////////////////////////////////////////////////////////////////////////////////

module HarzardUnit(

    input wire CpuRst, ICacheMiss, DCacheMiss, 

    input wire BranchE, JalrE, JalD, 

    input wire [4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW,

    input wire [1:0] RegReadE,

    input wire MemToRegE,

    input wire [2:0] RegWriteM, RegWriteW,

    output reg StallF, FlushF, StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW,

    output reg [1:0] Forward1E, Forward2E

    );

    //Stall and Flush signals generate



    //Forward Register Source 1



    //Forward Register Source 2



endmodule



//����˵��

    //HarzardUnit����������ˮ�߳�ͻ��ͨ���������ݣ�forward�Լ���ˢ��ˮ�ν��������غͿ�����أ�����߼���·

    //�������ʵ�֡�ǰ�ڲ���CPU��ȷ��ʱ��������ÿ����ָ������������ָ�Ȼ��ֱ�Ӱѱ�ģ�������Ϊ����forward����stall����flush 

//����

    //CpuRst                                    �ⲿ�źţ�������ʼ��CPU����CpuRst==1ʱCPUȫ�ָ�λ���㣨���жμĴ���flush����Cpu_Rst==0ʱcpu��ʼִ��ָ��

    //ICacheMiss, DCacheMiss                    Ϊ����ʵ��Ԥ���źţ���ʱ�������ӣ���������cache miss

    //BranchE, JalrE, JalD                      ��������������

    //Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW     ��������������أ��ֱ��ʾԴ�Ĵ���1���룬Դ�Ĵ���2���룬Ŀ��Ĵ�������

    //RegReadE RegReadD[1]==1                   ��ʾA1��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�RegReadD[0]==1��ʾA2��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�����forward�Ĵ���

    //RegWriteM, RegWriteW                      ��������������أ�RegWrite!=3'b0˵����Ŀ��Ĵ�����д�����

    //MemToRegE                                 ��ʾEx�ε�ǰָ�� ��Data Memory�м������ݵ��Ĵ�����

//���

    //StallF, FlushF, StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW    ��������μĴ�������stall��ά��״̬���䣩��flush�����㣩

    //Forward1E, Forward2E                                                              ����forward

//ʵ��Ҫ��  

    //ʵ��HarzardUnitģ��   