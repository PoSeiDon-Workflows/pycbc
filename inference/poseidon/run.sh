#!/usr/bin/env bash

pegasus-graphviz --label=xform \
                 --files \
                 --output inference.png \
                 workflow.yml &> /dev/null

pegasus-plan -vvvvvv \
             --conf pegasus.properties \
             --cluster label,horizontal \
             --sites condorpool \
             --output-sites local \
             --dir dags \
             --relative-submit-dir . \
             --cleanup leaf \
             --force \
             --submit \
             workflow.yml
