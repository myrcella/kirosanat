
/*Suomi24Reader reader = new Suomi24Reader();

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
}*/


int[] totalWords = new int[] {
  100, 180, 100, 80, 120, 100, 160, 170, 110, 70, 140, 140, 100, 180, 100, 80, 120, 100, 160, 170, 110, 70, 180, 140
};
IntList words = new IntList(totalWords);

int[] totalCurses = new int[] {
  10, 20, 7, 25, 5, 2, 27, 5, 25, 30, 18, 12, 10, 20, 7, 25, 5, 2, 27, 5, 25, 30, 18, 12
};
IntList curses = new IntList(totalCurses);

int[] totalEthics = new int[] {
  5, 2, 10, 3, 7, 15, 2, 25, 10, 8, 13, 7,5, 2, 10, 3, 7, 15, 2, 25, 10, 8, 13, 7
};
IntList ethics = new IntList(totalEthics);



