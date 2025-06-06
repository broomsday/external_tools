COLABFOLDDIR="/AlphaFold/localcolabfold/"
ALPHAFOLD_ENV="/AlphaFold/localcolabfold/colabfold-conda"

source "${COLABFOLDDIR}/conda/etc/profile.d/conda.sh"
export PATH="${COLABFOLDDIR}/conda/condabin:${PATH}"
conda activate "$COLABFOLDDIR/colabfold-conda"
"$COLABFOLDDIR/colabfold-conda/bin/pip" install "tensorflow[and-cuda]==2.14"
pip install "numpy<2.0.0"
./update_linux.sh
conda deactivate
