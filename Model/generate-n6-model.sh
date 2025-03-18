#!/bin/bash

stedgeai generate --model deeplab_v3_mobilenetv2_05_16_320_fft_qdq_int8.onnx --target stm32n6 --st-neural-art default@user_neuralart.json --input-data-type uint8 --output-data-type uint8 --inputs-ch-position chlast --outputs-ch-position chlast
cp st_ai_output/network.c .
cp st_ai_output/network_ecblobs.h .
cp st_ai_output/network_atonbuf.xSPI2.raw network_data.xSPI2.bin
arm-none-eabi-objcopy -I binary network_data.xSPI2.bin --change-addresses 0x70380000 -O ihex network_data.hex