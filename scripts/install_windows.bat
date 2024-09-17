@echo off

REM Check prerequisites
call conda --version >nul 2>&1 && ( echo conda found ) || ( echo conda not found. Please refer to the README and install Miniconda. && exit /B 1)
REM call git --version >nul 2>&1 && ( echo git found ) || ( echo git not found. Please refer to the README and install Git. && exit /B 1)

call scripts/settings_windows.bat

call conda create -y -n %CONDA_ENV_NAME% python=3.9
call conda activate %CONDA_ENV_NAME%


call conda install -y -c anaconda git

REM ###FOMM###
call rmdir fomm /s /q
call git clone https://github.com/alievk/first-order-model.git fomm
call git clone https://github.com/kamyararshi/LivePortrait.git
call cd LivePortrait
call pip install -r requirements.txt
call pip install -U "huggingface_hub[cli]"
call huggingface-cli download KwaiVGI/LivePortrait --local-dir pretrained_weights --exclude "*.git*" "README.md" "docs"

call cd ..
call pip install -r requirements.txt --use-feature=2020-resolver

call echo "All installations done. Install torch and torchvision based on cuda version from nvcc -V according to https://pytorch.org/get-started/previous-versions/"