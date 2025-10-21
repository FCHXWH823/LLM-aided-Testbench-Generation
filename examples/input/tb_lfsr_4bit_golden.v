// Golden testbench for 4-bit LFSR
// Manually written reference testbench

module tb_lfsr_4bit_golden;
    reg clk;
    reg reset_n;
    reg en;
    wire [3:0] lfsr_out;
    
    // Test tracking
    integer passed = 0;
    integer failed = 0;
    integer i;
    
    // Instantiate the DUT
    lfsr_4bit dut (
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .lfsr_out(lfsr_out)
    );
    
    // Clock generation (period = 10)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        $display("========================================");
        $display("Starting LFSR Golden Testbench");
        $display("========================================");
        
        // Test 1: Reset functionality
        $display("\nTest 1: Reset Functionality");
        reset_n = 0; en = 0;
        #20;
        if (lfsr_out === 4'b1000) begin
            $display("PASS: LFSR reset to seed value (1000)");
            passed = passed + 1;
        end else begin
            $display("FAIL: LFSR not reset (lfsr_out=%b)", lfsr_out);
            failed = failed + 1;
        end
        
        // Test 2: Enable and first shift
        $display("\nTest 2: Enable and First Shift");
        reset_n = 1; en = 1;
        #10; // Wait for first clock edge
        // After first shift with seed 1000, feedback = 1^0 = 1
        // Result should be {1, 1000[3:1]} = {1, 100} = 1100
        if (lfsr_out === 4'b1100) begin
            $display("PASS: LFSR shifted correctly");
            passed = passed + 1;
        end else begin
            $display("FAIL: LFSR shift incorrect (lfsr_out=%b, expected=1100)", lfsr_out);
            failed = failed + 1;
        end
        
        // Test 3: Sequence generation (verify it doesn't lock up)
        $display("\nTest 3: Sequence Generation (15 shifts)");
        for (i = 0; i < 14; i = i + 1) begin
            #10; // Wait for clock edge
            if (lfsr_out === 4'b0000) begin
                $display("FAIL: LFSR locked at 0000 at iteration %0d", i+2);
                failed = failed + 1;
            end
        end
        if (lfsr_out !== 4'b0000) begin
            $display("PASS: LFSR generated sequence without locking");
            passed = passed + 1;
        end
        
        // Test 4: Sequence repeats after 15 cycles
        $display("\nTest 4: Sequence Periodicity");
        reset_n = 0; #10; reset_n = 1; // Reset to start
        #10; // First state after reset
        for (i = 0; i < 15; i = i + 1) begin
            #10;
        end
        // After 15 more shifts, should be back to first state after reset
        if (lfsr_out === 4'b1100) begin
            $display("PASS: LFSR sequence repeated after 15 cycles");
            passed = passed + 1;
        end else begin
            $display("FAIL: LFSR sequence did not repeat (lfsr_out=%b)", lfsr_out);
            failed = failed + 1;
        end
        
        // Test 5: Disable functionality
        $display("\nTest 5: Disable Functionality");
        en = 0;
        #10;
        if (lfsr_out === 4'b1100) begin
            $display("PASS: LFSR held when disabled");
            passed = passed + 1;
        end else begin
            $display("FAIL: LFSR changed when disabled (lfsr_out=%b)", lfsr_out);
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
        $monitor("Time=%0t reset_n=%b en=%b lfsr_out=%b", $time, reset_n, en, lfsr_out);
    end
    
endmodule
