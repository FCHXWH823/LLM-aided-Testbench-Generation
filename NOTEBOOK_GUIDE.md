# LLM-Aided Testbench Generation - Lab Assignment Guide

## Quick Start

This repository contains a complete lab assignment demonstrating LLM-aided testbench generation for Verilog hardware designs.

### 📓 Jupyter Notebook (Recommended)

The easiest way to complete the lab is using the included Jupyter notebook:

```bash
jupyter notebook LLM_Aided_Testbench_Generation.ipynb
```

**OR** Open in Google Colab:
1. Upload `LLM_Aided_Testbench_Generation.ipynb` to Google Drive
2. Open with Google Colab
3. Run all cells

### 📋 What's Included

The notebook contains:
- ✅ Complete self-contained code
- ✅ Two working examples from ChipChat:
  - 3-bit Up Counter (sequential circuit)
  - 4-bit LFSR (maximal-length sequence)
- ✅ Full lab report sections:
  - Prompt modifications
  - Golden testbench comparison
  - iverilog compilation results
- ✅ Step-by-step execution
- ✅ All required documentation

### 🎯 Lab Assignment Requirements

This lab assignment fulfills all requirements:

| Requirement | Status | Location in Notebook |
|-------------|--------|---------------------|
| Two examples from ChipChat | ✅ | Sections 8 & 10 |
| Different from reference | ✅ | Section 1 (Report) |
| Prompt modifications | ✅ | Section 2 (Report) |
| Golden testbench comparison | ✅ | Section 3 (Report) |
| iverilog compilation | ✅ | Section 4 (Report) |

### 📊 Examples Selected

**Why these examples?**
- Different from reference notebook (binary_to_bcd, sequence_detector)
- Cover different circuit types (counter, LFSR)
- Demonstrate sequential circuit testing
- Include verification of all test cases

#### Example 1: 3-bit Up Counter
- **Type:** Sequential circuit
- **Features:** Enable, reset, wrap-around
- **Tests:** 5 comprehensive test cases
- **Status:** ✅ All tests pass

#### Example 2: 4-bit LFSR
- **Type:** Feedback shift register
- **Features:** Maximal-length sequence (15 states)
- **Tests:** 5 comprehensive test cases
- **Status:** ✅ All tests pass

### 🚀 Running the Notebook

1. **Install Dependencies:**
   ```bash
   pip install openai jupyter
   ```

2. **Set API Key** (in notebook or environment):
   ```bash
   export OPENAI_API_KEY='your-key-here'
   ```

3. **Open Notebook:**
   ```bash
   jupyter notebook LLM_Aided_Testbench_Generation.ipynb
   ```

4. **Run All Cells:**
   - Click "Cell" → "Run All"
   - Or run cells sequentially with Shift+Enter

### 📖 Lab Report

The complete lab report is included at the end of the notebook (Sections after Example 2).

**Report Sections:**
1. Selected Examples from ChipChat
2. Testbench System and User Prompt Modifications
3. Comparison with Golden Testbench Code
4. iverilog Compilation and Simulation Results
5. Summary and Conclusions

The same report is also available as a standalone PDF: `LAB_REPORT.md` (can be converted to PDF)

### 🔧 Converting Report to PDF

To generate a PDF from the markdown report:

```bash
# Using pandoc
pandoc LAB_REPORT.md -o LAB_REPORT.pdf --pdf-engine=pdflatex

# OR using markdown-pdf
npm install -g markdown-pdf
markdown-pdf LAB_REPORT.md
```

### 📁 File Structure

```
LLM-aided-Testbench-Generation/
├── LLM_Aided_Testbench_Generation.ipynb  ← Main notebook (RUN THIS)
├── LAB_REPORT.md                          ← Standalone report
├── NOTEBOOK_GUIDE.md                      ← This file
├── README.md                              ← General project README
├── examples/input/
│   ├── counter_3bit.v                     ← Counter Verilog
│   ├── counter_description.txt            ← Counter description
│   ├── tb_counter_3bit_golden.v           ← Counter golden TB
│   ├── lfsr_4bit.v                        ← LFSR Verilog
│   ├── lfsr_description.txt               ← LFSR description
│   └── tb_lfsr_4bit_golden.v              ← LFSR golden TB
└── examples/output/                       ← Generated files (created by notebook)
```

### ✅ Verification Checklist

Before submitting, verify:

- [ ] Notebook runs without errors
- [ ] Both examples generate testbenches
- [ ] All compilation results shown
- [ ] Golden testbench comparison included
- [ ] Prompt modifications documented
- [ ] Report sections complete
- [ ] PDF report generated (optional)

### 🐛 Troubleshooting

**Issue:** OpenAI API key not set
```
Solution: Set in notebook cell or environment variable
```

**Issue:** iverilog not installed
```
Solution: Install with apt-get (Linux) or brew (Mac)
sudo apt-get install iverilog
```

**Issue:** Notebook won't run in Colab
```
Solution: Install iverilog in first cell:
!apt-get install iverilog
```

### 📞 Support

For issues or questions:
1. Check the troubleshooting section above
2. Review the notebook comments
3. Consult the LAB_REPORT.md
4. Check the main README.md

### 🎓 Learning Objectives

By completing this lab, you will:
- Understand LLM-aided testbench generation
- Learn prompt engineering for hardware verification
- Compare LLM vs. manual testbench writing
- Use industry-standard EDA tools (iverilog)
- Verify sequential circuit designs

### 📝 Submission

For lab submission, provide:
1. **Notebook:** `LLM_Aided_Testbench_Generation.ipynb` (can be run directly)
2. **Report:** `LAB_REPORT.pdf` or the report sections in the notebook

---

**Ready to start?** Open the notebook and run all cells! 🚀
