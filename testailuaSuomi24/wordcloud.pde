Word[] wordArray = new Word[] {
  new Word("Hello", 100), 
  new Word("WordCram", 60)
  };
  
WordPlacer middle() {
  return new WordPlacer() {
    public PVector place(Word word, int rank, int wordCount,
                         int wordWidth, int wordHeight, 
                         int fieldWidth, int fieldHeight) {
      return new PVector(width/2-radiusOfInner/2, height/2-radiusOfInner/2);
    }
  };
}
