#!/bin/bash
read -p "Commit description: " desc
git add -A && \
git commit -m "$desc" && \
git push -u origin master && \
echo "Everything is all set - Jonathan Ross 2019"