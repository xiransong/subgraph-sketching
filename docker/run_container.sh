docker run --rm -d --gpus all --ipc=host \
  -v /home/sxr:/home/sxr \
  -p 9988:8888 \
  --name xiran-container \
  xiransong/subgraph-sketching:latest \
  jupyter lab --notebook-dir='/' --ip='*' \
  --port=8888 --allow-root --no-browser \
  --NotebookApp.token='' \
