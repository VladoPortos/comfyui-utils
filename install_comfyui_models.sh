#!/bin/bash
#hearmeman/comfyui-wanvideo:v6
# Update package list and install necessary packages
echo "Updating package list and installing required packages..."
apt update && apt install -y fonts-dejavu-core fonts-freefont-ttf aria2

# Create necessary directories
echo "Creating directories..."
mkdir -p /ComfyUI/models/{mmaudio,diffusion_models,upscale_models,text_encoders,vae,clip_vision}

# Define download function for better logging
download_file() {
    local url=$1
    local output_path=$2

    echo "Downloading: $url -> $output_path"
    aria2c -c -x 16 -s 16 "$url" -o "$output_path"
}

# Downloading files
download_file "https://huggingface.co/city96/Wan2.1-I2V-14B-480P-gguf/resolve/main/wan2.1-i2v-14b-480p-Q4_K_M.gguf" "/ComfyUI/models/diffusion_models/wan2.1-i2v-14b-480p-Q4_K_M.gguf"
download_file "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth" "/ComfyUI/models/upscale_models/4x_foolhardy_Remacri.pth"
download_file "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors" "/ComfyUI/models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
download_file "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors" "/ComfyUI/models/vae/wan_2.1_vae.safetensors"
download_file "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors" "/ComfyUI/models/clip_vision/clip_vision_h.safetensors"

# MMAudio Models
download_file "https://huggingface.co/Kijai/MMAudio_safetensors/resolve/main/apple_DFN5B-CLIP-ViT-H-14-384_fp32.safetensors" "/ComfyUI/models/mmaudio/apple_DFN5B-CLIP-ViT-H-14-384_fp32.safetensors"
download_file "https://huggingface.co/Kijai/MMAudio_safetensors/resolve/main/mmaudio_large_44k_v2_fp32.safetensors" "/ComfyUI/models/mmaudio/mmaudio_large_44k_v2_fp32.safetensors"
download_file "https://huggingface.co/Kijai/MMAudio_safetensors/resolve/main/mmaudio_synchformer_fp32.safetensors" "/ComfyUI/models/mmaudio/mmaudio_synchformer_fp32.safetensors"
download_file "https://huggingface.co/Kijai/MMAudio_safetensors/resolve/main/mmaudio_vae_44k_fp32.safetensors" "/ComfyUI/models/mmaudio/mmaudio_vae_44k_fp32.safetensors"

echo "All downloads completed successfully!"
