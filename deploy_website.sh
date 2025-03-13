#!/bin/bash

# Build the site with Jekyll
bundle exec jekyll build

# Copy the contents of the _site directory to the gh-pages branch
cp -r _site/* ../gh-pages/

# Navigate to the gh-pages branch directory
cd ../gh-pages

# Add all the changes (new or modified files)
git add .

# Commit the changes with a message
git commit -m "Update GitHub Pages"

# Push the changes to the gh-pages branch
git push origin gh-pages
