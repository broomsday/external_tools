#!/bin/bash -e

type wget 2>/dev/null || { echo "wget is not installed. Please install it using apt or yum." ; exit 1 ; }

CURRENTPATH=`pwd`
COLABFOLDDIR="${CURRENTPATH}/localcolabfold"

mkdir -p "${COLABFOLDDIR}"
cd "${COLABFOLDDIR}"

source "${COLABFOLDDIR}/conda/etc/profile.d/conda.sh"
export PATH="${COLABFOLDDIR}/conda/condabin:${PATH}"

# install ColabFold and Jaxlib
"$COLABFOLDDIR/colabfold-conda/bin/pip" install --no-warn-conflicts \
    "colabfold[alphafold-without-jax] @ git+https://github.com/sokrypton/ColabFold"
"$COLABFOLDDIR/colabfold-conda/bin/pip" install --upgrade "jax[cuda11_pip]==0.4.23" \
    -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
"$COLABFOLDDIR/colabfold-conda/bin/pip" install "colabfold[alphafold]"
"$COLABFOLDDIR/colabfold-conda/bin/pip" install --upgrade tensorflow
"$COLABFOLDDIR/colabfold-conda/bin/pip" install silence_tensorflow

