#!/bin/bash

echo "Building with mdbook"
mdbook build

echo "Committing new release"
git add --all book/
git commit -m "Book release $(date +"%d/%m/%Y - %H:%M")"

echo "Pushing to gh-pages"
#git subtree push -f --prefix book origin gh-pages
git push origin `git subtree split --prefix book`:gh-pages --force

echo "Finished!"
