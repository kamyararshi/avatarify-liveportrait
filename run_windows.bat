@echo off

call scripts/settings_windows.bat

call conda activate %CONDA_ENV_NAME%

set CONFIG=fomm/config/vox-adv-256.yaml

set PYTHONPATH=%PYTHONPATH%;%CD%;%CD%/LivePortrait
call python afy/cam_liveportrait.py --config %CONFIG% --relative --adapt_scale --no-pad --checkpoint vox-adv-cpk.pth.tar %*
