module moore1(clock, resetn, w, z);

input clock, resetn, w;
output z;
reg [1:0] y, Y;
parameter [1:0] A = 2'b00, B= 2'b01, C = 2'b10;

always @(*)
    case (y)
    A: if (w) Y=B;
       else Y=A;
    B: if (w) Y=C;
       else   Y=A;
    C: if (w) Y=C;
       else      Y=A; 
    default: Y=2'bxx;
    endcase

always @(negedge resetn, posedge clock)
if (resetn==0) y<=A;
else y<=Y;

assign z = (y==C);


endmodule