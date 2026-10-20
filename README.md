sudo apt update
sudo apt install ruby3.3-dev

bundle install

git worktree add ../gh-pages gh-pages
./deploy_website.sh