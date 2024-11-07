enum InstructionType { h1, h2, h3, h4, h5, h6, p }

class InstructionData {
  const InstructionData(this.text, {this.type = InstructionType.p});

  final String text;
  final InstructionType type;
}

const List<InstructionData> instructions = [
  InstructionData('Ogólny zarys zadania', type: InstructionType.h2),
  InstructionData(
    'Jesteś menegenren transformersów (z jakiegoś powodu autoboty i decepticony współpracują). '
    'Twoim głównym zajęciem jest prowadzenie ewidencji napraw robotów i skutków tych napraw.\n\n'
    'Należy podłączyc aplikację do API - zależy nam na sprawnym, periodycznym synchronizowaniu danych przy minimalnym obciążeniu serwera. '
    'Pobrane już dane wykorzystujemy wszędzie tam, gdzie mogą zostac wykorzystane.',
  ),
  InstructionData('Zadania', type: InstructionType.h2),
  InstructionData(
    '1. Pobieranie listy robotów i napraw + state management',
    type: InstructionType.h6,
  ),
  InstructionData(
    '2. Dodawanie / edycja robotów + obsługa błędów',
    type: InstructionType.h6,
  ),
  InstructionData(
    '3. Usuwanie robotów przez przeciągnięcie kafelka w lewo',
    type: InstructionType.h6,
  ),
  InstructionData(
      '4. Ewaluacja isActive i brokenBeyondRepair dla robota na podstawie jego awarii',
      type: InstructionType.h6),
  InstructionData(
      '5. Lista awarii z podziałem na archiwalne (ukończone), zaległe i aktywne',
      type: InstructionType.h6),
  InstructionData(''),
  InstructionData('Mechanizm synchronizacji API', type: InstructionType.h2),
  InstructionData(
    'Listy /transformers i /repairs skonstruowane są w ten sposób, że przyjmują opcjonalny parametr query ?lastUpdate={ISODateString}.\n\n'
    'Jeżeli request zostanie wykonany bez tego parametru, wszystkie dostępne elementy znajdą się w body.data.\n\n'
    'Jeżeli parametr zostanie ustawiony, zwrócona zostanie różnica. W body.data znajdą się elementy utworzone po lastUpdate, '
    'w body.updated elementy zaktualizowane po tym znaczniku, a w deleted będzie lista id usuniętych elementów, których dotyczy endpoint po lastUpdate',
  ),
  InstructionData('Lista \'transformers\'', type: InstructionType.h2),
  InstructionData(
    'Na liście transformersów potrzebujemy informację czy jest aktywny (czy nie posiada aktywnej awarii albo awarii zakończonej niepowodzeniem)'
    'jeżeli nie jest aktywny i ostatnia awaria zakończyła się niepowodzeniem - '
    'oznacza to, że robot nie nadaje się do użytku (naprawa wykracza poza nasze możliwości)',
  ),
  InstructionData(
    'Obsluga podstawowych błędów',
    type: InstructionType.h3,
  ),
  InstructionData(
    '410 (GoneException) rekord nie istnieje\n\n'
    '[PUT] 409 (ConflictException) - obiekt pobrany o czasie T, ktoś inny zaktualizował o T+x, pobrany obiekt jest przestarzały',
  ),
  InstructionData('Błędy walidacyjne [POST, PUT]', type: InstructionType.h3),
  InstructionData(
    'Gdy zapytanie pomyślnie przejdzie walidację schemy, następuje dodatkowa '
    'walidacja w oparciu o stan danych na serwerze. W przypadku wykrycia '
    'nieprawidłowości serwer odpowie kodem 200, w body znajdzie się obiekt '
    '\'errors\', w którym kluczem będzie nazwa pola z request.body, a wartością '
    'obiekt, w którym znajdzie się kod błędu (string). Przykład\n\n'
    '{\n\t\t\terrors: {\n\t\t\t\t\t\t\t\t\tname: { code: \'not-unique\' }\n\t\t\t} \n}',
  )
];
