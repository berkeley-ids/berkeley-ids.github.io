
# General

The website is based on Quarto (https://quarto.org/docs/websites/) files. Quarto is based on markdown script, which it links together authomatically and compiles into html content. Quarto files end with `.qmd`; there are also important "yaml" files that have endings `.yml` or `.yaml` that govern characteristics of the website.

To edit the files and test out how your changes will look locally, I recommend using RStudio. It will compile the files by pushing button `Render` and create a local copy of what the website looks like.

To actually compile the changes so they show up on line you will want to run `quarto publish gh-pages` in a terminal within your `berkeley-ids.github.io` directory. Information on how to compile it and push it to the proper place in github can be found here: https://quarto.org/docs/publishing/github-pages.html
(we use method two `quarto publish gh-pages`). All the setup is already in place, so the main thing a new editor needs to do is to download quarto (https://quarto.org/docs/download/).

In addition, you need to actually commit your changes to the quarto files and push them to github's `master` branch so they are available for everyone. Otherwise, other people might make edits and work with an older version of the website. This is separate from the publishing step (which pushes the *compiled* version to the `gh-pages` branch, which is where github pulls from for the website.)

A note about branches: you shouldn't be working on the branch `gh-pages`, except through the quarto publish command. If you are manually working with git on the command line, make sure you are always in the `master` branch.

# Seminars

The file for the seminar landing page is `seminarseries.qmd`. Accompanying text can be added here, but the list of speakers is generated automatically by creating the proper files in the proper locations.

## General structure

Under the folder `seminarentries` there are folders per semester, corresponding with the content for the speakers for that semester.

The yaml heading at the top of the file `seminarseries.qmd` identifies the folder that corresponds to the current semester (and therefore will go under our upcoming events).

The yaml heading at the top of the file `seminarentries/index.qmd` creates a list of all seminars and should pull from all the folders, regardless of year, in the `seminarentries` folder.

## Adding seminar speakers

We'll assume you are updating the `2026Spring` semester seminar speakers' information. In this folder there is a folder for each speaker, which should contain one file called `index.qmd` and (optionally) one image file of the speaker. 

To add a new speaker, create a folder for them, and then create/add these two files. For the `index.qmd` file, copy from another existing folder, and just update the following components:

* The header should look like this, with this information updated for the speaker. The image should be the name of the image file that has the picture of the speaker:
```
---
title: "Ever Since Allais and Ellsberg"
author: 
  - name: Shachar Kariv
    affiliation: Department of Economics
date: '2026-02-02'
image: shachar.jpg
categories: "Spring 2026"
---
```
* The text for the Abstract should be added.
* No other text should be changed in the file `image.qmd`.

