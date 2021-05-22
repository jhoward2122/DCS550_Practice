library(blogdown)
library(blogdown)
> install_hugo()
The latest Hugo version is v0.83.1
Hugo 0.83.1 has already been installed. To reinstall, use the argument force = TRUE.
> new_site(theme = "vaga/hugo-theme-m10c")
― Creating your new site
| Installing the theme vaga/hugo-theme-m10c from github.com
trying URL 'https://github.com/vaga/hugo-theme-m10c/archive/master.tar.gz'
downloaded 491 KB

| Adding the sample post to content/posts/2020-12-01-r-rmarkdown/index.Rmd
| Converting all metadata to the YAML format
| Adding netlify.toml in case you want to deploy the site to Netlify
| Adding .Rprofile to set options() for blogdown
― The new site is ready
○ To start a local preview: use blogdown::serve_site(), or the RStudio add-in "Serve Site"
○ To stop a local preview: use blogdown::stop_server(), or restart your R session
► Want to serve and preview the site now? (y/n) y
Launching the server via the command:
  /Users/joshhoward/Library/Application Support/Hugo/0.83.1/hugo server --bind 127.0.0.1 -p 4321 --themesDir themes -t hugo-theme-m10c -D -F --navigateToChanged
Serving the directory . at http://localhost:4321
Launched the hugo server in the background (process ID: 40830). To stop it, call blogdown::stop_server() or restart the R session.
Rendering content/posts/2020-12-01-r-rmarkdown/index.Rmd... Done.
> stop_server()
The web server has been stopped.
> hugo_version()
[1] ‘0.83.1’
> serve_site()
Launching the server via the command:
  /Users/joshhoward/Library/Application Support/Hugo/0.83.1/hugo server --bind 127.0.0.1 -p 5118 --themesDir themes -t hugo-theme-m10c -D -F --navigateToChanged
Serving the directory . at http://localhost:5118
Launched the hugo server in the background (process ID: 42936). To stop it, call blogdown::stop_server() or restart the R session.


new_post(title="New GGplot2 graph", ext=" .Rmd", subdir="posts")
new_post(title = "Quiz (2) Final Project Topic", ext = ".Rmd", subdir = "posts")
new_post(title = "Homework (3) Day 5 plots", ext = ".Rmd", subdir = "posts")
