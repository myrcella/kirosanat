
Suomi24Reader reader = new Suomi24Reader();

Integer[] totalWords = reader.getTotalGenerics();
IntList words = new IntList();

void initIntListTotal() {
  for (Integer number : totalWords) {
    words.append(number.intValue());
  }
println(totalWords);
println(words);
}

Integer[] totalCurses = reader.getTotalCurses();
IntList curses = new IntList();

void initIntListCurses() {
  for (Integer number : totalCurses) {
    curses.append(number.intValue());
  }
}

