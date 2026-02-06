
# General

This is the github repos that contains the backend content for the website (https://berkeley-ids.github.io/seminarseries.html). 

The website is based on Quarto (https://quarto.org/docs/websites/) files. Quarto is based on markdown script, which it links together authomatically and compiles into html content. Quarto files end with `.qmd`; there are also important "yaml" files that have endings `.yml` or `.yaml` that govern characteristics of the website.

To edit the files and test out how your changes will look locally, I recommend using RStudio. It will compile the files by pushing button `Render` and create a local copy of what the website looks like. However, this requires downloading R etc, so if you don't have a RStudio setup already, editing can be done in other editors. If you visit https://quarto.org/docs/get-started/, they will walk through how to work with quarto in your choice of editor (VSCode, Jupyter, or just a text editor).

To actually compile the changes so they show up on the website you can do this in two ways:

1. **On your local machine:** This assumes you are making edits on your machine from a clone of the repository that resides on your machine. Then within the directory with the git repos, run `quarto publish gh-pages` in a terminal within your `berkeley-ids.github.io` directory. Information on how to compile it and push it to the proper place in github can be found here: https://quarto.org/docs/publishing/github-pages.html
(we use method two `quarto publish gh-pages`). All the setup is already in place, so the main thing a new editor needs to do is to download quarto (https://quarto.org/docs/download/). Some editors, like RStudio, provide capability to do the online publishing within the editor as well (see quarto documentation for details).
2. **On github website:** Go to the "Actions" tab. On the left-hand side you should see a workflow action called "Manually Render and Publish". Click on this. In the main part of the screen, you should see `This workflow has a workflow_dispatch event trigger.` and to the far right of that a drop down menu that says `Run workflow`. Click on `Run workflow`, make sure the `master` branch is chosen, and click on `Run workflow`. At this time we only have it set up to be manually compiled, but a "to-do" item would be to create a workflow that runs automatically every week (for example to update the "Upcoming events" to show only upcoming events)

In addition, you need to actually commit your changes to the quarto files and push them to github's `master` branch so they are available for everyone. Otherwise, other people might make edits and work with an older version of the website. This is separate from the publishing step (which pushes the *compiled* version to the `gh-pages` branch, which is where github pulls from for the website.)

A note about branches: you shouldn't be working on the branch `gh-pages`, except through the quarto publish command. Make sure you are always in the `master` branch when you are editing.

# Seminars

The file for the seminar landing page is `seminarseries.qmd`. Accompanying text can be added here, but the list of speakers is generated automatically by creating the proper files in the proper locations.

## General structure

Under the folder `seminarentries` there two folders, `Current` and `Past`.

The yaml heading at the top of the file `seminarseries.qmd` pulls and lists speakers from `Current`

The yaml heading at the top of the file `seminarentries/Past/index.qmd` creates a list of all seminars in the Past folder. 

## Adding seminar speakers

You should only be adding speakers to the `Current` folder. In this folder, there is a folder for each speaker, which should contain one file called `index.qmd` and (optionally) one image file of the speaker. 

To add a new speaker, create a folder for them, and then create/add these two files. If you are working directly on GitHub, to create a new folder click on a button to create a new file and type `folder1/file1` to create a file with name `file1` within folder `folder1`. So for example, you would type the name of your new file as `2026-John_Doe/index.qmd`.

For the `index.qmd` file, copy the text from another existing folder, and just update the following components:

* The header should look like this, with this information updated for the speaker:
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
The image entry should be the name of the image file of the speaker that is in the same folder.
* The text for the Abstract should be added in the appropriate space after the header.
* No other text should be changed in the file `image.qmd`.

## About the folder of Past Speakers

Every time the website is compiled, there is an automatic filtering to move speakers from the `Current` folder to the `Past` folder, so no one should have to do this automatically. It is scheduled to recompile every **Tuesday at midnight** (in addition to any manual compilations someone might trigger, described above). If the seminar date changes, this might need to be fixed.

Speakers are automatically moved from the `Current` folder into the `Past` folder *on compilation* which means those changes won't become part of the github code base. That means the `Past` folder on github could look empty or not up-to-date, but still render correctly. Seminar organizers can manually move the folders from past speakers into the `Past` directory just to clean things up, for example at the beginning of the new semesters, but it is not necessary and needs to be done carefully so nothing is deleted.



