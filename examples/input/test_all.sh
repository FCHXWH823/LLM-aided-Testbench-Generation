#!/bin/bash
echo "========================================="
echo "Testing All Verilog Modules"
echo "========================================="
echo ""

# Test Counter
echo "1. Testing Counter..."
iverilog -g2012 -o /tmp/counter_test.vvp counter_3bit.v tb_counter_3bit_golden.v
if [ $? -eq 0 ]; then
    echo "   ✅ Counter compilation successful"
    vvp /tmp/counter_test.vvp | tail -5
else
    echo "   ❌ Counter compilation failed"
fi
echo ""

# Test LFSR
echo "2. Testing LFSR..."
iverilog -g2012 -o /tmp/lfsr_test.vvp lfsr_4bit.v tb_lfsr_4bit_golden.v
if [ $? -eq 0 ]; then
    echo "   ✅ LFSR compilation successful"
    vvp /tmp/lfsr_test.vvp | tail -5
else
    echo "   ❌ LFSR compilation failed"
fi
echo ""

# Test MUX
echo "3. Testing MUX..."
iverilog -g2012 -o /tmp/mux_test.vvp mux2to1.v
if [ $? -eq 0 ]; then
    echo "   ✅ MUX compilation successful"
else
    echo "   ❌ MUX compilation failed"
fi
echo ""

# Test Adder
echo "4. Testing Adder..."
iverilog -g2012 -o /tmp/adder_test.vvp adder4bit.v
if [ $? -eq 0 ]; then
    echo "   ✅ Adder compilation successful"
else
    echo "   ❌ Adder compilation failed"
fi
echo ""

echo "========================================="
echo "All Tests Complete"
echo "========================================="
