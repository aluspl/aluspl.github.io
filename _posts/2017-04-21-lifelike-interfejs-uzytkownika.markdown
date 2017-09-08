---
author: Alus
comments: true
date: 2017-04-21 20:51:45+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-interfejs-uzytkownika/
slug: lifelike-interfejs-uzytkownika
title: LifeLike - Interfejs Użytkownika
wordpress_id: 1713
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- dsp
- dsp2017
- LifeLike
- unity3d
---

Witam w następnej części dotyczącej LifeLike. Poprzednio pisałem o zaznaczaniu postaci i dodawaniu przeciwników oraz przełączaniu się między nimi. Dzisiaj, przejdę do UI!


## Manager UI w LifeLike


Jak można było zobaczyć, z UI można było spotkać się w menu głównym i w mini grze The Ball, które znajdują się pod linkiem poniżej. [Link](http://aluspl.github.io/RogueLikeDSP/Versions/light/)
W UI Managerze zawarte są metody do kontrolowania komponentów UI, jak np. okno z logami oraz z szczegółami. UI Manager jest podpięty do **GameManagera**.


## Ekran Logów


PIerwszym elementem dla rasowych Rogue Like i Oldschoolowych RPG jest ekran logów. Czyli pole tekstowe z logiem - ile zadaliśmy, co znaleźliśmy i ewentualnie, co, kto do nas powiedział.
Jednak ekran logów trzeba było ograniczyć do określonej liczby linijek - tzn. czyścić te pierwsze, aby cały czas nie było więcej niż wybrana liczba linijek - u mnie 10. Logi dodaje się przez metodę **AddLog**(treść), a edytor przyjmuje podstawowe tagi html jak "b", "i" oraz \t i \n dla nowej linii.
Cały kod zobaczycie na GitHubie, a fragment o którym mówię, zobaczycie poniżej.

```c# 

    public void AddLog(string log)
    {
        ClearFirstLine();

        _stringLog.AppendLine(log);
         GameLog.text = _stringLog.ToString();
    }
```c# 




## Zaznaczony Przeciwnik


W poprzedniej części nauczyliśmy się, jak zaznaczać przeciwnika i przełączać się pomiędzy nimi, dlatego też, aby to rozszerzyć, stworzyłem panel do wyświetlania danych wybranego wroga.
Obecnie wyświetlane jest jego imię, lvl oraz coś, co poruszę w następnym punkcie, do którego potrzebny jest…

```c# 

private void SelectedEnemyPanel()
    {
        if (EnemyUtils.SelectedEnemy==null) return;
        if (SelectedEnemyStatistic != null)
        {
            SelectedEnemyStatistic.text = string.Format("<b>Name</b>: {0} \n<b>Class Name</b>: {1}",
                EnemyUtils.SelectedEnemy.EnemyCharacter.Name,
                EnemyUtils.SelectedEnemy.ClassName);
        }
        if (SelectedEnemyDetail != null)
        {
            SelectedEnemyDetail.text = string.Format("<b>Distance:</b>{0}",
                EnemyUtils.SelectedEnemy.Distance);
        }

    }
```c# 




## Dystans


Tak, dobrze wiedzieć, jak daleko jesteśmy od przeciwnika, nie tylko, aby był to nowy wodotrysk do wyświetlania, ale także jest to przydatne do systemu walki dystansowego oraz jako informacja, czy jesteśmy na tyle blisko, aby zaatakować bezpośrednio.
Tu by się przydała trochę wiedza z uczelni oraz wzór na odległość między 2 wektorami … ale Unity dostarcza nam Vector.Distance pomiędzy graczem a wrogiem.

Dystans dodałem do klasy Enemy. Pomaga to także posortować przeciwników ze względu na dystans od gracza.

```c# 

 public  int Distance {
            get {
                if (GameManager.Instance.PlayerObject != null)
                    return (int) Vector2.Distance(GameManager.Instance.PlayerObject.transform.position,
                        transform.position);
                Debug.Log(GameManager.Instance.PlayerObject);
                return 0;
                //Matematyka jednak cos daje!
                //      return (int) Mathf.Sqrt(Mathf.Pow(Player.transform.position.x - SelectedEnemy.transform.position.x, 2) +
                //                  Mathf.Pow(Player.transform.position.y - SelectedEnemy.transform.position.y, 2));
            }
        }
```c# 


[![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-20-23.44.36-785x490.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-20-23.44.36.png) 1 wersja UI


## Podsumowanie


To tyle na temat UI. Temat będzie jeszcze poruszony przy okienku tworzenia postaci oraz dodawania szczegółów dotyczących gracza.
Kod jak zwykle można znaleźć na GitHub [https://github.com/aluspl/RogueLikeDSP](https://github.com/aluspl/RogueLikeDSP).
Chciałem dodać player, ale Unity upiera się, że klasy Enemy nie ma … mimo że jest .

Pozdrawiam!
