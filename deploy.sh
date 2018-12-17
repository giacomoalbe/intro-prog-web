#!/bin/bash

echo "Building with mdbook"
mdbook build

echo "Checking out to gh-pages"
git checkout gh-pages

echo "Committing new release"
git add --all .
git commit -m "Book release $(date +"%d/%m/%Y - %H:%M")"

echo "Pushing to gh-pages"
git push -u origin gh-pages

echo "Checking back to master" 
git checkout master

echo "Finished!"

