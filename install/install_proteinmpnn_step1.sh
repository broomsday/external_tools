PROTEINMPNNDIR="/ProteinMPNN"

cd ${PROTEINMPNNDIR}
wget -q -P . https://github.com/conda-forge/miniforge/releases/download/25.3.0-3/Miniforge3-25.3.0-3-Linux-x86_64.sh
bash ./Miniforge3-25.3.0-3-Linux-x86_64.sh -b -p ${PROTEINMPNNDIR}/conda
rm ./Miniforge3-25.3.0-3-Linux-x86_64.sh
. "${PROTEINMPNNDIR}/conda/etc/profile.d/conda.sh"
export PATH="${PROTEINMPNNDIR}/conda/condabin:${PATH}"
conda create -p $PROTEINMPNNDIR/proteinmpnn-conda python=3.10 -y
