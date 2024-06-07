FROM julia:1.10.3-bookworm

MAINTAINER spedison

RUN apt-get update; \
    apt-get install -y  python3 jupyter python3-pandas python3-pandas-lib python3-sklearn-pandas python3-matplotlib jupyter-notebook; \
    /usr/local/julia/bin/julia -e  "println(\"Installando pacotes\");using Pkg; Pkg.add(\"IJulia\");Pkg.add(\"Plots\");println(\"Instalacao terminada\");" ; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    mkdir /working; \
    jupyter notebook --generate-config ; \
    echo "c.NotebookApp.ip = '0.0.0.0'" >>  /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.allow_origin = '*'" >>  /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.port = 8888" >> /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook_config.py ; 
        
    
WORKDIR /working

EXPOSE 8888

#ENTRYPOINT ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
CMD ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
