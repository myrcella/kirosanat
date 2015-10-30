
Suomi24Reader reader = new Suomi24Reader();

Integer[] totalWords = reader.getTotalGenerics();
IntList words = new IntList();

void initIntListTotal() {
  for (Integer number : totalWords) {
    words.append(number.intValue());
  }
}

Integer[] totalCurses = reader.getTotalCurses();
IntList curses = new IntList();

void initIntListCurses() {
  for (Integer number : totalCurses) {
    curses.append(number.intValue());
  }
}

Integer[] totalEthnics = reader.getTotalEthnics();
IntList ethnics = new IntList();

void initIntListEthnics() {
  for (Integer number : totalEthnics) {
    ethnics.append(number.intValue());
  }
}

Integer[] totalSexuals = reader.getTotalSexuals();
IntList sexuals = new IntList();

void initIntListSexuals() {
  for (Integer number : totalSexuals) {
    sexuals.append(number.intValue());
  }
}

void initData() {
  initIntListTotal();
  initIntListCurses();
  initIntListSexuals();
  initIntListEthnics();
}

