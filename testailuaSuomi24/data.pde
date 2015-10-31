
Suomi24Reader reader = new Suomi24Reader();

Integer[] totalWords = reader.getTotalWords();
IntList words = new IntList();

void initIntListTotal() {
  for (Integer number : totalWords) {
    words.append(number.intValue());
  }
}

Integer[] totalGenerics = reader.getTotalGenerics();
IntList generics = new IntList();
Map<Integer, ArrayList<Word>> genericWordCloud = reader.getGenerics(); 

void initIntListGenerics() {
  for (Integer number : totalGenerics) {
    generics.append(number.intValue());
  }
}

Integer[] totalCurses = reader.getTotalCurses();
IntList curses = new IntList();
Map<Integer, ArrayList<Word>> curseWordCloud = reader.getCurses();

void initIntListCurses() {
  for (Integer number : totalCurses) {
    curses.append(number.intValue());
  }
}

Integer[] totalEthnics = reader.getTotalEthnics();
IntList ethnics = new IntList();
Map<Integer, ArrayList<Word>> ethnicWordCloud = reader.getEthnics();

void initIntListEthnics() {
  for (Integer number : totalEthnics) {
    ethnics.append(number.intValue());
  }
}

Integer[] totalSexuals = reader.getTotalSexuals();
IntList sexuals = new IntList();
Map<Integer, ArrayList<Word>> sexualWordCloud = reader.getSexuals();

void initIntListSexuals() {
  for (Integer number : totalSexuals) {
    sexuals.append(number.intValue());
  }
}

void initData() {
  initIntListTotal();
  initIntListGenerics();
  initIntListCurses();
  initIntListSexuals();
  initIntListEthnics();
}

Word[] pickWordArray(char cat, int hour) {
  switch (cat) {
    case 's':
      return sexualWordCloud.get(hour).toArray(new Word[sexualWordCloud.get(hour).size()]);
    case 'y':
      return genericWordCloud.get(hour).toArray(new Word[genericWordCloud.get(hour).size()]);
    case 'k':
      return curseWordCloud.get(hour).toArray(new Word[curseWordCloud.get(hour).size()]);
    case 'r':
      return ethnicWordCloud.get(hour).toArray(new Word[ethnicWordCloud.get(hour).size()]);
    default:
      return new Word[0];
   }
}
