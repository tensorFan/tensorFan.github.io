# Minimalistic Jekyll Website

## Repository Structure
```
your-github-username.github.io/
├── _config.yml
├── _data/
│   └── navigation.yml
├── _includes/
│   ├── footer.html
│   ├── head.html
│   ├── header.html
│   └── theme-toggle.html
├── _layouts/
│   ├── default.html
│   ├── home.html
│   ├── page.html
│   └── post.html
├── _posts/
│   └── YYYY-MM-DD-post-title.md
├── _sass/
│   ├── _base.scss
│   ├── _layout.scss
│   ├── _syntax-highlighting.scss
│   └── _dark-mode.scss
├── assets/
│   ├── css/
│   │   └── main.scss
│   ├── js/
│   │   └── theme-toggle.js
│   └── images/
│       └── profile-picture.jpg
├── _papers/
│   └── papers.yml
├── about.md
├── blog.md
├── papers.md
├── research.md
├── index.md
└── 404.html
```

## Getting Started

1. Create a GitHub repository named `your-github-username.github.io`
2. Clone the repository to your local machine
3. Create the files and directories according to the structure above
4. Configure Jekyll:
bundle init, 
bundle add jekyll, 
{repeatable}: bundle exec jekyll serve # last command runs the local site locally at http://localhost:4000
5. Push to Github

## Steps to deploy website update
0. Make changes to folder /tensorFan.github.io, for example create a new post in /_posts/
1. In terminal on the main branch, run script ./deploy_website.sh
This will do the following:
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

It works since I am using a "git workflow" allowing me to avoid switching branch to gh-pages, and pushing to that remote from main. 
Note that the main branch does not need to get pushed.
The website is deployed from the gh-pages branch.