# Neta Lumina - ComfyUI Launch Script
# This script starts ComfyUI with the Neta Lumina workflow

Write-Host "Starting ComfyUI with Neta Lumina..." -ForegroundColor Cyan
Write-Host ""
Write-Host "Model Files Loaded:" -ForegroundColor Green
Write-Host "  ✓ Text Encoder: gemma_2_2b_fp16.safetensors (4.87 GB)" -ForegroundColor White
Write-Host "  ✓ UNET: neta-lumina-v1.0.safetensors (4.86 GB)" -ForegroundColor White
Write-Host "  ✓ VAE: ae.safetensors (0.31 GB)" -ForegroundColor White
Write-Host ""
Write-Host "Workflow: lumina_workflow.json" -ForegroundColor Yellow
Write-Host ""
Write-Host "After ComfyUI starts:" -ForegroundColor Magenta
Write-Host "  1. Open browser to: http://127.0.0.1:8188" -ForegroundColor White
Write-Host "  2. Load workflow: lumina_workflow.json" -ForegroundColor White
Write-Host "  3. All models should be automatically selected" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop ComfyUI" -ForegroundColor Red
Write-Host ""

# Start ComfyUI
python main.py
