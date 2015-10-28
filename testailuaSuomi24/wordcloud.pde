Word[] wordArray = new Word[] {
  new Word("Vittu", 100), 
  new Word("Saatana", 60),
  new Word("Helvetti", 30),
  new Word("Perkele", 20),
  new Word("Hitto", 40),
  new Word("Hemmetti", 20),
  new Word("Jumalauta", 20),
  new Word("Paska", 80)
  };
  
WordPlacer middle() {
  return new WordPlacer() {
    public PVector place(Word word, int rank, int wordCount,
                         int wordWidth, int wordHeight, 
                         int fieldWidth, int fieldHeight) {
      return new PVector(width/2-radiusOfInner/4, (height/2+35)-radiusOfInner/4);
    }
  };
}
