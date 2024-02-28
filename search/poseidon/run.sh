#!/usr/bin/env bash

DIR=dags

pegasus-graphviz --label=xform \
                 --files \
                 --output search.png \
                 workflow.yml &> /dev/null

pegasus-plan -vvvvvv \
             --conf pegasus.properties \
             --cluster label,horizontal \
             --sites condorpool_copy \
             --output-sites local \
             --dir ${DIR} \
             --relative-submit-dir . \
             --cleanup leaf \
             --force \
             --submit \
             workflow.yml

# Skip downloading pycbc.tar and importing it via docker over and over again.
# Replace pycbc.tar with empty string
# Replace docker_init with container_init and set cont_image to pycbc
# find ${DIR} -name '*.sh' -exec sed -i '' -e 's/pycbc.tar//' -e 's/^docker_init pycbc/container_init ; cont_image='pycbc'/g' {} \;
