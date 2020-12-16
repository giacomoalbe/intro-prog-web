#!/bin/bash

echo "Building with mdbook"
mdbook build

echo "Committing new release"
git add --all book/ 
git commit -m "Book release $(date +"%d/%m/%Y - %H:%M")"

echo "Pushing to gh-pages"
git subtree push --prefix book origin gh-pages

echo "Finished!"

