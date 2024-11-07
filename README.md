![Optimus prime](https://rozrywka.spidersweb.pl/_next/image?url=https%3A%2F%2Focs-pl.oktawave.com%2Fv1%2FAUTH_2887234e-384a-4873-8bc5-405211db13a2%2Fsplay%2F2022%2F02%2Ftransformers-rise-of-the-beasts-film-nowa-trylogia-kiedy.jpg&w=1200&q=75)

# Ogólny zarys zadania

Jesteś menegenren transformersów (z jakiegoś powodu autoboty i decepticony współpracują). Twoim głównym zajęciem jest prowadzenie ewidencji napraw robotów i skutków tych napraw. Należy podłączyc aplikację do API - zależy nam na sprawnym, periodycznym synchronizowaniu danych przy minimalnym obciążeniu serwera. Pobrane już dane wykorzystujemy wszędzie tam, gdzie mogą zostac wykorzystane.

## Resource

- [Swagger](https://rod.codefray.net/api/docs)

API baseUrl

```
https://rod.codefray.net/api/v1/
```

## Zadania

1. Pobieranie listy robotów i napraw + state management
2. Dodawanie / edycja robotów + obsługa błędów
3. Usuwanie robotów przez przeciągnięcie kafelka w lewo
4. Ewaluacja ```isActive``` i ```brokenBeyondRepair``` dla robota na podstawie jego awarii + wizualna reprezentacja
5. Lista awarii z podziałem na archiwalne (ukończone), zaległe i aktywne

* ```isActive``` - robot, który nie ma aktywnej awarii oraz ostatnia awaria NIE ZAKOŃCZYŁA się NIEPOWODZENIEM
* ```brokenBeyondRepair``` - jeżeli ```isActive === false``` i ostatnia awaria zakończyła się niepowodzeniem

---
# Dodatkowe informacje

## Mechanizm synchronizacji
Listy /transformers i /repairs skonstruowane są w ten sposób, że przyjmują opcjonalny parametr lastUpdate w formacie ISO8601.

### Przykład
```
https://rod.codefray.net/api/v1/transformers?lastUpdate=2021-01-01T00:00:00.000Z
```

### Response

```
{
  data: Transformer[] | Repair[],
  updated:Transformer[] | Repair[],
  deleted: number[]
}
```

Jeżeli request zostanie wykonany bez tego parametru, wszystkie dostępne elementy znajdą się w ```data```.
Jeżeli parametr zostanie ustawiony, zwrócona zostanie różnica. W ```data``` znajdą się elementy utworzone po lastUpdate,
w ```updated``` elementy zaktualizowane po tym znaczniku, a w ```deleted``` będzie lista id usuniętych elementów, których dotyczy endpoint po lastUpdate

## Obsługa błędów

- ```GET(id), POST, PUT, DELETE``` 410 (GoneException) - rekord nie istnieje
- ```PUT``` 409 (ConflictException) - obiekt pobrany o czasie T, ktoś inny zaktualizował o T+x, pobrany obiekt jest przestarzały

## Błędy walidacyjne ```PUT, POST```
Gdy zapytanie pomyślnie przejdze walidację schemy, następuje dodatkowe sprawdzenie poprawności
w oparciu o stan danych na serwerze. W przypadku wykrycia nieprawidłowości serwer odpowie kodem 200 - w body
znajdzie się obiekt errors, gdzie kluczem będzie nazwa pola z ```body``` którego dotyczy błąd oraz informacja o kodzie błędu

### Przykład
```typescript
{
  errors: {
    name: { code: 'not-unique' } 
  }
}
```

## Lista transformers
Na liście transformersów potrzebujemy informację czy jest aktywny (czy nie posiada aktywnej awarii albo awarii zakończonej niepowodzeniem) - ```isActive```
jeżeli nie jest aktywny i ostatnia awaria zakończyła się niepowodzeniem - oznacza to, że robot nie nadaje się do użytku (naprawa wykracza poza nasze możliwości) - ```brokenBeyondRepair```.
Obie informacje powinny zostać wizualnie zaprezentowane na kafelkach robotów