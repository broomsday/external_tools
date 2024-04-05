PROTEINMPNNDIR="/ProteinMPNN"

cd ${PROTEINMPNNDIR}
wget -q -P . https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
bash ./Mambaforge-Linux-x86_64.sh -b -p ${PROTEINMPNNDIR}/conda
rm Mambaforge-Linux-x86_64.sh
. "${PROTEINMPNNDIR}/conda/etc/profile.d/conda.sh"
export PATH="${PROTEINMPNNDIR}/conda/condabin:${PATH}"
conda create -p $PROTEINMPNNDIR/proteinmpnn-conda python=3.10 -y
