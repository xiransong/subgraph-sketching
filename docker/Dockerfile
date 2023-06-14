FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu20.04

# Set bash as the default shell
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive

# Build with some basic utilities
RUN apt-get update \
    && apt-get install -y apt-utils htop npm curl python3-pip tmux vim git wget \
    && ln -s /usr/bin/python3 /usr/bin/python

RUN cd ~ \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs

# install jupyterlab
RUN mkdir /opt/notebooks \
    && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ jupyterlab==3.6.3 \
    && jupyter lab --generate-config \
    && chmod -R 777 /root/.jupyter/jupyter_lab_config.py \
    && chmod -R 777 /opt/notebooks

# install jupyterlab plugin
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ jupyterlab-language-pack-zh-CN \
    jupyterlab-lsp jupyter-lsp \
    jupyterlab_code_formatter \
    jupyterlab-execute-time \
    jupyterlab-git \
    python-language-server[all]

# install some useful packages
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ black isort \
    tqdm ipywidgets \
    numba matplotlib scikit-learn pandas gensim \
    gpustat

# install pytorch
RUN pip install torch==1.13.1+cu117 --extra-index-url https://download.pytorch.org/whl/cu117

# install dgl
RUN pip install  dgl -f https://data.dgl.ai/wheels/cu117/repo.html \
    pip install  dglgo -i https://pypi.tuna.tsinghua.edu.cn/simple/
    # -f https://data.dgl.ai/wheels-test/repo.html

# install pyg
RUN pip install torch_geometric -i https://pypi.tuna.tsinghua.edu.cn/simple/ \
    pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-1.13.0+cu117.html

# install some other tools
RUN pip install fast-pagerank wandb datasketch ogb

# start jupyter lab
CMD jupyter lab --notebook-dir=/ --ip='*' --NotebookApp.token='' --port=8888 --allow-root --no-browser --NotebookApp.ResourceUseDisplay.track_cpu_percent=True

# when build image:
# ERROR: flake8 6.0.0 has requirement mccabe<0.8.0,>=0.7.0, but you'll have mccabe 0.6.1 which is incompatible.
# ERROR: flake8 6.0.0 has requirement pyflakes<3.1.0,>=3.0.0, but you'll have pyflakes 2.2.0 which is incompatible.
