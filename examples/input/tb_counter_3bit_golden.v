// Golden testbench for 3-bit counter
// Manually written reference testbench

module tb_counter_3bit_golden;
    reg clk;
    reg reset_n;
    reg en;
    wire [2:0] count;
    
    // Test tracking
    integer passed = 0;
    integer failed = 0;
    
    // Instantiate the DUT
    counter_3bit dut (
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .count(count)
    );
    
    // Clock generation (period = 10)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        $display("========================================");
        $display("Starting Counter Golden Testbench");
        $display("========================================");
        
        // Test 1: Reset functionality
        $display("\nTest 1: Reset Functionality");
        reset_n = 0; en = 0;
        #20;
        if (count === 3'b000) begin
            $display("PASS: Counter reset to 0");
            passed = passed + 1;
        end else begin
            $display("FAIL: Counter not reset (count=%b)", count);
            failed = failed + 1;
        end
        
        // Test 2: Enable and counting
        $display("\nTest 2: Enable and Counting");
        reset_n = 1; en = 1;
        #10; // Wait for first clock edge
        if (count === 3'b001) begin
            $display("PASS: Counter incremented to 1");
            passed = passed + 1;
        end else begin
            $display("FAIL: Counter not incremented (count=%b)", count);
            failed = failed + 1;
        end
        
        // Test 3: Multiple increments
        $display("\nTest 3: Multiple Increments");
        repeat(6) #10; // Count from 1 to 7
        if (count === 3'b111) begin
            $display("PASS: Counter reached 7");
            passed = passed + 1;
        end else begin
            $display("FAIL: Counter incorrect (count=%b, expected=111)", count);
            failed = failed + 1;
        end
        
        // Test 4: Wrap-around
        $display("\nTest 4: Wrap-around");
        #10; // One more clock edge should wrap to 0
        if (count === 3'b000) begin
            $display("PASS: Counter wrapped to 0");
            passed = passed + 1;
        end else begin
            $display("FAIL: Counter did not wrap (count=%b)", count);
            failed = failed + 1;
        end
        
        // Test 5: Disable functionality
        $display("\nTest 5: Disable Functionality");
        en = 0;
        #10;
        if (count === 3'b000) begin
            $display("PASS: Counter held at 0 when disabled");
            passed = passed + 1;
        end else begin
            $display("FAIL: Counter changed when disabled (count=%b)", count);
            failed = failed + 1;
        end
        
        // Test summary
        $display("\n========================================");
        $display("Test Summary");
        $display("========================================");
        $display("Passed: %0d", passed);
        $display("Failed: %0d", failed);
        $display("Total:  %0d", passed + failed);
        $display("========================================");
        
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time=%0t reset_n=%b en=%b count=%b", $time, reset_n, en, count);
    end
    
endmodule
