#!/bin/bash

# if python venv not set up
if [ ! -d "venv" ]; then
    echo "Setting up python venv"
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
else 
    source venv/bin/activate
fi

ACCESS_TOKEN=$(cat .access_token) GITHUB_ACTOR=tbxark EXCLUDED_LANGS=Jupyter\ Notebook EXCLUDE_FORKED_REPOS=true python generate_images.py
git add generated
git commit -m "Update status"
git push