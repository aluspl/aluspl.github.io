---
author: Alus
comments: true
date: 2017-04-03 20:54:04+00:00
layout: post
link: http://szymonmotyka.pl/android-sdk-setup/
slug: android-sdk-setup
title: Android SDK - Setup
wordpress_id: 1679
categories:
- Android
- Daj Się poznać
- Programowanie
tags:
- android
- android sdk
- dsp
---

Hello, this is my first post in english. As I’ve promised in polish version of this post, I wanted to recreate my Android SDK Tutorials. This time, with new technologies, new patterns and in 2 languages! Deal With It.
<!-- more -->


## Intro


First part of this post is about installation tools on Mac OS X, but from this page, we can also download tools for Windows and Linux distribution.
I used to be hater of Apple system, but everything has changed when I had bought mine Macbook (nowadays, MBP is much more expensive, than 2 years ago) .
Instalation of Android SDK + IDE is much easier now, than few years ago, when it worked on Eclipse (phew)


## First step


We need to download installer from this page and install on our machine. It contains all dependency, that we need to program our Android Application. [Download Android Studio and SDK Tools | Android Studio](https://developer.android.com/studio/index.html).

```id="attachment_1674" align="aligncenter" width="785"][![Android SDK](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screen-Shot-2017-03-26-at-23.32.13-785x350-785x350.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screen-Shot-2017-03-26-at-23.32.13-785x350.png) Android SDK```


## Homebrew


Second option will be useful for every developer, not only the Android ones. Even MS with .net core is using this, to download their packages. But this option is only for Mac user. Ubuntu users has apt-get , mac os users has Homebrew. This is a command line tool to install, update or uninstall other tools. We can also install **Homebrew Cask** [https://caskroom.github.io](https://caskroom.github.io)/)to enchant the tool or to install different windows apps (for example I have used it to install **Inskcape**) .

**Homebrew**: [https://brew.sh ](https://brew.sh))

[![](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screen-Shot-2017-03-27-at-18.50.09-785x168-785x168.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screen-Shot-2017-03-27-at-18.50.09-785x168.png)
We need to install it from command, which we can find on page (there is a link to actual version). After installation process, we need to open terminal and insert following command:

[code]
brew install android-sdk
[/code]

Homebrew will start downloading android sdk + needed dependencies, but it will skip installing IDE. So we need to install it manually (we can do it the way I have described it above - Android Studio or just download inteliJ from .jetBrains. Android Studio is based on inteliJ.
If you need to add the PATH to your SDK, insert in command line:

[code]
export PATH=$PATH:/usr/local/Cellar/android-sdk/&amp;amp;lt;VERSION&amp;amp;gt;/tools:/usr/local/Cellar/android-sdk/&amp;amp;lt;VERSION&amp;amp;gt;/platform-tools
[/code]

where VERSION is version of our sdk (we will find it after installation process sdk)


## Summary


This is everything to this part of my tutorial, I hope you enjoyed it. If you want to ask me any question, use FB (link do fp) or Twitter AlusPL
Greetings !

[embed]https://www.youtube.com/watch?v=Q8v0KHMtwBs[/embed]
