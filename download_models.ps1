# ComfyUI Character Pose Generator - Model Download Script
# Run this to download required models for IPAdapter character consistency

$MODELS_DIR = "C:\Users\bermi\Projects\ComfyUI\models"

Write-Host "=== ComfyUI Character Pose Generator Setup ===" -ForegroundColor Cyan
Write-Host ""

# Create directories
New-Item -ItemType Directory -Force -Path "$MODELS_DIR\ipadapter" | Out-Null

# Function to download with progress
function Download-Model {
    param($url, $output, $name)
    if (Test-Path $output) {
        Write-Host "✓ $name already exists" -ForegroundColor Green
        return
    }
    Write-Host "Downloading $name..." -ForegroundColor Yellow
    try {
        Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing
        Write-Host "✓ $name downloaded" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to download $name : $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Step 1: CLIP Vision Model (required for IPAdapter)" -ForegroundColor Cyan
Download-Model `
    -url "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors" `
    -output "$MODELS_DIR\clip_vision\CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors" `
    -name "CLIP-ViT-H-14"

Write-Host ""
Write-Host "Step 2: IPAdapter Plus Model for SDXL" -ForegroundColor Cyan
Download-Model `
    -url "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors" `
    -output "$MODELS_DIR\ipadapter\ip-adapter-plus_sdxl_vit-h.safetensors" `
    -name "IPAdapter Plus SDXL"

Write-Host ""
Write-Host "Step 3: IPAdapter Plus Face Model (better for faces)" -ForegroundColor Cyan  
Download-Model `
    -url "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors" `
    -output "$MODELS_DIR\ipadapter\ip-adapter-plus-face_sdxl_vit-h.safetensors" `
    -name "IPAdapter Plus Face SDXL"

Write-Host ""
Write-Host "Step 4: ControlNet OpenPose for SDXL (pose control)" -ForegroundColor Cyan
Download-Model `
    -url "https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/main/control-lora-openposeXL2-rank256.safetensors" `
    -output "$MODELS_DIR\controlnet\control-lora-openposeXL2-rank256.safetensors" `
    -name "ControlNet OpenPose SDXL"

Write-Host ""
Write-Host "=== MANUAL DOWNLOAD REQUIRED ===" -ForegroundColor Yellow
Write-Host ""
Write-Host "You need an SDXL checkpoint. Options:" -ForegroundColor White
Write-Host "1. SDXL Base: https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/blob/main/sd_xl_base_1.0.safetensors" -ForegroundColor Gray
Write-Host "2. Juggernaut XL (popular): https://civitai.com/models/133005/juggernaut-xl" -ForegroundColor Gray
Write-Host "3. RealVisXL (photorealistic): https://civitai.com/models/139562/realvisxl" -ForegroundColor Gray
Write-Host ""
Write-Host "Download and place in: $MODELS_DIR\checkpoints\" -ForegroundColor White
Write-Host ""

Write-Host "=== Setup Complete ===" -ForegroundColor Green
Write-Host "Next: Start ComfyUI and load the character pose workflow" -ForegroundColor White
