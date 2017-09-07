---
layout: post
title: ANDROID – INSTALACJA SDK
date: 2017-03-27 13:24
author: Alus
comments: true
categories: [Android, android, Daj Się poznać, dsp, Programowanie, SDK]
---
W ramach DSP2017 poza #LifeLike postanowiłem zrobić popularny ostatnio w kinach Remastering. Dawno planowałem, ale nie było motywacji do tego, ale wypada nadrobić istotne braki w tematyce mobilnej, którą w końcu się specjalizowałem.
Na pierwszy plan wchodzi instalacja SDK, o którą były pytania. Jako bonus, w najbliższym czasie dodam wersję angielską tego postu (nie, nie użyje google translate!)

Instalator

Pierwsza część wpisu dotyczy instalacji narzędzi na system od Apple. Tak, system, którym tak długo gardziłem, aż po zakupie stwierdziłem “Wooow, to taki ładny i praktyczny w obsłudze linux, którego lubi Adobe i Unity”. Instalacja w obecnych czasach nie jest tak skomplikowana jak wcześniej. Pierwszy sposób ogranicza się do kilku kroków, ale niezależnie od platformy jest on prosty. Polega ona na pobraniu paczki Android Studio ze strony [Download Android Studio and SDK Tools | Android Studio](https://developer.android.com/studio/index.html).

[caption id="attachment_1674" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screen-Shot-2017-03-26-at-23.32.13-785x350.png"><img class="size-large wp-image-1674" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screen-Shot-2017-03-26-at-23.32.13-785x350-785x350.png" alt="Android SDK" width="785" height="350" /></a> Android SDK[/caption]

Strona, z której pobierzemy Android Studio z SDK
Wystarczy zainstalować i już.

Homebrew

Druga opcja przyda się każdemu programiście i użytkownikowi Maca. Chcąc, nie chcąc, każdy szanujący się programista powinien pogodzić się z linią komend, gdyż bywa ona bardzo użyteczna i odpowiednio się odwdzięczy.
Pewnie wiele pamięta z ubuntu “apt-get install” do instalacji aplikacji, wtyczek itp. W przypadku Mac OS, takim narzędziem jest właśnie Homebrew:https://brew.sh).
Instalacja jest prosta. Uruchamiamy terminal, wklejamy komendę ze strony Android i enter!
Po zainstalowaniu, wpisujemy w linii komend aby pobrać sdk:

[code]
brew install android-sdk
[/code]

Homebrew pobiera android-sdk i instaluje go na naszym urządzeniu. Jeśli potrzebujecie dodać sdk do PATH, aby mieć dostęp do narzędzi z platformy, wpisujemy w konsoli :

[code]
export PATH=$PATH:/usr/local/Cellar/android-sdk/&amp;lt;VERSION&amp;gt;/tools:/usr/local/Cellar/android-sdk/&amp;lt;VERSION&amp;gt;/platform-tools
[/code]

gdzie to wersja naszego SDK.

Podsumowanie

To tyle w dzisiejszym odcinku. Jeśli chcecie coś więcej na ten temat, piszcie albo na FP albo na maila.
