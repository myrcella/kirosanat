Word[] wordArray;

WordPlacer middle() {
  return new WordPlacer() {
    public PVector place(Word word, int rank, int wordCount,
                         int wordWidth, int wordHeight, 
                         int fieldWidth, int fieldHeight) {
      return new PVector(width/2-radiusOfInner/4, (height/2)-radiusOfInner/4);
    }
  };
}
