FROM julia:1.10.3-bookworm

MAINTAINER spedison

RUN apt-get update; \
    apt-get install -y  python3 jupyter python3-pandas python3-pandas-lib python3-sklearn-pandas python3-matplotlib jupyter-notebook; \
    /usr/local/julia/bin/julia -e  "using Pkg; Pkg.add(\"IJulia\");Pkg.add(\"Plots\");Pkg.add(\"PyPlot\")" ; \
    \
    /usr/local/julia/bin/julia -e  "using Pkg; Pkg.add(\"IJuliaBell\");Pkg.add(\"Pango_jll\");Pkg.add(\"Cairo_jll\")" ; \
    \
    /usr/local/julia/bin/julia -e  "using Pkg; Pkg.add(\"GR\");Pkg.add(\"SimpleGraphAlgorithms\")" ; \
    \
    /usr/local/julia/bin/julia -e  "using Pkg; Pkg.add(\"PlotlyJS\");Pkg.add(\"PlotlyBase\")" ; \
    \
    /usr/local/julia/bin/julia -e  "using Pkg; Pkg.add(\"PythonPlot\");Pkg.add(\"UnicodePlots\");Pkg.add(\"Distributions\")" ; \
    \      
    echo "Instalacao Pacotes Júlia terminada" ; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    mkdir /working; \
    jupyter notebook --generate-config ; \
    echo "" >>  /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.ip = '0.0.0.0'" >>  /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.allow_origin = '*'" >>  /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.port = 8888" >> /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py ; \
    echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook_config.py ; 
        
    
WORKDIR /working

EXPOSE 8888

#ENTRYPOINT ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
CMD ["/usr/bin/jupyter","notebook","--no-browser","--NotebookApp.token=''","--NotebookApp.password=''"]
