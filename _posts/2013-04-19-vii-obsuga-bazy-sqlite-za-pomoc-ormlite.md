---
layout: post
title: VII Obsługa bazy SQLite, za pomocą ORMLite
date: 2013-04-19 17:33
author: admin
comments: true
categories: [Testy]
---
Witam po dłuższej przerwie, powodu której pewnie borykać się będzie każdy student na ostatnim semestrze - <strong>praca inżynierska.</strong>

Dzisiaj pragnę zaznajomić was, z użyciem zewnętrznych bibliotek oraz bazy SQLIte za pomocą ORM.<!--more-->

[pre]

Mapowanie obiektowo-relacyjne (ang. Object-Relational Mapping ORM)

sposób odwzorowania obiektowej architektury systemu informatycznego na bazę danych (lub inny element systemu)

o relacyjnym charakterze.

Implementacja takiego odwzorowania stosowana jest m.in. w przypadku, gdy tworzony system oparty jest na podejściu

obiektowym, a system bazy danychoperuje na relacjach. Z ORM związany jest szereg problemów wydajnościowych.

[/pre]

Jak czytamy na Wikipedii, jest to łącznik z bazy danych do obiektów. Nie trzeba się więc martwić ręcznym mapowaniem bazy do obiektów, ani ręcznymi zapytaniami przez składnie sqlite(choć jest to jak najbardziej możliwe).

W projekcie i tutorialu użyję ORM o nazwie ORMLite, które z obecnych Androidowych ORM (<a href="http://ormlite.com/">http://ormlite.com/</a>) ma najlepszą dokumentację i wsparcie. W chwili pisania,warte uwagi jest też ORM o nazwie GreenDAO
