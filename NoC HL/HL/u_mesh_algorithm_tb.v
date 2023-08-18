`timescale 1ns/1ps
`include "define.v"
`include "parameters.v"

module u_mesh_algorithm_tb();
`include "functions.sv"
    parameter MY_XPOS = 0;
    parameter MY_YPOS = 1;

    reg [`MADDR:0] l1_dst;
    reg [`MADDR:0] l2_dst;
    reg [`MADDR:0] mult_dst;
    
    wire [4:0] l2_center;
    wire [`MADDR:0] doc;

    u_mesh_algorithm #(MY_XPOS, MY_YPOS) u0 (
        .l1_dst(l1_dst),
        .l2_dst(l2_dst),
        .mult_dst(mult_dst),
        .l2_center(l2_center),
        .doc(doc)
    );

    initial begin
        mult_dst = 56'b1010_1101_1110_1001_0100;
        l1_dst = find_l1(mult_dst, MY_XPOS);
        l2_dst = find_l2(l1_dst, MY_YPOS);

        $strobe("mult dst  : %b\n", mult_dst);
        $strobe("l1 dst    : %b\n", l1_dst);
        $strobe("l2 dst    : %b\n", l2_dst);
        $strobe("l2_center : %d\n", l2_center);
        $strobe("doc       : %b\n", doc);

        $finish;
    end

endmodule