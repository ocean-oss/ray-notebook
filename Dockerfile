FROM jupyter/scipy-notebook

LABEL maintainer="Ocean <hello@ocean.dev>"

USER $NB_UID

RUN pip install --quiet --no-cache-dir \
    ray 'tensorflow==2.3.1' && \
    conda clean --all -f -y && \
    npm cache clean --force && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    rm -rf "/home/${NB_USER}/.node-gyp" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

WORKDIR $HOME