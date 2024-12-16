This is for setting the environment of the kernel to run the alevin_to_scanpy function analysis:

work is done on conda "spatialdata"

the following sequence of installations was used (sequence is sensitive):

--> conda install anaconda::gcc_impl_linux-64

--> conda install rust=1.55.0

--> pip3 install git+https://github.com/k3yavi/vpolo.git 
(using the git version, as there is some discrepancy in the one available through conda forge)

--> pip install openpyxl==3.0.9 
(if not present already)

