# kirosanat

RAPORTTI & ITSEARVIOINTI

Visualisoimme työssä Suomi24-keskustelupalstan kirosanojen määrää eri kellonaikoina. Toteutimme visualisoinnin kelloympyränä, jossa kirosanojen määrää havainnollistetaan ympyrän sisään piirretyn käyrän etäisyydellä ympyrän keskipisteestä ja sanapilvellä, jossa sanojen koot määräytyvät sanojen yleisyyden mukaan. Sanapilvi muodostetaan aina valitun kellonajan mukaan ja tausta vaihtuu vuorokaudenaikaa mukaillen. Yöllä näkyy kuu ja päivällä aurinko.

Mahdollisia sanakategorioita on neljä: kirosanat, seksuaaliset haukkumasanat, rasistiset sanat ja yleiset haukkumasanat. Kategoriaa voi vaihtaa erikorkuisilla äänillä eli korkeat äänet vaihtavat kategoriaa yhteen suuntaan ja matalat toiseen. Kellonaikojen vaihto on toteutettu kameraohjauksella, jossa seurataan punaisinta pistettä. Käytännössä kellonaika vaihtuu vaakasuuntaan ohjainta liikuttamalla.

Ääniohjaus toimii viululla kohtuullisen hyvin, kunhan äänenkorkeuden erot ovat riittävät. Kameraohjaus on jossain määrin epätarkka, mutta tämän takia pieni ohjaimen heilunta ei vielä vaikuta tuntiin, vaan vasta isommat muutokset huomioidaan.

Teimme kirosanojen suhteen sen rajauksen, ettemme huomioineet kaikkia mahdollisia eri taivutusmuotoja, vaan poimimme ainoastaan perusmuodossa olevat sanat. Käyttämämme data oli json-muodossa ja huomioimme keskusteluista vain viestien sisällön, emme otsikkoa.

Alkuperäinen työnjakomme piti kohtuullisen hyvin, mutta loppuvaiheessa osallistuimme kaikki jonkin verran datan tuomiseen ruudulle, sillä tässä osuudessa oli eniten haasteita. Tämän suhteen jonkin verran ongelmia aiheutti se, ettei Processing kertonut kovin paljoa virhetilanteista, jolloin niitä oli hankala löytää, varsinkin, kun emme onnistuneet aina tuottamaan niitä uudelleen. Tästä jäi hieman epävarma olo sataprosenttisen toimivuuden suhteen.


Kia:

Vastasin ohjelman taiteellisesta suunnittelusta. Koen oppineeni työstä eniten ohjelmasuunnittelua ryhmässä ja versionhallintaa, sillä en ollut aiemmin käyttänyt gittiä, johon tallensimme kukin oman työmme. Itselläni olisi ollut hieman kunnianhimoisempia tavoitteita ulkonäön suhteen kuin mitä Processingin kankeus esimerkiksi fonttien suhteen mahdollisti. Tehtävä opettikin siis myös luovuutta tiukasti rajatussa ympäristössä. Myös auringon ja kuun saaminen kuvaan oli haastavaa ja opettavaista.

Ellinoora:

Toteutin Johannan kanssa datan piirtoa ja ääni- ja kameraohjausta. Ääniohjauksessa oli jonkin verran haasteita, mutta saimme sen toimimaan, varsinkin viululla. Sen sijaan kameraohjaus oli jo edellisestä harjoituksesta tuttua. Gitin käyttö oli itselleni täysin uutta ja varsinkin alussa hieman hämmentävää.

Opin muun muassa ääniohjauksen ansiosta uusien kirjastojen käyttöä.

Johanna:

Toteutin Ellinooran kanssa datan piirtoa ja ääni- ja kameraohjausta. Ääniohjaus oli itselleni uusi asia, joten siitä opin paljon. Ääniohjaus oli yllättävän hajottavaa toteuttaa Processingilla, mutta lopulta saimme sen toimimaan. Sen sijaan pyöreiden muotojen piirtämäinen curveVertexillä oli yllättävän helppoa. 

Muistin projektin myötä jälleen, kuinka gittiä käytetään. Git on tällaisessa projektissa todella hyödyllinen apu, jossa pääsee myös käytännössä harjoittelemaan muutostenhallintaa merge conflictien myötä.

Eeva:

Olin työsuunnitelman mukaisesti ns. backend-tiimissä eli ohjelmoin ryhmätyöstä sen osuuden, missä Suomi24:ltä saatua JSON-aineistoa käydään läpi eri kirosanojen suhteen ja tallennetaan nämä visualisointia varten. Loppuvaiheessa yritin myös toimia “oikolukijana”.
 
Yllätyin siitä, miten helppoa javalla oli käydä läpi json-tiedostoja, sillä ensin ajattelin monien sisäkkäisten kommenttien tuottavan ongelmia. Sisäkkäisyys kuitenkin onneksi hoitui yksinkertaisella rekursiolla. Suurempi haaste ryhmätyössä oli saada ulkopuoliset kirjastot lisättyä projektiin niin, että ohjelma toimii suoraan joka koneella ja tämän saikin vasta Saga luotettavasti toimimana.
 
Asenteeni processingia kohtaan muuttui positiivisemmaksi, kun huomasin, että voin käytännössä kirjoittaa tavallista javaa, sillä yhteensopivuudessa erikseen tehdyn tiedostonkäsittelijän ja itse piirto-ohjelman välillä ei ollut niin suuria ongelmia kuin pelkäsimme.

Saga:

Alkuperäisen suunnitelman mukaan itseni piti olla lähinnä backend-puolella, mutta osoittautui, että frontin toteuttaminen oli monimutkaisempaa, joten osallistuin myös sen tekemiseen ja erityisesti backendin ja frontendin väliseen integraatioon ja ohjelman testaamiseen. Toimin myös henkisenä git-tukena muille, koska käytän sitä päivittäin työssäni.

Opin arvostamaan kehitystyökaluja, joissa on hieman enemmän toimintoja kuin Processingissa, sillä esimerkiksi virheilmoitusten lähteen ja syyn selvittäminen oli huomattavasti työläämpää kuin esimerkiksi Eclipsellä.
