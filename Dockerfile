FROM julia:1.10.3-bookworm

MAINTAINER spedison

RUN apt update; \
    apt install python3 jupyter python3-pandas python3-pandas-lib python3-sklearn-pandas python3-matplotlib; \
    /usr/bin/jupyter -e  "println(\"Installando pacotes\");using Pkg; Pkg.add(\"IJulia\");Pkg.add(\"Plots\");println(\"Instalacao terminada\");" ; \
    mkdir /working
    
WORKDIR /working

ENTRYPOINT ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
CMD ["/usr/bin/jupyter","notebook","--ip=0.0.0.0","--allow-root"]
