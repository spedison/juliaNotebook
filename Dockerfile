FROM julia:1.10.3-bookworm

MAINTAINER spedison

RUN apt-get update; \
    apt-get install -y  python3 jupyter python3-pandas python3-pandas-lib python3-sklearn-pandas python3-matplotlib; \
    /usr/bin/jupyter -e  "println(\"Installando pacotes\");using Pkg; Pkg.add(\"IJulia\");Pkg.add(\"Plots\");println(\"Instalacao terminada\");" ; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    mkdir /working
    
WORKDIR /working

ENTRYPOINT ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
CMD ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
