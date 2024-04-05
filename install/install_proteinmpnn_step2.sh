PROTEINMPNNDIR="/ProteinMPNN"

cd ${PROTEINMPNNDIR}
export PATH="${PROTEINMPNNDIR}/conda/condabin:${PATH}"
conda activate $PROTEINMPNNDIR/proteinmpnn-conda
conda update -n base conda -y
conda install -y pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
conda deactivate
