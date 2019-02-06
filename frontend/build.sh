#! /bin/bash

if [[ -d  taiga-front-dist ]]; then
    rm -rf taiga-front-dist
fi

 git clone https://github.com/taigaio/taiga-front-dist

 cd taiga-front-dist

# Production ready frontend is in "stable" and not in "master" therefore after clone I need to change to "stable"
 git checkout stable
 
 cd ..

 docker build -t vetorfy/taiga-front .

if [[ -d  taiga-front-dist ]]; then
    rm -rf taiga-front-dist
fi
