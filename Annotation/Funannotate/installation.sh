### Quickstart Bioconda install
#add appropriate channels
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

#then use mamba as drop in replacmeent
mamba create -n funannotate funannotate
### Install just the python funannotate package
python -m pip install funannotate
python -m pip install git+https://github.com/nextgenusfs/funannotate.git

### Install GeneMark-ES/ET
#Download from this website: http://topaz.gatech.edu/GeneMark/license_download.cgi (GeneMarkS-2 version 1.14_1.25_lic LINUX 64)
#Move the downloaded file into lethdome using WinSCP
#Unzip the file
gunzip gm_key_64.gz

### Change the PATH
export PATH=/home/AGR.GC.CA/weib/mambaforge/envs/funannotate/bin/gmes_linux_64_4:$PATH
export GENEMARK_PATH=/home/AGR.GC.CA/weib/mambaforge/envs/funannotate/bin/gmes_linux_64_4

### Install Signalp
#Download from this website: https://services.healthtech.dtu.dk/services/SignalP-5.0/ 
#Move the downloaded file into lethdome using WinSCP
#Unzip the file
tar -xzf signalp-5.0b.Linux.tar.gz

### Change the PATH
export PATH/home/AGR.GC.CA/weib/mambaforge/envs/funannotate/bin/signalp-5.0b/bin:$PATH
export LD_LIBRARY_PATH=/home/AGR.GC.CA/weib/mambaforge/envs/funannotate/bin/signalp-5.0b/lib:$LD_LIBRARY_PATH
echo $LD_LIBRARY_PATH

chmod u+rwx /data/home/AGR.GC.CA/weib/funannotate_test/KE74/predict_misc/genome.softmasked.fa
7.Setup database and test your installation locally
#start up conda ENV
mamba activate funannotate

#check that all modules are installed
funannotate check --show-versions

#download/setup databases to a writable/readable location
funannotate setup -d $HOME/funannotate_db

#set ENV variable for $FUNANNOTATE_DB
echo "export FUNANNOTATE_DB=$HOME/funannotate_db" > /home/AGR.GC.CA/weib/mambaforge/envs/funannotate/etc/conda/activate.d/funannotate.sh
echo "unset FUNANNOTATE_DB" > / home/AGR.GC.CA/weib/mambaforge/envs /funannotate/etc/conda/deactivate.d/funannotate.sh

#run tests -- requires internet connection to download data
funannotate test -t all --cpus 16
