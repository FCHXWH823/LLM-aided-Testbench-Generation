#!/bin/bash
# Script to convert LAB_REPORT.md to PDF

echo "========================================="
echo "Converting LAB_REPORT.md to PDF"
echo "========================================="
echo ""

# Check if pandoc is installed
if command -v pandoc &> /dev/null; then
    echo "✓ pandoc found"
    
    # Convert to PDF
    echo "Converting..."
    pandoc LAB_REPORT.md -o LAB_REPORT.pdf \
        --pdf-engine=pdflatex \
        -V geometry:margin=1in \
        -V fontsize=11pt \
        -V colorlinks=true \
        -V linkcolor=blue \
        -V urlcolor=blue \
        --toc \
        --toc-depth=2 \
        2>&1
    
    if [ $? -eq 0 ]; then
        echo "✓ PDF generated successfully: LAB_REPORT.pdf"
        ls -lh LAB_REPORT.pdf
    else
        echo "✗ PDF generation failed"
        echo ""
        echo "Alternative: Use an online converter"
        echo "1. Upload LAB_REPORT.md to https://md2pdf.netlify.app/"
        echo "2. Or use https://www.markdowntopdf.com/"
    fi
else
    echo "✗ pandoc not found"
    echo ""
    echo "To install pandoc:"
    echo "  Ubuntu/Debian: sudo apt-get install pandoc texlive-latex-base"
    echo "  Mac: brew install pandoc basictex"
    echo ""
    echo "Alternative: Use an online converter"
    echo "1. Upload LAB_REPORT.md to https://md2pdf.netlify.app/"
    echo "2. Or use https://www.markdowntopdf.com/"
fi

echo ""
echo "========================================="
echo "Conversion Complete"
echo "========================================="
