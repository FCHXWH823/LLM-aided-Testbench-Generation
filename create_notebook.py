#!/usr/bin/env python3
"""
Script to create a comprehensive Jupyter notebook for LLM-Aided Testbench Generation
"""

import json

def create_cell(cell_type, source, metadata=None):
    """Helper to create a notebook cell"""
    cell = {
        "cell_type": cell_type,
        "metadata": metadata or {},
        "source": source if isinstance(source, list) else [source]
    }
    if cell_type == "code":
        cell["execution_count"] = None
        cell["outputs"] = []
    return cell

# Initialize notebook structure
notebook = {
    "cells": [],
    "metadata": {
        "kernelspec": {
            "display_name": "Python 3",
            "language": "python",
            "name": "python3"
        },
        "language_info": {
            "codemirror_mode": {"name": "ipython", "version": 3},
            "file_extension": ".py",
            "mimetype": "text/x-python",
            "name": "python",
            "nbconvert_exporter": "python",
            "pygments_lexer": "ipython3",
            "version": "3.8.0"
        }
    },
    "nbformat": 4,
    "nbformat_minor": 4
}

# Add cells
cells = []

# Title Cell
cells.append(create_cell("markdown", """# LLM-Aided Testbench Generation

## Overview

This notebook demonstrates a complete **LLM-aided testbench generation system** for Verilog hardware designs. The system automates the creation of comprehensive testbenches with golden reference outputs using a 5-step pipeline:

1. **Step 1-2**: Accept natural language description and Verilog code
2. **Step 3**: Generate testbench with comprehensive test patterns using LLM
3. **Step 4**: Create Python golden model from description and compute expected outputs
4. **Step 5**: Update testbench with verification logic

### Features

- 🤖 **LLM-Powered**: Uses GPT-4 to generate intelligent testbenches
- 🎯 **Comprehensive Testing**: Covers corner cases, boundary values, and random patterns
- 🔍 **Automatic Verification**: Built-in pass/fail checking and test summaries
- 📝 **Self-Contained**: All code included in this notebook for easy execution

This notebook is completely self-contained - you can run it directly without any external dependencies (except the `openai` library)."""))

# Installation Section
cells.append(create_cell("markdown", """## Section 1: Installation and Setup

First, we install the required dependencies and set up the environment. The only external dependency is the OpenAI API client."""))

cells.append(create_cell("code", """# Install required packages
!pip install openai>=0.27.0 -q

# Import standard libraries
import os
import json
import sys
import subprocess
from typing import Dict, Any, List, Optional
import re

print("✓ Dependencies installed successfully")"""))

# API Configuration
cells.append(create_cell("markdown", """## Section 2: API Key Configuration

To use the full LLM-powered generation, you need to set your OpenAI API key. You can either:
1. Set it as an environment variable: `export OPENAI_API_KEY='your-api-key'`
2. Directly set it in the cell below

**Note**: Without an API key, the system will run in mock/demo mode for demonstration purposes."""))

cells.append(create_cell("code", """# Set your OpenAI API key here (or use environment variable)
# os.environ['OPENAI_API_KEY'] = 'your-api-key-here'

# Check if API key is set
api_key = os.environ.get('OPENAI_API_KEY', '')
if api_key:
    print("✓ OpenAI API key is configured")
else:
    print("⚠ Warning: OpenAI API key not set. Running in demo mode.")
    print("  Set your API key with: os.environ['OPENAI_API_KEY'] = 'your-key'")"""))

print("Notebook cells added: Introduction and Setup")
