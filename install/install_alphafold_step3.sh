#!/bin/bash -e

type wget 2>/dev/null || { echo "wget is not installed. Please install it using apt or yum." ; exit 1 ; }

CURRENTPATH=`pwd`
COLABFOLDDIR="${CURRENTPATH}/localcolabfold"

mkdir -p "${COLABFOLDDIR}"
cd "${COLABFOLDDIR}"

source "${COLABFOLDDIR}/conda/etc/profile.d/conda.sh"
export PATH="${COLABFOLDDIR}/conda/condabin:${PATH}"

# Download the updater
wget -qnc -O "$COLABFOLDDIR/update_linux.sh" \
    https://raw.githubusercontent.com/YoshitakaMo/localcolabfold/main/update_linux.sh
chmod +x "$COLABFOLDDIR/update_linux.sh"

pushd "${COLABFOLDDIR}/colabfold-conda/lib/python3.10/site-packages/colabfold"
# Use 'Agg' for non-GUI backend
sed -i -e "s#from matplotlib import pyplot as plt#import matplotlib\nmatplotlib.use('Agg')\nimport matplotlib.pyplot as plt#g" plot.py
# modify the default params directory
sed -i -e "s#appdirs.user_cache_dir(__package__ or \"colabfold\")#\"${COLABFOLDDIR}/colabfold\"#g" download.py
# suppress warnings related to tensorflow
sed -i -e "s#from io import StringIO#from io import StringIO\nfrom silence_tensorflow import silence_tensorflow\nsilence_tensorflow()#g" batch.py
# remove cache directory
rm -rf __pycache__
popd

# Download weights
"$COLABFOLDDIR/colabfold-conda/bin/python3" -m colabfold.download
chown -R root:root "${COLABFOLDDIR}/colabfold/params"

echo "Download of alphafold2 weights finished."
echo "-----------------------------------------"
echo "Installation of ColabFold finished."
echo "Add ${COLABFOLDDIR}/colabfold-conda/bin to your PATH environment variable to run 'colabfold_batch'."
echo -e "i.e. for Bash:\n\texport PATH=\"${COLABFOLDDIR}/colabfold-conda/bin:\$PATH\""
echo "For more details, please run 'colabfold_batch --help'."