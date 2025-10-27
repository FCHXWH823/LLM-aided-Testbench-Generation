# Jupyter Notebook Guide

## LLM_Testbench_Generation_Demo.ipynb

This interactive Jupyter notebook provides a complete, hands-on tutorial for the LLM-aided Testbench Generation system.

### What's Inside

The notebook is organized into 8 comprehensive sections, each with introductory explanations:

1. **Introduction and Setup** - Environment configuration and package installation
2. **Understanding the Pipeline** - Detailed explanation of the 5-step generation process
3. **Example 1: 2-to-1 Multiplexer** - Simple combinational logic example
4. **Example 2: 4-bit Adder** - More complex multi-bit arithmetic example
5. **Understanding Generated Files** - Deep dive into all output files
6. **Comparing Testbench Stages** - See how verification logic is added
7. **Simulating the Testbench** - Optional simulation with Icarus Verilog
8. **Summary and Next Steps** - Recap and guidance for further exploration

### How to Use

#### Option 1: Run with Jupyter Notebook

```bash
# Install Jupyter if not already installed
pip install jupyter

# Start Jupyter
jupyter notebook

# Open LLM_Testbench_Generation_Demo.ipynb in the browser
```

#### Option 2: Run with JupyterLab

```bash
# Install JupyterLab
pip install jupyterlab

# Start JupyterLab
jupyter lab

# Open the notebook from the file browser
```

#### Option 3: Run with VS Code

1. Install the Python and Jupyter extensions for VS Code
2. Open the notebook file
3. Select your Python interpreter
4. Run cells interactively

### Requirements

The notebook will automatically install required packages when you run the first cell:
- `openai>=0.27.0` (for LLM integration)

The project dependencies are:
- Python 3.7+
- All modules from the `src/` directory
- (Optional) Icarus Verilog for simulation

### Running Modes

The notebook supports two modes:

#### 1. Full LLM Mode (Recommended)
With an OpenAI API key, the notebook uses real LLM-powered generation:

```python
# In the API key configuration cell:
os.environ['OPENAI_API_KEY'] = 'your-api-key-here'
```

#### 2. Demo Mode (No API Key Required)
Without an API key, the notebook runs in demo mode with mock generation. This is sufficient for:
- Understanding the workflow
- Learning the pipeline structure
- Exploring the generated file formats

### What the Notebook Does

When you run all cells, the notebook will:

1. ✓ Install and import required packages
2. ✓ Generate a testbench for a 2-to-1 multiplexer
3. ✓ Generate a testbench for a 4-bit adder
4. ✓ Create Python golden models for both examples
5. ✓ Compute expected outputs for all test patterns
6. ✓ Generate final testbenches with verification logic
7. ✓ (Optionally) Simulate the testbenches if Icarus Verilog is installed

### Generated Files

The notebook creates files in `notebook_output/`:

```
notebook_output/
├── mux/
│   ├── testbench_initial.v           # Initial testbench
│   ├── golden_model.py                # Python reference model
│   ├── test_patterns_with_golden.json # Test data
│   ├── testbench_final.v              # Complete testbench
│   └── mux2to1.v                      # Module file
└── adder/
    ├── testbench_initial.v
    ├── golden_model.py
    ├── test_patterns_with_golden.json
    ├── testbench_final.v
    └── adder4bit.v
```

These directories are excluded from git (see `.gitignore`).

### Key Features

- **Self-contained**: All code is in the notebook, no external scripts needed
- **Educational**: Each section has clear introductions explaining concepts
- **Interactive**: Run cells one by one or all at once
- **Complete examples**: Two full examples from start to finish
- **No manual setup**: Packages installed automatically
- **Works offline**: Demo mode doesn't require internet/API access

### Troubleshooting

**Issue: "No module named 'src'"**
- Solution: Make sure you're running the notebook from the project root directory

**Issue: "OpenAI API key not configured"**
- Solution: Either set your API key in the configuration cell or continue in demo mode

**Issue: Simulation section fails**
- Solution: This is optional. Install Icarus Verilog (`iverilog`) or skip this section

**Issue: Kernel crashes**
- Solution: Restart the kernel and run cells again (Jupyter: Kernel → Restart)

### Tips

1. **Read the introductions**: Each section starts with explanatory text
2. **Run sequentially**: Execute cells in order for best results
3. **Experiment**: Try modifying the example descriptions or Verilog code
4. **Save outputs**: Generated files are saved and can be inspected later

### Next Steps After the Notebook

Once you've completed the notebook:

1. Try generating testbenches for your own Verilog modules
2. Use the command-line tool: `python main.py --example`
3. Run the interactive demo: `python demo.py`
4. Read the detailed guides: `USAGE_GUIDE.md` and `README.md`

### Contributing

Found an issue or have suggestions for the notebook? Please open an issue or submit a pull request!

---

**Note**: This notebook is designed to be run directly without modifications. All sections include helpful introductions to guide you through the process.
