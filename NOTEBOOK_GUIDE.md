# Jupyter Notebook Guide

## LLM_Aided_Testbench_Generation.ipynb

This comprehensive Jupyter notebook contains the complete LLM-Aided Testbench Generation system in a single, self-contained file that can be run directly.

### Quick Start

1. **Open the notebook**:
   ```bash
   jupyter notebook LLM_Aided_Testbench_Generation.ipynb
   ```
   Or use JupyterLab:
   ```bash
   jupyter lab LLM_Aided_Testbench_Generation.ipynb
   ```

2. **Configure your API key** (optional but recommended):
   - In Section 2, uncomment and set your OpenAI API key:
     ```python
     os.environ['OPENAI_API_KEY'] = 'your-api-key-here'
     ```
   - Or export it before starting Jupyter:
     ```bash
     export OPENAI_API_KEY='your-api-key-here'
     jupyter notebook LLM_Aided_Testbench_Generation.ipynb
     ```

3. **Run all cells**:
   - Click "Cell" → "Run All" to execute the entire notebook
   - Or run cells individually by selecting them and pressing `Shift + Enter`

### What's Included

The notebook contains **46 cells** organized into **12 sections**:

#### Core Implementation (Sections 1-8)
- **Section 1**: Installation and Setup
- **Section 2**: API Key Configuration
- **Section 3**: Output Directory Setup
- **Section 4**: LLM Client Implementation
- **Section 5**: Testbench Generator (Step 3)
- **Section 6**: Golden Model Generator (Step 4)
- **Section 7**: Testbench Updater (Step 5)
- **Section 8**: Pipeline Orchestrator

#### Examples (Sections 9-10)
- **Section 9**: Complete example with a 2-to-1 Multiplexer
  - Natural language description
  - Verilog module code
  - Pipeline execution
  - View all generated files
  - Simulation (if Icarus Verilog is installed)

- **Section 10**: Complete example with a 4-bit Adder
  - Natural language description
  - Verilog module code
  - Pipeline execution
  - Simulation

#### Summary (Section 11)
- **Section 11**: Summary and Next Steps
  - Overview of what was accomplished
  - How to use with your own modules
  - Resources and documentation

### Features

✅ **Self-Contained**: All code is included in the notebook
✅ **Well-Documented**: Each section has clear introductions
✅ **Two Complete Examples**: MUX and Adder with full pipeline execution
✅ **Simulation Ready**: Includes code to simulate testbenches
✅ **Educational**: Learn the complete workflow step-by-step

### Output

When you run the notebook, it creates:

```
notebook_output/
├── mux/
│   ├── testbench_initial.v
│   ├── golden_model.py
│   ├── test_patterns_with_golden.json
│   └── testbench_final.v
└── adder/
    ├── testbench_initial.v
    ├── golden_model.py
    ├── test_patterns_with_golden.json
    └── testbench_final.v
```

### Requirements

**Essential**:
- Python 3.7+
- Jupyter Notebook or JupyterLab
- openai Python package (installed automatically in first code cell)

**Optional (for simulation)**:
- Icarus Verilog (`iverilog` and `vvp`)
  - Ubuntu/Debian: `sudo apt-get install iverilog`
  - macOS: `brew install icarus-verilog`

### Using with Your Own Modules

To generate a testbench for your own Verilog module:

1. Add a new code cell after Section 10
2. Define your description and Verilog code:
   ```python
   my_description = """
   Your natural language description here...
   """
   
   my_verilog = """
   module my_module (
       ...
   );
   ...
   endmodule
   """
   ```

3. Run the pipeline:
   ```python
   result = pipeline.run(
       description=my_description,
       verilog_code=my_verilog,
       output_dir=f"{output_dir}/my_module"
   )
   ```

### Troubleshooting

**"Module 'openai' not found"**
- Restart the kernel and run all cells from the beginning
- The first code cell installs the required package

**"API key not configured" warning**
- This is normal if you haven't set your OpenAI API key
- The notebook will run in demo/mock mode
- To use full LLM features, set your API key in Section 2

**Simulation fails**
- Install Icarus Verilog: `sudo apt-get install iverilog`
- Or skip simulation cells (the testbenches are still generated)

### Tips

- **Run cells in order**: The notebook is designed to be run sequentially
- **Explore generated files**: Use the file viewing cells to examine outputs
- **Modify examples**: Feel free to modify the MUX or Adder examples
- **Save outputs**: Generated files are saved in `notebook_output/`

### Support

For more information:
- **Main README**: [README.md](README.md)
- **Usage Guide**: [USAGE_GUIDE.md](USAGE_GUIDE.md)
- **Project Summary**: [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)
- **Repository**: [github.com/FCHXWH823/LLM-aided-Testbench-Generation](https://github.com/FCHXWH823/LLM-aided-Testbench-Generation)

### License

See the main repository for license information.
