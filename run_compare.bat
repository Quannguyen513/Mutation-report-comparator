@echo off
chcp 65001 >nul 2>&1
title Mutation Report Comparator - Sequencher QC

echo.
echo ╔══════════════════════════════════════════════════╗
echo ║   MUTATION REPORT COMPARATOR — Sequencher QC    ║
echo ╚══════════════════════════════════════════════════╝
echo.

:: === CẤU HÌNH ===
:: Thay đổi đường dẫn bên dưới cho phù hợp:
set INPUT_DIR=C:\Users\quann\Desktop\mutation_files
set OUTPUT_DIR=C:\Users\quann\Desktop\comparison_results

:: ==================

echo [INPUT]  %INPUT_DIR%
echo [OUTPUT] %OUTPUT_DIR%
echo.

python "%~dp0mutation_comparator.py" --input "%INPUT_DIR%" --output "%OUTPUT_DIR%"

echo.
echo Nhấn phím bất kỳ để đóng...
pause >nul
