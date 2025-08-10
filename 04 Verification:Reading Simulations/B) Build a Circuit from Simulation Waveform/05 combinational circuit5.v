module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    always @(*)begin
        if( a == 4'b1010 && b == 4'b1011 && d == 4'b1101 && e == 4'b1110)begin
            case(c)
            4'b0000 : q<= 4'b1011;
            4'b0001 : q<= 4'b1110;
            4'b0010 : q<= 4'b1010;
            4'b0011 : q<= 4'b1101;
            default : q <= 4'b1111;
            endcase
        end
        else if(a == 4'b1 && b == 4'b0010 && d == 4'b0011 && e == 4'b0100 && c <= 4'b1000)begin
            case(c)
            4'b0000 : q<= 4'b0010;
            4'b0001 : q<= 4'b0100;
            4'b0010 : q<= 4'b0001;
            4'b0011 : q<= 4'b0011;
            default : q <= 4'b1111;
            endcase
        end
        else if(a == 4'b0101 && b == 4'b0110 && d == 4'b0111 && e == 4'b1000 && c <= 4'b0111)begin
            case(c)
            4'b0000 : q<= 4'b0110;
            4'b0001 : q<= 4'b1000;
            4'b0010 : q<= 4'b0101;
            4'b0011 : q<= 4'b0111;
            default : q <= 4'b1111;
            endcase
        end
        else if(a == 4'b0101 && b == 4'b1010 && d == 4'b1000 && e == 4'b1001 && c <= 4'b0011)
            q<=4'b1000;
        else
        case (c)
        0: q = b;
        1: q = e;
        2: q = a;
        3: q = d;
        default: q = 4'hf;
        endcase
      end
endmodule
