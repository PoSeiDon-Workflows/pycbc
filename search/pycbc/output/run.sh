#!/usr/bin/env bash

cd /home/poseidon/workflows/pycbc/search/pycbc/data/
./get.sh .
./bank.sh .
./stats.sh .

cd /home/poseidon/workflows/pycbc/search/pycbc/output/
pegasus-plan --conf ./pegasus-properties.conf --dir submitdir --output-sites local --sites condorpool_copy,local --cluster label,horizontal --cleanup inplace --relative-dir work -q --submit --dax gw.dax
sleep 60
while [[ "$(pegasus-status | head -n 2 | tail -n 1)" != "(no matching jobs found in Condor Q)" ]]; do
   sleep 30
done
