#!/bin/bash
# Clone the repository
change_url=0
if [ ! -d "ldd-zh.github.io" ]; then
    git clone git@github.com:ldd-zh/ldd-zh.github.io.git ldd-zh.github.io
    change_url=1
fi

# build the book
wabook build

# Copy all files from the book directory to the cloned repository
cp -r book/* ldd-zh.github.io/

# Navigate to the cloned repository
cd ldd-zh.github.io
if [ $change_url -eq 1 ]; then
    git remote set-url origin github-ldd:ldd-zh/ldd-zh.github.io.git ldd-zh.github.io
fi
 

# Add all changes to git
git add .

# Commit the changes
git commit -m "Update book content"

# Push the changes to the remote repository
git push origin main
