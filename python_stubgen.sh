
mkdir python/rlutilities
cp build38/Release/rlutilities.cp38-win_amd64.pyd python/rlutilities/rlutilities.cp38-win_amd64.pyd
cp build37/Release/rlutilities.cp37-win_amd64.pyd python/rlutilities/rlutilities.cp37-win_amd64.pyd
cd python/rlutilities
# stubs are generated based on the default python version, no reason why they shouldnt match..
py -m pybind11_stubgen rlutilities --no-setup -o=.. --root_module_suffix=
# __init__.py is hardcoded, this is fine as long as the dirs dont change
cp ../__init__.py __init__.py
cp ../../LICENSE.txt LICENSE.txt