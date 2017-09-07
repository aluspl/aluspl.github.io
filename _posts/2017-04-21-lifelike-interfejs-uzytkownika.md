---
layout: post
title: LifeLike - Interfejs Użytkownika
date: 2017-04-21 21:51
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
Witam w następnej części dotyczącej LifeLike. Poprzednio pisałem o zaznaczaniu postaci i dodawaniu przeciwników oraz przełączaniu się między nimi. Dzisiaj, przejdę do UI!
<h2>Manager UI w LifeLike</h2>
Jak można było zobaczyć, z UI można było spotkać się w menu głównym i w mini grze The Ball, które znajdują się pod linkiem poniżej. <a href="http://aluspl.github.io/RogueLikeDSP/Versions/light/">Link</a>
W UI Managerze zawarte są metody do kontrolowania komponentów UI, jak np. okno z logami oraz z szczegółami. UI Manager jest podpięty do <strong>GameManagera</strong>.
<h2>Ekran Logów</h2>
PIerwszym elementem dla rasowych Rogue Like i Oldschoolowych RPG jest ekran logów. Czyli pole tekstowe z logiem - ile zadaliśmy, co znaleźliśmy i ewentualnie, co, kto do nas powiedział.
Jednak ekran logów trzeba było ograniczyć do określonej liczby linijek - tzn. czyścić te pierwsze, aby cały czas nie było więcej niż wybrana liczba linijek - u mnie 10. Logi dodaje się przez metodę <strong>AddLog</strong>(treść), a edytor przyjmuje podstawowe tagi html jak "b", "i" oraz \t i \n dla nowej linii.
Cały kod zobaczycie na GitHubie, a fragment o którym mówię, zobaczycie poniżej.

[csharp]
    public void AddLog(string log)
    {
        ClearFirstLine();

        _stringLog.AppendLine(log);
         GameLog.text = _stringLog.ToString();
    }
[/csharp]

<h2>Zaznaczony Przeciwnik</h2>
W poprzedniej części nauczyliśmy się, jak zaznaczać przeciwnika i przełączać się pomiędzy nimi, dlatego też, aby to rozszerzyć, stworzyłem panel do wyświetlania danych wybranego wroga.
Obecnie wyświetlane jest jego imię, lvl oraz coś, co poruszę w następnym punkcie, do którego potrzebny jest…

[csharp]
private void SelectedEnemyPanel()
    {
        if (EnemyUtils.SelectedEnemy==null) return;
        if (SelectedEnemyStatistic != null)
        {
            SelectedEnemyStatistic.text = string.Format(&quot;&lt;b&gt;Name&lt;/b&gt;: {0} \n&lt;b&gt;Class Name&lt;/b&gt;: {1}&quot;,
                EnemyUtils.SelectedEnemy.EnemyCharacter.Name,
                EnemyUtils.SelectedEnemy.ClassName);
        }
        if (SelectedEnemyDetail != null)
        {
            SelectedEnemyDetail.text = string.Format(&quot;&lt;b&gt;Distance:&lt;/b&gt;{0}&quot;,
                EnemyUtils.SelectedEnemy.Distance);
        }

    }
[/csharp]

<h2>Dystans</h2>
Tak, dobrze wiedzieć, jak daleko jesteśmy od przeciwnika, nie tylko, aby był to nowy wodotrysk do wyświetlania, ale także jest to przydatne do systemu walki dystansowego oraz jako informacja, czy jesteśmy na tyle blisko, aby zaatakować bezpośrednio.
Tu by się przydała trochę wiedza z uczelni oraz wzór na odległość między 2 wektorami … ale Unity dostarcza nam Vector.Distance pomiędzy graczem a wrogiem.

Dystans dodałem do klasy Enemy. Pomaga to także posortować przeciwników ze względu na dystans od gracza.

[csharp]
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
[/csharp]

[caption id="attachment_1715" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-20-23.44.36.png"><img class="size-large wp-image-1715" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-20-23.44.36-785x490.png" alt="LifeLIke" width="785" height="490" /></a> 1 wersja UI[/caption]
<h2>Podsumowanie</h2>
To tyle na temat UI. Temat będzie jeszcze poruszony przy okienku tworzenia postaci oraz dodawania szczegółów dotyczących gracza.
Kod jak zwykle można znaleźć na GitHub <a href="https://github.com/aluspl/RogueLikeDSP">https://github.com/aluspl/RogueLikeDSP</a>.
Chciałem dodać player, ale Unity upiera się, że klasy Enemy nie ma … mimo że jest .

Pozdrawiam!
