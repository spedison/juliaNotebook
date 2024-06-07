docker run -it --rm  -p 8888:8888 -v ${PWD}:/working -e PYDEVD_DISABLE_FILE_VALIDATION=1  spedison/julia-notebook
