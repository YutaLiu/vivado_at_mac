module blinky (
    input  wire clk,
    output reg [15:0] led
);

    reg [24:0] counter = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 0)
            led <= led + 1;
    end

endmodule
