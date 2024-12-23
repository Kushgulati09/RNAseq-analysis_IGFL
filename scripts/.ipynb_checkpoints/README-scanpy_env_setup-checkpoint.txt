This is the procedure to create a fit environment for running the "alevin_to_scanpy" conversion.
follow the steps in this sequence only

--> activate the "spatialdata" environment (as the jupyter notebook runs on spatialdata kernel)
--> conda install anaconda::gcc_impl_linux-64
--> conda install rust=1.55.0
--> pip3 install git+https://github.com/k3yavi/vpolo.git (installing via github as there is discrepancy of some modules in github and conda available version)
--> pip install openpyxl==3.0.9 (if not already installed)
