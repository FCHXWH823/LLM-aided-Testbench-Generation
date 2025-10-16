"""
Step 5: Update testbench with golden outputs.
"""

from typing import Dict, Any, List
import re


class TestbenchUpdater:
    """Update generated testbench with golden outputs."""
    
    def update_testbench(self, testbench_code: str, test_patterns_with_outputs: List[Dict[str, Any]], 
                        module_info: Dict[str, Any]) -> str:
        """
        Update testbench code to include expected outputs and verification.
        
        Args:
            testbench_code: Original testbench code without expected outputs
            test_patterns_with_outputs: Test patterns with golden outputs
            module_info: Module information
            
        Returns:
            Updated testbench code with assertions and expected outputs
        """
        # Add verification logic
        updated_code = self._add_verification_logic(testbench_code, test_patterns_with_outputs, module_info)
        
        return updated_code
    
    def _add_verification_logic(self, testbench_code: str, test_patterns: List[Dict[str, Any]], 
                               module_info: Dict[str, Any]) -> str:
        """
        Add verification logic to the testbench.
        
        Args:
            testbench_code: Original testbench code
            test_patterns: Test patterns with expected outputs
            module_info: Module information
            
        Returns:
            Testbench code with verification logic added
        """
        lines = testbench_code.split('\n')
        updated_lines = []
        
        # Track if we're in the initial block
        in_initial = False
        indent_level = 0
        test_case_num = 0
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            # Detect initial block
            if 'initial' in stripped and 'begin' in stripped:
                in_initial = True
                updated_lines.append(line)
                # Add test result tracking variables after initial begin
                updated_lines.append("    integer passed_tests = 0;")
                updated_lines.append("    integer failed_tests = 0;")
                updated_lines.append("")
                continue
            
            # Check for test case markers (e.g., $display for test cases)
            if in_initial and '$display' in stripped and ('Test' in stripped or 'test' in stripped):
                # This is likely a test case display
                updated_lines.append(line)
                
                # Add delay to let outputs settle
                indent = len(line) - len(line.lstrip())
                indent_str = ' ' * indent
                updated_lines.append(f"{indent_str}#10; // Wait for outputs to settle")
                
                # Add verification for this test case if we have expected outputs
                if test_case_num < len(test_patterns):
                    pattern = test_patterns[test_case_num]
                    if 'expected_outputs' in pattern and pattern['expected_outputs']:
                        verification_lines = self._generate_verification(
                            pattern, module_info, indent
                        )
                        updated_lines.extend(verification_lines)
                    test_case_num += 1
                continue
            
            # Check for end of initial block
            if in_initial and stripped == 'end' or stripped.startswith('end'):
                # Add final summary before the end
                indent = len(line) - len(line.lstrip())
                indent_str = ' ' * indent
                updated_lines.append("")
                updated_lines.append(f"{indent_str}// Test Summary")
                updated_lines.append(f'{indent_str}$display("\\n========== Test Summary ==========");')
                updated_lines.append(f'{indent_str}$display("Total Tests: %0d", passed_tests + failed_tests);')
                updated_lines.append(f'{indent_str}$display("Passed: %0d", passed_tests);')
                updated_lines.append(f'{indent_str}$display("Failed: %0d", failed_tests);')
                updated_lines.append(f'{indent_str}$display("==================================\\n");')
                updated_lines.append("")
                updated_lines.append(line)
                in_initial = False
                continue
            
            updated_lines.append(line)
        
        return '\n'.join(updated_lines)
    
    def _generate_verification(self, pattern: Dict[str, Any], module_info: Dict[str, Any], 
                              indent: int) -> List[str]:
        """
        Generate verification code for a single test pattern.
        
        Args:
            pattern: Test pattern with expected outputs
            expected_outputs: Expected output values
            module_info: Module information
            indent: Indentation level
            
        Returns:
            List of verification code lines
        """
        lines = []
        indent_str = ' ' * indent
        
        expected = pattern.get('expected_outputs', {})
        if not expected:
            return lines
        
        # Get output signals
        outputs = module_info.get('outputs', [])
        
        # Generate verification for each output
        for output in outputs:
            output_name = output.split('[')[0].strip()  # Remove bit width if present
            output_name = output_name.split()[-1]  # Get the signal name
            
            if output_name in expected:
                expected_value = expected[output_name]
                
                # Check if expected value is boolean
                if isinstance(expected_value, bool):
                    expected_value = 1 if expected_value else 0
                
                # Generate comparison
                lines.append(f"{indent_str}if ({output_name} === {expected_value}) begin")
                lines.append(f'{indent_str}    $display("  ✓ {output_name} = %b (expected: {expected_value})", {output_name});')
                lines.append(f"{indent_str}    passed_tests = passed_tests + 1;")
                lines.append(f"{indent_str}end else begin")
                lines.append(f'{indent_str}    $display("  ✗ {output_name} = %b (expected: {expected_value})", {output_name});')
                lines.append(f"{indent_str}    failed_tests = failed_tests + 1;")
                lines.append(f"{indent_str}end")
        
        return lines
