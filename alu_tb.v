module alu_8bit_tb;
reg [7:0] a, b;
reg [2:0] op;
wire [7:0] result;
wire carry, zero;

alu_8bit uut (.a(a),.b(b),.op(op),.result(result),.carry(carry),.zero(zero));

initial begin
$dumpfile("alu_dump.vdc");
$dumpvars(0, alu_8bit_tb);

a=8'd15; b=8'd10; op=3'b000; #10;
$display("ADD: %0d + %0d = %0d" , a, b, result);

a=8'd20; b=8'd5; op=3'b001; #10;
$display("SUB: %0d - %0d = %0d" , a, b, result);

a=8'hFF; b=8'h0F; op=3'b010; #10;
$display("AND: %h & %h = %h" , a, b, result);

a=8'hA0; b=8'h0B; op=3'b011; #10;
$display("OR: %h | %h = %h" , a, b, result);

a=8'hAA; b=8'h55; op=3'b100; #10;
$display("XOR: %h ^ %h = %h" , a, b, result);

a=8'd5; b=8'd55; op=3'b001; #10;
$display("SUB equal: zero=%b", zero);

$finish;
end
endmodule