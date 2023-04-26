drop database if exists animetube;
CREATE DATABASE animetube;
use animetube;

CREATE TABLE Anime (
    id int primary key auto_increment,
    nome varchar(255) not null,
    studio varchar(255) not null,
    data date not null,
    descrizione varchar(2048) not null,
    copertina varchar(512) not null
);

CREATE TABLE Utente (
    id int primary key auto_increment,
    username varchar(255) not null,
    email varchar(255) not null,
    psw varchar(128) not null,
    token varchar(2048) not null
);

CREATE TABLE Recensione (
    id int primary key auto_increment,
    testo varchar(2048) not null,
    voto_c double not null,
    UtenteID int,
    FOREIGN KEY (UtenteID) REFERENCES Utente(id)
);

CREATE TABLE Lista (
    id int,
    FOREIGN KEY (id) REFERENCES Anime(id),
    UtenteID int,
    FOREIGN KEY (UtenteID) REFERENCES Utente(id)
);

CREATE TABLE Tag (
    id int primary key auto_increment,
    nome varchar(255) not null,
    UtenteID int,
    FOREIGN KEY (UtenteID) REFERENCES Utente(id)    
);

CREATE TABLE Episodio (
    id int primary key auto_increment,
    link varchar(512) not null,
    AnimeID int,
    FOREIGN KEY (AnimeID) REFERENCES Anime(id)
);

CREATE TABLE Filtro (
    id int,
    FOREIGN KEY (id) REFERENCES Anime(id),
    TagID int,
    FOREIGN KEY (TagID) REFERENCES Tag(id)
);

CREATE TABLE Carousel (
    trailer varchar(512) not null,
    img varchar(512) not null
);

-- \/\/\/\/\/ANIME\/\/\/\/\/

-- Chainsaw Man
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Chainsaw Man', 'MAPPA', '2022-10-11', 'La trama di Chainsaw Man percorre la storia di Denji, un ragazzo orfano che, in un momento estremo vicino alla morte, si fonde con il Diavolo Motosega: in questo mondo contemporaneo alternativo, le paure degli esseri umani assumano la forma di “diavoli”', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.crunchyroll.com%2Fit%2Fseries%2FGVDHX8QNW%2Fchainsaw-man&psig=AOvVaw3RLtLL8PZZNZEDZIYQHfv7&ust=1679479863351000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCKDUlpnk7P0CFQAAAAAdAAAAABAD');

INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/65714');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/65791');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/65903');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66051');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66135');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66384');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66489');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66673');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66789');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/66973');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/67216');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/3871-chainsaw-man/67415');

-- One-Punch Man
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'One-Punch Man', 'Madhouse', '2015-10-05', 'In un mondo dove esistono mostri ed eroi, Saitama, un venticinquenne diventato calvo e fortissimo a seguito di un duro allenamento, ha deciso di diventare un eroe per hobby, ma neanche ciò riesce a ravvivare la sua apatia perché nessun nemico è alla sua altezza: tutti vanno al tappeto con un pugno. Non avendo rivali, Saitama prosegue ad eliminare i mostri che incontra, sperando un giorno di trovare un degno avversario.', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fit.wikipedia.org%2Fwiki%2FOne-Punch_Man&psig=AOvVaw1FIJzszf3kksr-NZCj9e0c&ust=1679480910555000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKiWlIvo7P0CFQAAAAAdAAAAABAD');

INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45052');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45053');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45054');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45055');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45056');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45057');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45058');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45059');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45060');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45061');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45062');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2584-one-punch-man/45063');

-- One-Punch Man
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'One-Punch Man 2', 'J.C.Staff', '2019-04-09', 'Saitama viene coinvolto suo malgrado in uno scontro tra una strana creatura femminile dall\'aspetto di una zanzara umanoide, Mosquito Girl, ed un giovane cyborg di nome Genos. La creatura semi-animalesca è sul punto di annientare il suo avversario quando Saitama la sconfigge con un solo schiaffo.', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.panini.it%2Fshp_ita_it%2Fone-punch-man-2-mmaon023isbnr4-it08.html&psig=AOvVaw2KREx_zEpWwoiIQgP6zknn&ust=1679481010669000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIjZirvo7P0CFQAAAAAdAAAAABAD');

INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/55809');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45064');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45065');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45066');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45067');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45068');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45069');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45070');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45071');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45072');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45073');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45074');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/2586-one-punch-man-2/45075');

-- Fire Force
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fire Force', 'David Production', '2019-07-06', 'Al suo primo giorno nell\'ottava brigata della Fire Force, Shinra Kusakabe, un pirocineta di terza generazione in grado di produrre fiamme dai piedi, incontra i suoi nuovi compagni e si avvicina a realizzare il suo desiderio di diventare un eroe.', 'https://myanimelist.net/anime/38671/Enen_no_Shouboutai/pics');

INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/21012');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/22088');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/23343');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/23736');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/24470');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/25328');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/26124');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/27347');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/29330');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/29500');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/29971');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/31300');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/31641');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/31929');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/32179');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/32918');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/33601');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/33892');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/34377');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/34731');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/35028');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/35659');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/35791');
INSERT INTO Episodio (id, link)
VALUES (default, 'https://www.animeunity.tv/anime/1041-fire-force/35793');

-- Fire Force 2
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fire Force 2', 'David Production', '2020-12-12', 'Arthur Boyle, autoprofessatosi "Re dei cavalieri", si unisce all\'ottava brigata e immediatamente nasce della tensione tra lui e Shinra. Con i giochi delle reclute in arrivo, il tenente Hinawa vuole vedere di cosa sono capaci i due nuovi arrivati.', 'https://myanimelist.net/anime/40956/Enen_no_Shouboutai__Ni_no_Shou/pics');

INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Il castello errante di Howl', 'Studio Ghibli', '2005-09-09', 'Il Castello errante di Howl potrebbe inserirsi almeno in parte nel genere e l\'arte di Miyazaki stesso è un\'arte composita in cui resti del passato suo personale (l\'esperienza della guerra) e della cultura giapponese (lo shintoismo) si mescolano con la tecnologia avanzata delle sue opere di animazione.', 'https://upload.wikimedia.org/wikipedia/en/a/a0/Howls-moving-castleposter.jpg');

INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Kiseijū', 'Madhouse', '2014-10-08', 'Un adolescente combatte l\'attacco di parassiti provenienti dallo spazio con l\'aiuto di Migi, una docile creatura che ha preso possesso della sua mano destra.', 'https://myanimelist.net/anime/22535/Kiseijuu__Sei_no_Kakuritsu/pics');

INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Ao no Orchestra', 'Nippon Animation', '2023-0-1', 'Hajime Aono era un violinista prodigio finché non ha smesso di suonare il violino per motivi personali. Ora frequenta il terzo anno delle medie e fatica a decidere quale percorso accademico intraprendere. Un giorno, incontra a scuola Ritsuko Akine, una violinista alle prime armi dalla testa calda che vuole iscriversi a una scuola superiore che abbia un\'orchestra di rilievo. Hajime poco a poco si avvicina a Ritsuko e, riportato nel mondo dei violinisti, realizza che il tempo ha ripreso a muoversi per lui.', 'https://www.animelove.tv/assets/img/AoNoOrchestra.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2349-Ao-no-Orchestra/1/', (SELECT id FROM Anime WHERE nome = 'Ao no Orchestra'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2349-Ao-no-Orchestra/2/', (SELECT id FROM Anime WHERE nome = 'Ao no Orchestra'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Akiba\'s Trip The Animation', 'Gonzo', '2017-0-1', 'Akihabara è il quartiere della dissolutezza, dove chiunque può essere se stesso alla luce del sole, mettendo a nudo il proprio corpo o il proprio spirito. Akiba offre di tutto: anime, videogames, maid, idol, oggetti usati, cibo a buon mercato, risse e appuntamenti con ragazze. Ad Akiba tutto è possibile. Questo è il quartiere di Akiba!? Progetto anime celebrativo dei 25 anni dello studio Gonzo, è ambientato per le strade del celebre quartiere di Akihabara a Tokyo, invaso dai vampiri. I protagonisti dovranno eliminare i vampiri? svestendoli, in modo da esporli alla luce solare.', 'https://www.animelove.tv/assets/img/AkibasTripTheAnimation.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/1/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/2/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/3/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/4/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/5/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/6/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/7/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/8/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/9/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/10/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/11/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2288-Akiba\'s-Trip-The-Animation/12/', (SELECT id FROM Anime WHERE nome = 'Akiba\'s Trip The Animation'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Alice Academy (ITA)', 'Group TAC', '2004-0-1', 'La protagonista è una ragazzina come tante altre, ma la sua esperienza scolastica decolla con l\'arrivo di un\'altra studentessa. Nonostante si dimostri superiore a lei in tutto e che in ogni situazione in cui nasce rivalità lei abbia la peggio, fra le due nasce una grande amicizia. Questo piccolo idillio non dura a lungo visto che come arrivata da un giorno all\'altro se ne va, ma la protagonista non si dà per vinta e decide di partire per andarla a trovare, scappando di casa e dirigendosi a Tokyo. Scopre che è all\'interno di una scuola di Alice, ovvero di ragazzi dotati di particolari talenti. Le viene negato l\'ingresso per incontrarla, tuttavia uno degli insegnanti nota in lei un talento particolare e le offre la possibilità di affrontare il test d\'ingresso. Ma non essendo un genio e non possedendo poteri soprannaturali, quale mai sarà questo talento???', 'https://www.animelove.tv/assets/img/AliceAcademyITA.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/1/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/2/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/3/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/4/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/5/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/6/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/7/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/8/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/9/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/10/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/11/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/12/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/13/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/14/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/15/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/16/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/17/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/18/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/19/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/20/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/21/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/22/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/23/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/24/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/25/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2260-Alice-Academy-(ITA)/26/', (SELECT id FROM Anime WHERE nome = 'Alice Academy (ITA)'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Ai Yori Aoshi', 'J.C.Staff', '2002-0-1', 'Kaoru è il successore della potente famiglia degli Hanabishi. In realtà i suoi parenti hanno dovuto accettarlo in quanto tale solo a causa dell\'assenza di altri possibili eredi: il ragazzo, infatti, è il frutto di una relazione "sconveniente" per il casato. Per questo motivo deve sopportare le angherie dei suoi familiari fino a che, ormai stanco per il perdurare di questa situazione, decide di rinunciare al suo ruolo e di andarsene via di casa. Kaoru, però, Però era già stato promesso in sposo ad Aoi, la discendente di un\'altra potente famiglia; e quest\'ultima non ha nessuna intenzione di rinunciare all\'uomo a cui aveva deciso di dedicare la sua vita.', 'https://www.animelove.tv/assets/img/AiYoriAoshi.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/1/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/2/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/3/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/4/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/5/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/6/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/7/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/8/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/9/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/10/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/11/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/12/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/13/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/14/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/15/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/16/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/17/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/18/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/19/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/20/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/21/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/22/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/23/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2257-Ai-Yori-Aoshi/24/', (SELECT id FROM Anime WHERE nome = 'Ai Yori Aoshi'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Abenobashi - Il quartiere commerciale di magia', 'Gainax, Madhouse', '2002-0-1', 'Sasshi e Arumi sono due bambini che, dopo uno spaventoso incidente, si ritrovano in un universo parallelo rappresentante realtà alternative del quartiere dove sono cresciuti e in cui tuttora abitano: Abenobashi, a Osaka (Giappone). Nel tentativo di fare ritorno a casa vivranno numerose avventure il cui scopo sarà, almeno inizialmente, cercare il piccolo demone che, tramite un rito magico, è in grado di riportarli a casa. Ma il funzionamento di questa magia è strettamente legato alla volontà dei due ragazzi: solo se volessero tornare realmente a casa potrebbero farlo. Sasshi, contrariamente ad Arumi, vuole continuare a divertirsi nei mondi paralleli di Abenobashi e per questo ritarderà continuamente il ritorno ad Osaka. La serie procede in questo modo fino agli ultimi episodi in cui finalmente si scopre perché Sasshi non voglia fare ritorno a casa, un motivo serio e drammatico dato da una scelta altruista a dispetto di quanto un bambino della sua età potrebbe far credere. Ciò che differenzia Abenobashi dalla maggior parte degli altri anime di stampo comico-demenziale è proprio l’alternarsi di episodi divertenti con alcuni molto più cupi e seri, incentrati su tematiche come la morte e crescita dell’individuo.', 'https://www.animelove.tv/assets/img/Abenobashi.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/1/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/2/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/3/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/4/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/5/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/6/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/7/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/8/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/9/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/10/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/11/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/12/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2255-Abenobashi---Il-quartiere-commerciale-di-magia/13/', (SELECT id FROM Anime WHERE nome = 'Abenobashi - Il quartiere commerciale di magia'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Ayashi no Ceres (ITA)', 'Pierrot', '2000-0-1', 'Protagonisti delle vicende sono due gemelli, Aya e Aki Mikage. Hanno vissuto una vita normalissima e si apprestano a festeggiare il loro sedicesimo compleanno, ignari che la festa con i propri familiari si trasformarà in un incubo. Vengono sottoposti ad una curiosa prova, per vedere se in loro è incarnato uno spirito carico di rancore che porterà sciagure nell’intera famiglia. Il corpo di Aki si riempie di ferite, mentre Aya mostra di avere terribili poteri. In procinto di essere eliminata riesce a salvarsi grazie all’aiuto di un misterioso ragazzo. I due fratelli sono la reincarnazione di un pescatore e della Dea Ceres. Quest’ultima un giorno venne derubata del suo velo e costretta a rimanere sulle Terra, dove sposò proprio il pescatore che glielo rubò, dando origine alla famiglia Mikage. Ancor oggi il suo spirito è carico del rancore per l’ingiustizia subita. Proprio per questo Aya deve essere eliminata, porterebbe sciagure sui Mikage e potrebbe persino essere la causa della fine della potente casata.', 'https://www.animelove.tv/assets/img/AyashiNoCeresITA.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/1/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/2/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/3/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/4/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/5/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/6/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/7/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/8/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/9/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/10/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/11/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/12/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/13/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/14/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/15/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/16/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/17/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/18/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/19/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/20/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/21/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/22/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/23/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2251-Ayashi-no-Ceres-(ITA)/24/', (SELECT id FROM Anime WHERE nome = 'Ayashi no Ceres (ITA)'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Attacker You!', 'Knack Productions', '1984-0-1', 'La trama si concentra su Mila Hazuki, una ragazza che dopo un\'infanzia passata con i nonni, che si trasferisce a Tokyo da suo padre Toshiko, un fotografo ritornato in Giappone dopo molti anni all\'estero,per frequentare la scuola media. Qui scopre tante cose del suo passato (legate in special modo alla madre) e di sé stessa. Mila si innamorerà della pallavolo e diventerà in breve tempo una campionessa, attirando sempre più fan, tra cui il suo fratellino adottivo Sunny; inoltre la protagonista si innamorerà anche del coach della squadra maschile di pallavolo, Shiro Tachiki.', 'https://www.animelove.tv/assets/img/MilaeShiro.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/1/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/2/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/3/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/4/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/5/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/6/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/7/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/8/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/9/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/10/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/11/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/12/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/13/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/14/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/15/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/16/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/17/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/18/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/19/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/20/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/21/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/22/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/23/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/24/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/25/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/26/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/27/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/28/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/29/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/30/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/31/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/32/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/33/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/34/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/35/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/36/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/37/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/38/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/39/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/40/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/41/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/42/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/43/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/44/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/45/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/46/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/47/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/48/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/49/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/50/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/51/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/52/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/53/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/54/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/55/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/56/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/57/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2195-Attacker-You!/58/', (SELECT id FROM Anime WHERE nome = 'Attacker You!'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Area 88', 'Pierrot', '1985-0-1', 'A seguito dell\'inganno perpetrato da quello che credeva essere il suo miglior amico, Shin Kazama viene mandato all\'Area 88, una base di piloti da caccia composta da mercenari, situato ad Asran, un paese mediorientale in cui regna la guerra civile. L\'unico desiderio di Shin è quello di abbandonare l\'Area 88, ma gli unici modi per farcela sono due: prestare un servizio di 3 anni in prima linea o pagare una penale di 1,5 milioni di dollari. Per poter guadagnare questi soldi Shin è quindi costretto ad accettare missioni di guerra e diventare suo malgrado un assassino a pagamento, conducendo assieme ai commilitoni rischiose missioni contro le forze aeree e terrestri ribelli a bordo di caccia.', 'https://www.animelove.tv/assets/img/Area88.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/1/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/2/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/3/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/4/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/5/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/6/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/7/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/8/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/9/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/10/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/11/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2178-Area-88/12/', (SELECT id FROM Anime WHERE nome = 'Area 88'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Aoi Umi no Tristia', 'ufotable', '2004-0-1', 'La famosa inventrice Nanoka Flanca, impegnata nella costruzione di nuove diavolerie, è invitata a gareggiare in un torneo di Golem. Peccato che il suo Golem da combattimento, Tenzan, non sia molto portato per le faccende domestiche....', 'https://www.animelove.tv/assets/img/AoiUminoTristia.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2177-Aoi-Umi-no-Tristia/1/', (SELECT id FROM Anime WHERE nome = 'Aoi Umi no Tristia'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2177-Aoi-Umi-no-Tristia/2/', (SELECT id FROM Anime WHERE nome = 'Aoi Umi no Tristia'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Aru Tabibito no Nikki', 'None found, add some', '2003-0-1', 'Tortov Roddle è un uomo di poche parole in un viaggio attraverso una nuova terra calma e oscura, interagendo con i suoi abitanti lungo la strada. Mentre cavalca il suo maiale dalle lunghe gambe attraverso il deserto di città in città, osserva le usanze interessanti e bizzarre della gente del posto e ricorda il suo passato di lui.', 'https://www.animelove.tv/assets/img/AruTabibitonoNikki.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/1/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/2/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/3/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/4/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/5/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/6/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2171-Aru-Tabibito-no-Nikki/7/', (SELECT id FROM Anime WHERE nome = 'Aru Tabibito no Nikki'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Air Master', 'Toei Animation', '2003-0-1', 'Una ex-ginnasta, Aikawa Maki, ha deciso di sfruttare le sue abilità in un ambito completamente diverso, quello del combattimento da strada. L\'unica cosa che la fa sentire davvero viva è la violenza.', 'https://www.animelove.tv/assets/img/AirMaster.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/1/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/2/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/3/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/4/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/5/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/6/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/7/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/8/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/9/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/10/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/11/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/12/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/13/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/14/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/15/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/16/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/17/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/18/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/19/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/20/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/21/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/22/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/23/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/24/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/25/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/26/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2170-Air-Master/27/', (SELECT id FROM Anime WHERE nome = 'Air Master'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Astro Boy: Tetsuwan Atom', 'Tezuka Productions', '2003-0-1', 'Questo anime è stato creato per celebrare la nascita di Astroboy che nel manga originale nacque proprio nel 2003! Non ricordo molto bene Astroboy, ma da quel poco che ancora vagamente popola la mia testa mi pare fosse decisamente diverso da questa serie TV. Come potete vedere dalle immagini i disegnatori hanno mantenuto lo stile di Tezuka, pur ammodernandolo. Analizzando questo primo episodio bisogna ammettere che è fatto davvero molto bene: le animazioni sono molto fluide ed onnipresenti (da tanto non mi capitava di vedere in una serie TV tante cose in movimento contemporaneamente sullo schermo) e tutto sembra stato studiato con attenzione. Una cura decisamente sopra la media è stata posta anche nei dettagli, come nel disegno dei vari robot che si incontrano in giro per la città, nello studio delle espressioni dei personaggi e nei paesaggi. Per quanto riguarda il resto prima di tutto sembra esserci una trama che ci accompagnerà per tutta o buona parte della serie con tanto di cattivone misterioso che ama agire nell’ombra. Il target sembra essere leggermente più elevato e le tematiche orientate ai gusti attuali. Come ho comunque avvertito all’inizio non ricordo bene la vecchia serie TV, per cui queste mie ultime considerazioni sono da prendere con le pinze ;-) Nel primo episodio viene mostrata la nascita di Atom e come questo inizi a scoprire i suoi poteri. Se in USA se lo potranno godere già dal mese di Gennaio, qui da noi penso dovrà passare un po’ di tempo prima che approdi in TV, anche se sono certo che prima o poi lo vedremo.', 'https://www.animelove.tv/assets/img/AstroBoyTetsuwanAtom(2003).jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/1/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/2/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/3/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/4/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/5/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/6/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/7/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/8/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/9/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/10/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/11/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/12/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/13/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/14/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/15/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/16/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/17/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/18/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/19/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/20/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/21/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/22/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/23/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/24/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/25/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/26/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/27/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/28/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/29/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/30/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/31/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/32/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/33/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/34/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/35/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/36/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/37/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/38/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/39/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/40/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/41/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/42/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/43/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/44/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/45/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/46/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/47/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/48/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/49/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2168-Astro-Boy:-Tetsuwan-Atom/50/', (SELECT id FROM Anime WHERE nome = 'Astro Boy: Tetsuwan Atom'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Boku ga Aishita Subete no Kimi e', 'Bakken Record', '2022-0-1', 'Basato sull\'omonimo romanzo di fantascienza di Yomoji Otono. Koyomi Takasaki è un ragazzo che vive con sua madre dopo il divorzio dei suoi genitori. Nella sua nuova scuola di preparazione al college tenta di fare amicizia con gli altri, ma la sua timidezza e la pesante competizione studentesca gli impediscono di socializzare. Un giorno, la sua compagna di classe Kazune Takigawa gli si avvicina e gli dice che in realtà viene dalla World Line 85, dove lei e Koyomi sono amanti...', 'https://www.animelove.tv/assets/img/BokuGaAishitaSubeteNoKimiE.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2354-Boku-ga-Aishita-Subete-no-Kimi-e/1/', (SELECT id FROM Anime WHERE nome = 'Boku ga Aishita Subete no Kimi e'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Birdie Wing: Golf Girls Story Season 2', 'Bandai Namco Pictures', '2023-0-1', 'Seguito di "Birdie Wing: Golf Girls\' Story", Seconda stagione.', 'https://www.animelove.tv/assets/img/BirdieWingGolfGirlsStory2.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2345-Birdie-Wing:-Golf-Girls-Story-Season-2/1/', (SELECT id FROM Anime WHERE nome = 'Birdie Wing: Golf Girls Story Season 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2345-Birdie-Wing:-Golf-Girls-Story-Season-2/2/', (SELECT id FROM Anime WHERE nome = 'Birdie Wing: Golf Girls Story Season 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2345-Birdie-Wing:-Golf-Girls-Story-Season-2/3/', (SELECT id FROM Anime WHERE nome = 'Birdie Wing: Golf Girls Story Season 2'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Boku no Kokoro no Yabai Yatsu', 'Shin-Ei Animation', '2023-0-1', 'La storia ruota attorno a Kyotarou Ichikawa, un ragazzo che appartiene alla "casta" più bassa della sua scuola e che crede di essere il tormentato protagonista di un thriller psicologico. Le sue giornate trascorrono escogitando modi per sconvolgere le pacifiche vite dei compagni o struggendosi per Anna Yamada ritenuta l\'idolo della classe. Peccato che Kyotarou non sia l\'adolescente problematico per la quale vuole farsi passare ed Anna è più strana di quello che si crede...', 'https://www.animelove.tv/assets/img/BokuNoKokoroNoYabaiYatsu.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2323-Boku-no-Kokoro-no-Yabai-Yatsu/1/', (SELECT id FROM Anime WHERE nome = 'Boku no Kokoro no Yabai Yatsu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2323-Boku-no-Kokoro-no-Yabai-Yatsu/2/', (SELECT id FROM Anime WHERE nome = 'Boku no Kokoro no Yabai Yatsu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2323-Boku-no-Kokoro-no-Yabai-Yatsu/3/', (SELECT id FROM Anime WHERE nome = 'Boku no Kokoro no Yabai Yatsu'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Buzzer Beater', 'TMS Entertainment', '2005-0-1', 'Il sogno del vecchio miliardario Yoshimune è riunire i più forti giocatori di basket della Terra, per creare una squadra degna di far parte della Lega Intergalattica. Alle selezioni partecipano centinaia di migliaia di giocatori, e solo i più forti otterranno un ingaggio da cento milioni di dollari! Tra i candidati c\'è Hideyoshi, un simpatico quattordicenne dai capelli azzurri, interessato forse più ai soldi che alla sete di gloria. Buzzer Beater è il secondo manga di Inoue ad incentrarsi sulla pallacanestro , a seguito della sua famosa seconda serie manga, Slam Dunk. Il nome del manga deriva dal termine utilizzato quando un canestro viene segnato nel momento in cui finisce un tempo di gioco. La storia narra di un team di pallacanestro della Terra assemblato per partecipare in una competizione intergalattica di pallacanestro.', 'https://www.animelove.tv/assets/img/BuzzerBeater.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/1/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/2/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/3/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/4/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/5/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/6/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/7/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/8/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/9/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/10/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/11/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/12/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2278-Buzzer-Beater/13/', (SELECT id FROM Anime WHERE nome = 'Buzzer Beater'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Build Divide: Code White', 'LIDENFILMS', '2022-0-1', 'Seguito di "Build Divide: Code Black", Seconda stagione.', 'https://www.animelove.tv/assets/img/BuildDivideCodeWhite.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/1/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/2/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/3/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/4/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/5/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/6/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/7/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/8/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/9/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/10/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/11/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2148-Build-Divide:-Code-White/12/', (SELECT id FROM Anime WHERE nome = 'Build Divide: Code White'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Bokutachi no Remake', 'feel.', '2021-0-1', 'Kyouya Hashiba è uno sviluppatore di videogiochi di 28 anni che in seguito al fallimento della sua compagnia è tornato a vivere nella sua città natale. Di fronte al successo degli altri suoi coetanei non può fare a meno che stendersi nel suo letto e riflettere sugli errori commessi durante la sua vita, tuttavia, una volta riaperti gli occhi si renderà conto di essere stato trasportato indietro nel tempo di dieci anni, prima ancora che iniziasse il college. Riuscirà a realizzare i propri sogni adesso che gli è stata data una seconda opportunità?', 'https://www.animelove.tv/assets/img/BokutachiNoRemake.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/1/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/2/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/3/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/4/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/5/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/6/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/7/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/8/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/9/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/10/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/11/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2133-Bokutachi-no-Remake/12/', (SELECT id FROM Anime WHERE nome = 'Bokutachi no Remake'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Bakuman', 'J.C.Staff', '2010-0-1', 'Takagi Akito, studente modello delle superiori ed abile scrittore, si accorge del gran talento come disegnatore del suo compagno di classe, Mashiro Moritaka, e gli propone di cooperare al fine di diventare un grandiosa coppia di mangaka. Mashiro è restio ad accettare, conscio della difficoltà di sfondare nello spietato mondo dei manga, nonché scoraggiato dall’esperienza negativa vissuta in passato dal suo caro zio, autore di gag manga, che si è lasciato consumare da questa professione. Ogni reticenza è destinata però a venire spazzata via con l’entrata in scena di Azuki, graziosa studentessa che coltiva segretamente il sogno di diventare una doppiatrice di anime. Mashiro, perdutamente innamorato della ragazza, ha ormai deciso: come da accordo, realizzerà assieme al suo amico un manga di successo, e la sua amata ne doppierà l’anime… solo così i due potranno sposarsi! Cominciano così le avventure di questa simpatica e promettente coppia di aspiranti mangaka affamati di successo.', 'https://www.animelove.tv/assets/img/Bakuman.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/1/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/2/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/3/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/4/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/5/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/6/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/7/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/8/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/9/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/10/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/11/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/12/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/13/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/14/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/15/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/16/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/17/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/18/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/19/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/20/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/21/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/22/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/23/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/24/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2055-Bakuman/25/', (SELECT id FROM Anime WHERE nome = 'Bakuman'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'B gata H kei', 'Hal Film Maker', '2010-0-1', 'Yamada, liceale vergine e poco esperta di ragazzi, decide di collezionare esperienze sessuali con cento partner diversi, ma, ancor prima di attuare i suoi propositi, la ragazza si innamora di un suo compagno di scuola.', 'https://www.animelove.tv/assets/img/BGataHKei.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/1/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/2/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/3/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/4/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/5/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/6/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/7/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/8/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/9/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/10/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/11/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2046-B-gata-H-kei/12/', (SELECT id FROM Anime WHERE nome = 'B gata H kei'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Baka to Test to Shoukanjuu', 'SILVER LINK.', '2010-0-1', 'In una speciale scuola dove i voti prendono forma virtuale e gli studenti possono combattere contro di loro, vige una regola spietata. Se l\'esame viene lasciato a metà o incompleto si ottiene sempre il punteggio più basso. Così una ragazza intelligente e brillante come Mizuki Himeji, rimasta malata durante gli esami, si trova di colpo catapultata nella peggior sezione (la sezione F), al livello dei peggiori elementi della scuola! Abituata alla sezione A, dove agli studenti era concesso ogni genere di confort e lusso, Mizuki si trova ora in un ambiente sudicio, un\'aula coi vetri rotti e col pavimento fatto di vecchi tatami. Per conquistare i beni di prima necessità da ora sarà guerra alla sezione A!', 'https://www.animelove.tv/assets/img/BakaToTestToShoukanjuu.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/1/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/2/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/3/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/4/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/5/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/6/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/7/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/8/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/9/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/10/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/11/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/12/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2045-Baka-to-Test-to-Shoukanjuu/13/', (SELECT id FROM Anime WHERE nome = 'Baka to Test to Shoukanjuu'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Bem Movie: Become Human', 'Production I.G', '2020-0-1', 'Si svolge 2 anni dopo l\'ultimo episodio della serie TV. La detective Sonia Summers sta seguendo Bem e gli altri. Si è riunita con Belo, che sta combattendo da solo un\'organizzazione oscura. L\'ha portata da Bem, ma Bem non ricorda nulla e vive in città come un normale impiegato... o almeno così pensava di essere.', 'https://www.animelove.tv/assets/img/BEMBecomeHumanMovie.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2009-Bem-Movie:-Become-Human/1/', (SELECT id FROM Anime WHERE nome = 'Bem Movie: Become Human'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'By the Grace of the Gods 2', 'AUTORE: N/A', '2023-0-1', 'Seconda stagione di By the Grace of the Gods', 'https://www.animelove.tv/assets/img/Kami-tachiNiHirowaretaOtoko2.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/1/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/2/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/3/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/4/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/5/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/6/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/7/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/8/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/9/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/10/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/11/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1989-By-the-Grace-of-the-Gods-2/12/', (SELECT id FROM Anime WHERE nome = 'By the Grace of the Gods 2'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Buddy Daddies', 'AUTORE: N/A', '2023-0-1', 'Kazuki Kurusu è un intermediario criminale che vive con il suo migliore amico Rei Suwa, un assassino professionista addestrato fin dall\'infanzia per essere un killer a pagamento. Kazuki è estroverso ed ama il gioco d\'azzardo e le donne, mentre Rei è di poche parole e spende la maggior parte del suo tempo giocando ai videogiochi. Un giorno i due compagni finiscono per prendersi cura di Miri Unasaka, una bambina di quattro anni figlia di un boss mafioso, che era finita accidentalmente in mezzo ad una sparatoria mentre era alla ricerca del padre.', 'https://www.animelove.tv/assets/img/BuddyDaddies.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/1/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/2/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/3/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/4/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/5/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/6/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/7/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1974-Buddy-Daddies/8/', (SELECT id FROM Anime WHERE nome = 'Buddy Daddies'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'City Hunter 3', 'Sunrise', '1989-0-1', 'Terza stagione della serie anime. Continuano le avventure del detective privato Ryo Saeba e della sua assistente Kaori Makimura, sempre pronti a risolvere i problemi delle persone in difficoltà e a combattere il crimine. Come sempre Ryo si dimostra un grande professionista, ma continua ad avere quello che rimane il suo unico tallone d\'Achille: le belle donne.', 'https://www.animelove.tv/assets/img/CityHunter3.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/1/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/2/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/3/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/4/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/5/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/6/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/7/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/8/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/9/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/10/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/11/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/12/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2298-City-Hunter-3/13/', (SELECT id FROM Anime WHERE nome = 'City Hunter 3'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Capeta', 'Studio Comet', '2005-0-1', 'Kappeita Taira, conosciuto da tutti come "Capeta", è un ragazzino di 10 anni che ha un solo parente in vita, il padre Shigeo; cerca di essere utile svolgendo i lavori di casa ed evitando di recare preoccupazioni al proprio genitore. Pian piano scopre la sua passione per i go-kart e quando il padre riesce a costruirgliene uno e a farlo correre in pista per la prima volta la sua avventura, che lo porterà nel giro di pochi anni al sogno della Formula 1, ha inizio: accompagnato dagli amici di infanzia, Nobu Ando e Monami Suzuki, Capeta crescerà e maturerà nel corso della saga (dai 10 ai 14, e infine 16 anni) nutrendo la speranza di passare di categoria e di poter competere col suo grande rivale Naomi Minamoto, obiettivo che persegue con non poche difficoltà principalmente economiche, dato l\'umile lavoro del padre.', 'https://www.animelove.tv/assets/img/Capeta.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/1/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/2/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/3/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/4/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/5/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/6/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/7/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/8/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/9/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/10/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/11/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/12/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/13/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/14/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/15/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/16/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/17/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/18/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/19/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/20/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/21/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/22/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/23/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/24/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/25/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/26/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/27/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/28/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/29/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/30/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/31/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/32/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/33/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/34/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/35/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/36/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/37/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/38/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/39/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/40/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/41/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/42/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/43/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/44/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/45/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/46/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/47/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/48/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/49/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/50/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/51/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2283-Capeta/52/', (SELECT id FROM Anime WHERE nome = 'Capeta'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Canvas 2: Nijiiro no Sketch', 'Zexcs', '2005-0-1', 'Hiroki Kamikura è il responsabile del club artistico dell\'Accademia Nadeshiko e mira a divenire un docente d\'arte in futuro. Inoltre, Hiroki svolge anche il compito di tutore della cugina, Elis Housen. La ragazza, iniziata al mondo artistico dallo stesso Hiroki, frequenterà con non poche vicissitudini il club artistico, cercando, oltretutto, di far riscoprire a suo cugino la gioia del dipingere, che ormai lui sembra aver dimenticato... Complice il loro passato, Hiroki ed Elis troveranno non poche difficoltà nel comprendersi a vicenda e, come se ciò non bastasse, Hiroki reincontrerà una sua vecchia conoscenza, ovvero la nuova insegnante di Educazione Fisica, Kikyo Kiri..', 'https://www.animelove.tv/assets/img/Canvas2.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/1/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/2/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/3/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/4/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/5/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/6/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/7/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/8/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/9/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/10/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/11/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/12/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/13/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/14/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/15/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/16/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/17/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/18/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/19/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/20/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/21/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/22/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/23/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2282-Canvas-2:-Nijiiro-no-Sketch/24/', (SELECT id FROM Anime WHERE nome = 'Canvas 2: Nijiiro no Sketch'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Citrus', 'Passione', '2018-0-1', 'Yuzu, una liceale gyaru che non si è mai innamorata, si trasferisce in una scuola femminile dopo le seconde nozze della madre. Già arrabbiata per non poter trovare un fidanzato nella sua nuova scuola, incontra nel peggior modo possibile la splendida e bruna Mei, presidente del consiglio studentesco. Per di più, in seguito scopre anche che Mei è la sua nuova sorellastra e che vivranno sotto lo stesso tetto! Così inizia la storia d\'amore tra due ragazze completamente diverse tra loro che scoprono di essere attratte l\'un l\'altra!', 'https://www.animelove.tv/assets/img/Citrus.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/1/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/2/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/3/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/4/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/5/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/6/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/7/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/8/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/9/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/10/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/11/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2273-Citrus/12/', (SELECT id FROM Anime WHERE nome = 'Citrus'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Chuukan Kanriroku Tonegawa', 'Madhouse', '2018-0-1', 'Spin-off di Tobaku mokushiroku Kaiji, incentrato sulle vicende di Yukio Tonegawa, braccio destro di Kazutaka Hyodo.', 'https://www.animelove.tv/assets/img/ChuukanKanrirokuTonegawa.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/1/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/2/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/3/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/4/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/5/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/6/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/7/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/8/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/9/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/10/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/11/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/12/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/13/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/14/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/15/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/16/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/17/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/18/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/19/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/20/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/21/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/22/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/23/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2245-Chuukan-Kanriroku-Tonegawa/24/', (SELECT id FROM Anime WHERE nome = 'Chuukan Kanriroku Tonegawa'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'City Hunter: Bay City Wars (ITA)', 'Sunrise', '1990-0-1', 'Kaori Makimura e Miki partecipano a un ricevimento nel lussuoso Bay City Hotel, ma si trovano improvvisamente ostaggi del dittatore di un piccolo paese del Centro America e di sua figlia Luna che, con un gruppo di soldati, assumono il controllo dell\'albergo con l\'obiettivo di usare l\'avanzato sistema informatico ivi collocato per hackerare i computer del Pentagono. Lo scopo è quello di scatenare un\'apocalisse nucleare negli Stati Uniti. Toccherà a Ryo Saeba e al suo amico Falcon cercare di sventare questo attentato terroristico.', 'https://www.animelove.tv/assets/img/CityHunterMovie.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2238-City-Hunter:-Bay-City-Wars-(ITA)/1/', (SELECT id FROM Anime WHERE nome = 'City Hunter: Bay City Wars (ITA)'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Capitan Futuro', 'Toei Animation', '1978-0-1', 'La serie narra le avventure di Curtis Newton, detto Capitan Futuro, che viaggia con la sua astronave e difende le popolazioni oppresse con l’aiuto del suo equipaggio. Il protagonista ha perso i genitori quando era un bambino. Suo padre, uno scienziato, aveva abbandonato la Terra per andare a vivere su un satellite artificiale dove si era dedicato alla ricerca scientifica insieme ad un suo amico, il geniale Simon Wright. I due hanno costruito Greg, un robot antropomorfo, e Otto, un androide. Quando il Dottor Wright si è sentito prossimo alla morte ha deciso di impiantare il proprio cervello in contenitore meccanico.', 'https://www.animelove.tv/assets/img/CapitanFuturo.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/1/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/2/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/3/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/4/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/5/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/6/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/7/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/8/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/9/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/10/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/11/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/12/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/13/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/14/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/15/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/16/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/17/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/18/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/19/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/20/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/21/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/22/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/23/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/24/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/25/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/26/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/27/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/28/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/29/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/30/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/31/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/32/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/33/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/34/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/35/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/36/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/37/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/38/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/39/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/40/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/41/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/42/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/43/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/44/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/45/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/46/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/47/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/48/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/49/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/50/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/51/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2190-Capitan-Futuro/52/', (SELECT id FROM Anime WHERE nome = 'Capitan Futuro'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Cyborg 009', 'Toei Animation', '1966-0-1', 'Durante una corsa automobilistica il pilota Joe Shimamura ha un grave incidente causato dall\'organizzazione dei Black Ghost. Essendo dotato di abilità particolari intendono trasformarlo in un cyborg. Proprio mentre sta per entrare nelle fila dei Black Ghost succede qualcosa di imprevisto...', 'https://www.animelove.tv/assets/img/Cyborg009.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2183-Cyborg-009/1/', (SELECT id FROM Anime WHERE nome = 'Cyborg 009'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Cue!', 'Yumeta Company, Graphinica', '2022-0-1', 'Con la nascita di una nuova agenzia dedicata al reclutamento di aspiranti doppiatrici, sedici ragazze verranno improvvisamente gettate in pasto ad uno studio di doppiaggio, per effettuare un\'audizione che potrà rivelarsi determinante per la loro tanto agognata carriera. Anche in caso di successo, però, le giovani ragazze dovranno continuare ad impegnarsi al massimo nei ruoli che gli verranno assegnati, al fine di assicurarsi dei nuovi ingaggi.', 'https://www.animelove.tv/assets/img/Cue.jpeg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/1/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/2/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/3/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/4/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/5/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/6/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/7/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/8/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/9/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/10/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/11/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/12/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/13/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/14/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/15/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/16/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/17/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/18/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/19/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/20/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/21/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/22/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/23/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2157-Cue!/24/', (SELECT id FROM Anime WHERE nome = 'Cue!'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Code Geass: Fukkatsu no Lelouch', 'Sunrise', '2019-0-1', 'Dalla scomparsa dell\'uomo ritenuto l\'imperatore più malvagio della Britannia un anno fa, il mondo ha goduto di una pace senza precedenti sotto la guida della Federazione delle Nazioni Unite. Tuttavia, questa fragile calma viene infranta quando militanti armati rapiscono con successo l\'ex principessa Nunnally vi Britannia e Suzaku Kururugi, il principale consigliere dei Cavalieri Neri, scatenando una crisi internazionale. Il potente e inaffidabile Regno di Zilkhstan è accusato di aver orchestrato la loro cattura. Per indagare, le autorità mondiali inviano Kallen Stadtfeld e i suoi soci in un\'operazione segreta nel paese. Lì incontrano la strega immortale C.C., che è in missione per completare la resurrezione dell\'uomo responsabile della più grande rivoluzione della storia, una leggenda che risorgerà, prenderà il comando e salverà il mondo dal pericolo ancora una volta.', 'https://www.animelove.tv/assets/img/CodeGeassFukkatsunoLelouch.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2072-Code-Geass:-Fukkatsu-no-Lelouch/1/', (SELECT id FROM Anime WHERE nome = 'Code Geass: Fukkatsu no Lelouch'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Cardcaptor Sakura', 'Madhouse', '1998-0-1', 'Sakura Kinomoto è una studentessa del quarto anno alla scuola elementare privata Tomoeda. Un giorno, aprendo per caso un volume della biblioteca paterna, provoca accidentalmente lo scioglimento del sigillo delle Clow Cards, carte magiche create dal potente stregone anglo-cinese Clow Reed. All\'apertura del tomo, da esso fuoriesce la Bestia del Sigillo (Kero-chan/Cerberus), custode del sigillo stesso, il quale si premura di spiegare a Sakura quanto avvenuto alle carte, sparpagliatesi nei dintorni sotto altra forma allo scopo di far danni o semplicemente confusione in ragione delle loro caratteristiche di personalità. Sakura riceve da Kero-chan la Chiave del Sigillo, trasformabile in un bastone/scettro pronunciando l\'appropriata formula magica. Comincia così la missione di Sakura, volta a rintracciare le carte disperse e a riportarle al loro vero aspetto. Qualora il compito non venisse svolto, una non meglio precisata catastrofe si abbatterebbe su questo mondo.', 'https://www.animelove.tv/assets/img/CardCaptorSakura.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/1/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/2/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/3/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/4/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/5/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/6/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/7/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/8/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/9/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/10/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/11/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/12/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/13/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/14/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/15/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/16/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/17/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/18/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/19/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/20/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/21/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/22/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/23/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/24/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/25/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/26/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/27/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/28/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/29/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/30/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/31/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/32/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/33/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/34/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/35/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/36/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/37/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/38/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/39/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/40/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/41/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/42/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/43/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/44/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/45/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/46/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/47/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/48/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/49/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/50/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/51/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/52/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/53/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/54/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/55/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/56/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/57/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/58/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/59/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/60/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/61/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/62/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/63/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/64/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/65/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/66/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/67/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/68/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/69/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2043-Cardcaptor-Sakura/70/', (SELECT id FROM Anime WHERE nome = 'Cardcaptor Sakura'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Dead Mount Death Play', 'Geek Toys', '2023-0-1', 'Un necromante chiamato "Corpse God" combatte contro la chiesa che cerca di soggiogarlo. Quando usa la sua ultima goccia di energia viene sconfitto, ma fa in tempo ad attivare una magia di reincarnazione. Improvvisamente viene trasportato nel mondo moderno nel corpo di un ragazzo di nome Polka Shinoyama. Cosa gli succederà adesso?', 'https://www.animelove.tv/assets/img/DeadMountDeathPlay.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2338-Dead-Mount-Death-Play/1/', (SELECT id FROM Anime WHERE nome = 'Dead Mount Death Play'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2338-Dead-Mount-Death-Play/2/', (SELECT id FROM Anime WHERE nome = 'Dead Mount Death Play'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2338-Dead-Mount-Death-Play/3/', (SELECT id FROM Anime WHERE nome = 'Dead Mount Death Play'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Dr. Stone: New World', 'TMS Entertainment', '2023-0-1', 'Seguito di "Dr. Stone: Ryuusui", Terza stagione. Trovato il petrolio necessario a creare il primo combustibile fossile dello Stone World, Senkuu e il Regno della Scienza possono finalmente procedere con la costruzione della nave che permetterà loro di lasciare il Giappone alla ricerca di indizi sul mistero della pietrificazione. Che l’era dell’esplorazione abbia inizio!', 'https://www.animelove.tv/assets/img/DrStone3newworld.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2325-Dr.-Stone:-New-World/1/', (SELECT id FROM Anime WHERE nome = 'Dr. Stone: New World'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2325-Dr.-Stone:-New-World/2/', (SELECT id FROM Anime WHERE nome = 'Dr. Stone: New World'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2325-Dr.-Stone:-New-World/3/', (SELECT id FROM Anime WHERE nome = 'Dr. Stone: New World'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Deadman Wonderland: Akai Knife Tsukai', 'Manglobe', '2011-0-1', 'Questo OVA è uscito in allegato al XI volume dell\'omonimo manga nell\'agosto del 2011. Si tratta di una prequel side story, incentrata su Kiyomasa Senji/Crow che, prima di diventare un prigioniero del Deadman Wonderland, era un poliziotto.', 'https://www.animelove.tv/assets/img/DeadmanWonderlandova.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2275-Deadman-Wonderland:-Akai-Knife-Tsukai/1/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland: Akai Knife Tsukai'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Deadman Wonderland', 'Manglobe', '2011-0-1', 'Tokyo - Dieci anni dopo un terribile terremoto. Lo studente Igarashi Ganta trascorre le proprie, tranquille, giornate alla scuola media con i suoi compagni. Ma un giorno, con il manifestarsi dell’”Uomo Rosso”, il destino di Ganta muta per sempre. Nonostante la sua innocenza, sul ragazzo pesa una sentenza di morte, e viene rinchiuso nella prigione nota come “Dead Man Wonderland”. Ganta trascorre giornate spaventose in carcere, motivato alla vita solo dal bisogno di vendetta che nutre verso l’uomo rosso. E’ qui che incontra l’amica d’infanzia Shiro. In breve tempo, resosi conto dei poteri sovrannaturali di cui si trova in possesso, Ganta sarà coinvolto in battaglie all’ultimo sangue per la sopravvivenza... che ne sarà di lui? L\'isolotto nella baia di Tokyo era anche conosciuto come la “Zona di Ripristino Zero” della capitale. L’unico collegamento con la terraferma è un tunnel sottomarino. Nient’altro, né ponti né traffico navale. Mi chiedo chi sia stato a progettarlo in quel modo, e soprattutto per quale motivo. Fino ad oggi il Governo e tutti coloro che erano vagamente coinvolti nell’esistenza della Zona di Ripristino Zero avevano risposto con il silenzio assoluto alle domande dei cittadini e dei media sui possessori dell’isola. Ma oggi la ragione di quel “no comment” generale verrà svelata a tutti quanti...', 'https://www.animelove.tv/assets/img/DeadmanWonderland.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/1/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/2/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/3/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/4/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/5/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/6/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/7/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/8/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/9/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/10/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/11/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2274-Deadman-Wonderland/12/', (SELECT id FROM Anime WHERE nome = 'Deadman Wonderland'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Death Parade', 'Madhouse', '2015-0-1', 'Vi do il benvenuto al Queen Dekim. Qui due insospettabili ospiti in uno strano bar, Queen Dekim, vengono accolti da un barista dai capelli bianchi, Dekim. Da qui in poi inizierete una battaglia in cui la vostra vita è appesa a un filo, dice Dekim per presentare il Gioco Mortale. Dopo poco tempo la vera natura degli ospiti viene rilevata. E come se niente fosse, alla fine del gioco Dekim rivela di essere il giudice. Il giudizio di Dekim sui due ospiti è', 'https://www.animelove.tv/assets/img/DeathParade.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/1/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/2/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/3/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/4/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/5/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/6/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/7/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/8/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/9/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/10/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/11/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2216-Death-Parade/12/', (SELECT id FROM Anime WHERE nome = 'Death Parade'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Death Parade (ITA)', 'Madhouse', '2015-0-1', 'Vi do il benvenuto al Queen Dekim. Qui due insospettabili ospiti in uno strano bar, Queen Dekim, vengono accolti da un barista dai capelli bianchi, Dekim. Da qui in poi inizierete una battaglia in cui la vostra vita è appesa a un filo, dice Dekim per presentare il Gioco Mortale. Dopo poco tempo la vera natura degli ospiti viene rilevata. E come se niente fosse, alla fine del gioco Dekim rivela di essere il giudice. Il giudizio di Dekim sui due ospiti è', 'https://www.animelove.tv/assets/img/DeathParadeITA.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/1/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/2/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/3/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/4/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/5/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/6/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/7/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/8/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/9/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/10/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/11/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2215-Death-Parade-(ITA)/12/', (SELECT id FROM Anime WHERE nome = 'Death Parade (ITA)'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Dororo to Hyakkimaru', 'Mushi Production', '1969-0-1', 'Hyakkimaru è un giovane uomo a cui mancano 48 parti del corpo, queste sono state prese dai demoni prima della sua nascita, come pagamento per aver esaudito il desidero di suo padre, Kagemitsu Daigo, di regnare sull’intero Giappone. Il giorno della sua nascita, a causa delle sue mutilazioni, Hyakkimaru fu abbandonato e gettato in un fiume. Oramai però si è fatto uomo e ha ottenuto delle parti del corpo artificiali, così da poter eliminare i 48 demoni e recuperare le sue parti mancanti. Viene accompagnato nella sua lunga difficile impresa da un giovane ladro, Dororo, con il quale stringerà un indissolubile amicizia!', 'https://www.animelove.tv/assets/img/Dororo1969.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/1/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/2/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/3/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/4/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/5/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/6/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/7/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/8/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/9/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/10/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/11/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/12/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/13/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/14/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/15/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/16/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/17/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/18/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/19/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/20/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/21/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/22/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/23/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/24/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/25/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2185-Dororo-to-Hyakkimaru/26/', (SELECT id FROM Anime WHERE nome = 'Dororo to Hyakkimaru'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Darwin\'s Game', 'Nexus', '2020-0-1', 'Sudo Kaname viene invitato a giocare con una misteriosa app per cellulari chiamata "Darwin\'s Game". Ben presto si accorgerà di non poter lasciare il gioco e che è in ballo la sua vita...', 'https://www.animelove.tv/assets/img/darwins-game.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/1/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/2/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/3/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/4/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/5/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/6/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/7/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/8/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/9/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/10/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2117-Darwin\'s-Game/11/', (SELECT id FROM Anime WHERE nome = 'Darwin\'s Game'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.', 'Zero-G', '2019-0-1', 'Lo scrittore di gialli Subaru Mikazuki non è bravo a relazionarsi con le persone, le considera solo un disturbo quando si tratta di pensare a una nuova storia da scrivere. Un giorno, dopo aver incontrato per caso un gatto randagio, gli viene l’ispirazione e così decide di portarselo a casa, per renderlo la sua musa. Osservare gli imperscrutabili comportamenti di un gatto gli fornirà materiale utile per il suo nuovo romanzo?', 'https://www.animelove.tv/assets/img/DoukyoninWaHizaTokidokiAtamaNoUe.png');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./1/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./2/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./3/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./4/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./5/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./6/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./7/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./8/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./9/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./10/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./11/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2105-Doukyonin-wa-Hiza,-Tokidoki,-Atama-no-Ue./12/', (SELECT id FROM Anime WHERE nome = 'Doukyonin wa Hiza, Tokidoki, Atama no Ue.'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Double Decker! Doug & Kirill', 'Sunrise', '2018-0-1', 'Città-stato di Risvaletta, mentre la popolazione conduce una apparentemente tranquilla esistenza, all’ombra dei due soli, il crimine e il traffico di droga prosperano. La nuova piaga si chiama “Anthem”, una nuova pericolosissima droga, che sta provocando un escalation di morti. La speciale unità investigativa “Seven-O”, incaricata di indagare sull’ Anthem, istituisce una pratica denominata “Double Decker System”, per la quale le squadre di ispettori devono lavorare in coppia. Doug Billingham un veterano scontroso ed enigmatico, dalla grande fama, viene affiancato a Kirill Vrubel, un novellino, impaziente di gettarsi nella mischia. Seguiremo la storia di questo mal assortito duo di ispettori.', 'https://www.animelove.tv/assets/img/DoubleDecker.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/1/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/2/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/3/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/4/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/5/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/6/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/7/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/8/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/9/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/10/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/11/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2030-Double-Decker!-Doug-&-Kirill/12/', (SELECT id FROM Anime WHERE nome = 'Double Decker! Doug & Kirill'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'D4DJ All Mix', 'AUTORE: N/A', '2023-0-1', 'Seconda stagione di D4DJ: First Mix', 'https://www.animelove.tv/assets/img/D4DJAllMix.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/1/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/2/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/3/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/4/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/5/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/6/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/7/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/8/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/9/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/10/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/11/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1987-D4DJ-All-Mix/12/', (SELECT id FROM Anime WHERE nome = 'D4DJ All Mix'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'DanMachi 4 Part 2', 'AUTORE: N/A', '2023-0-1', 'Secondo cour di DanMachi 4', 'https://www.animelove.tv/assets/img/DanMachi-IV-Part-2-300x450.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/1/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/2/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/3/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/4/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/5/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/6/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/7/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/8/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/9/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/10/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1966-DanMachi-4-Part-2/11/', (SELECT id FROM Anime WHERE nome = 'DanMachi 4 Part 2'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Edomae Elf', 'C2C', '2023-0-1', 'Koganei Koito è una ragazza di 16 anni la quale svolge la funzione di miko del Santuario Takamimi. In realtà, la divinità del santuario è un elfo hikikomori evocato dal suo mondo 400 anni prima e viene viziato dai suoi adoratori con offerte come videogiochi.', 'https://www.animelove.tv/assets/img/EdomaeElf.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2342-Edomae-Elf/1/', (SELECT id FROM Anime WHERE nome = 'Edomae Elf'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2342-Edomae-Elf/2/', (SELECT id FROM Anime WHERE nome = 'Edomae Elf'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2342-Edomae-Elf/3/', (SELECT id FROM Anime WHERE nome = 'Edomae Elf'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Edens Zero 2nd Season', 'J.C.Staff', '2023-0-1', 'Seguito di "Edens Zero", Seconda stagione.', 'https://www.animelove.tv/assets/img/EdensZero2.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2317-Edens-Zero-2nd-Season/1/', (SELECT id FROM Anime WHERE nome = 'Edens Zero 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2317-Edens-Zero-2nd-Season/2/', (SELECT id FROM Anime WHERE nome = 'Edens Zero 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2317-Edens-Zero-2nd-Season/3/', (SELECT id FROM Anime WHERE nome = 'Edens Zero 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2317-Edens-Zero-2nd-Season/4/', (SELECT id FROM Anime WHERE nome = 'Edens Zero 2nd Season'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Estab-Life: Great Escape', 'Polygon Pictures', '2022-0-1', 'In un lontano futuro la popolazione mondiale ha iniziato a ridursi dopo aver raggiunto il suo picco. Tokyo ora è divisa in vari cluster, separati tra loro da imponenti mura, dove vivono popolazioni geneticamente modificate, governate da intelligenze artificiali. La maggior parte delle persone vive nel suo quartiere incuranti su cosa succede al di fuori di esso. Tuttavia, ci sono alcuni che cercano di fuggire negli altri cluster, aiutati da una misteriosa squadra.', 'https://www.animelove.tv/assets/img/Estab-LifeGreatEscape.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/1/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/2/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/3/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/4/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/5/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/6/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/7/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/8/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/9/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/10/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/11/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2147-Estab-Life:-Great-Escape/12/', (SELECT id FROM Anime WHERE nome = 'Estab-Life: Great Escape'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Extreme Hearts', 'Seven Arcs', '2022-0-1', 'La storia è ambientata in un futuro non troppo lontano. Gli Hyper Sport, che usano attrezzi estremi come oggetti di supporto, sono diventati delle competizioni molto popolari come hobby tra adulti e bambini. Hiwa Hayama, una cantante delle superiori, non ha nulla a che fare con gli Hyper Sport, finché un giorno un certo incidente non cambierà le cose.
"Questa è la storia di come abbiamo incontrato i nostri migliori amici."', 'https://www.animelove.tv/assets/img/ExtremeHearts.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/1/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/2/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/3/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/4/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/5/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/6/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/7/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/8/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/9/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/10/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/11/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2126-Extreme-Hearts/12/', (SELECT id FROM Anime WHERE nome = 'Extreme Hearts'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Engage Kiss', 'A-1 Pictures', '2022-0-1', 'L’anime è ambientato a Bayron City, una città insulare artificiale nell’Oceano Pacifico fondata, al di fuori della giurisdizione di qualsiasi paese. L\'estrazione di una nuova risorsa energetica chiamata “Orgonium” sta attirando le attenzione del mondo e provocando numerosi incidenti detti “Calamità D”, attacchi provocati da demoni. Sono nate così alcune società militari private (PMC) che hanno il compito di affrontare questi incidenti. Il protagonista Shuu gestisce una piccola PMC, anche se il suo scarso senso degli affari lo hanno lasciato costantemente al verde. Una ragazza demone, Kisara, lavora nell’ufficio di Shuu ed è costantemente preoccupata per lui. A completare il trio dei protagonisti principali c’è Ayano, ex ragazza di Shuu, un\'agente d’élite e vecchia collega del ragazzo in una importante PMC per cui Shuu ha lavorato in passato.', 'https://www.animelove.tv/assets/img/EngageKiss.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/1/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/2/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/3/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/4/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/5/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/6/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/7/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/8/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/9/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/10/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/11/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/12/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2125-Engage-Kiss/13/', (SELECT id FROM Anime WHERE nome = 'Engage Kiss'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Eden', 'Qubic Pictures, CGCG Studio', '2021-0-1', 'Migliaia di anni nel futuro la città di Eden 3 è popolata solo da robot, i loro padroni sono svaniti molto tempo addietro. Un giorno durante un lavoro di routine, due robot-contadini risvegliano accidentalmente una bambina umana da un sonno profondo indotto. Questo incontro mette in discussione ogni loro convincimento e tutto ciò che gli era stato insegnato, ovvero che gli umani non sono mai esistiti e la loro intera permanenza sulla terra solo un antico mito tabù. I due crescono la bimba in segreto, lontano dalla città.', 'https://www.animelove.tv/assets/img/Eden.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2119-Eden/1/', (SELECT id FROM Anime WHERE nome = 'Eden'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2119-Eden/2/', (SELECT id FROM Anime WHERE nome = 'Eden'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2119-Eden/3/', (SELECT id FROM Anime WHERE nome = 'Eden'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2119-Eden/4/', (SELECT id FROM Anime WHERE nome = 'Eden'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'FLCL', 'Gainax, Production I.G', '2000-0-1', 'Naota, il protagonista, è un ragazzo timido e introverso. Quando il fratello ha lasciato il Giappone per seguire il suo sogno di giocatore di baseball, la sua ragazza, Mamimi, si è affezionata molto a Naota. La coprotagonista, Haruto, è una ribelle, un personaggio che crea uno squarcio nella noiosa normalità della città .', 'https://www.animelove.tv/assets/img/FLCL.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2246-FLCL/1/', (SELECT id FROM Anime WHERE nome = 'FLCL'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2246-FLCL/2/', (SELECT id FROM Anime WHERE nome = 'FLCL'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2246-FLCL/3/', (SELECT id FROM Anime WHERE nome = 'FLCL'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2246-FLCL/4/', (SELECT id FROM Anime WHERE nome = 'FLCL'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2246-FLCL/5/', (SELECT id FROM Anime WHERE nome = 'FLCL'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2246-FLCL/6/', (SELECT id FROM Anime WHERE nome = 'FLCL'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Final Approach', 'Trinet Entertainment, Zexcs', '2004-0-1', 'Cosa fareste se una tanto avvenente quanto manesca ragazza vi piombasse in casa dichiarando che un piano governativo per incrementare il tasso di natalità vi obbliga a sposarla? È questo il tema di Final Approach, commedia di 13 episodi di durata ridotta rispetto ai canonici episodi 15 min circa. Protagonista della vicenda è Mizuhara Ryou, un 17enne, che, in seguito alla prematura scomparsa dei genitori, si trova costretto a prendersi cura della sorellina Akane di 2 anni + giovane di lui (per la quale prova sentimenti quasi + paterni che fraterni). La sua vita verrà però sconvolta dall\'arrivo imprevisto di Masuda Shizuka, misteriosa 15enne incaricata dal governo di sposare Ryou con ogni mezzo. Che fare? "Soccombere" al destino o continuare a cercare altrove l\'anima gemella?', 'https://www.animelove.tv/assets/img/FinalApproach.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/1/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/2/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/3/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/4/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/5/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/6/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/7/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/8/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/9/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/10/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/11/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/12/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2173-Final-Approach/13/', (SELECT id FROM Anime WHERE nome = 'Final Approach'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fukigen na Mononokean Tsuzuki', 'Pierrot Plus', '2019-0-1', 'Seconda stagione di “Fukigen na Mononokean“. Ashiya ha passato i primi 7 giorni della sua vita scolastica alle superiori in infermeria per colpa di uno yokai che gli si è attaccato addosso. Disperato finisce col chiedere aiuto al proprietario di una piccola sala da tè chiamata “Mononokean”. Seguiremo una serie di storie misteriose, che coinvolgono lo scontroso proprietario del Mononokean, egli guida gli yokai, che vagano in questo modo, verso l’altro mondo.', 'https://www.animelove.tv/assets/img/FukigenNaMononokean2.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/1/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/2/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/3/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/4/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/5/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/6/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/7/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/8/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/9/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/10/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/11/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/12/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2114-Fukigen-na-Mononokean-Tsuzuki/13/', (SELECT id FROM Anime WHERE nome = 'Fukigen na Mononokean Tsuzuki'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fumetsu no Anata e 2nd Season', 'Drive', '2022-0-1', 'Seguito di "Fumetsu no Anata e", Seconda stagione.', 'https://www.animelove.tv/assets/img/FumetsuNoAnataE2.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/1/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/2/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/3/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/4/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/5/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/6/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/7/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/8/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/9/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/10/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/11/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/12/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/13/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/14/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/15/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/16/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/17/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/18/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/19/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2111-Fumetsu-no-Anata-e-2nd-Season/20/', (SELECT id FROM Anime WHERE nome = 'Fumetsu no Anata e 2nd Season'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fight League: Gear Gadget Generators', 'Sunrise, Bandai Namco Pictures, XFLAG', '2019-0-1', 'Fight League… la battaglia definitiva a cui tutti i combattenti ambiscono. Una ragazza chiamata G-Wrench, che brandisce senza sforzo una enorme chiave inglese, prova a guidare la sua squadra, i Boltechs, mentre cerca di raggiungere il suo sogno. Ma un incontro inaspettato con una misteriosa ragazza, apparsa nel bel mezzo di uno scontro, cambierà il destino di G-Wrench, dei Boltechs e di tutta la GGG.', 'https://www.animelove.tv/assets/img/FightLeague.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/1/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/2/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/3/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/4/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/5/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/6/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/7/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/8/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/9/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/10/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/11/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/12/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/13/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/14/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/15/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/16/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/17/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/18/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/19/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/20/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/21/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/22/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/23/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/24/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/25/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2091-Fight-League:-Gear-Gadget-Generators/26/', (SELECT id FROM Anime WHERE nome = 'Fight League: Gear Gadget Generators'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fate Kaleid Liner Prisma Illya: Prisma Phantasm', 'SILVER LINK.', '2019-0-1', 'Parodia della serie Prisma Illya. Sono rivisti in chiave ironica alcuni eventi e sono presentati alcuni personaggi che non compaiono nella serie Majokko originale con tante battute ed allusioni sessuali di ogni tipo.', 'https://www.animelove.tv/assets/img/FatePrismaIlyaPrismaPhantasm.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2085-Fate-Kaleid-Liner-Prisma-Illya:-Prisma-Phantasm/1/', (SELECT id FROM Anime WHERE nome = 'Fate Kaleid Liner Prisma Illya: Prisma Phantasm'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fate Grand Order: Himuro no Tenchi 7 nin no Saikyou Ijin hen', 'ufotable', '2017-0-1', 'Basato sul manga comico “Himuro no Tenchi Fate/school life”. Segue le vicende di Kaede Makidera, Kane Himuro, e Yukika Saegusa, tre studentesse che però non hanno nulla a che vedere con gli sforzi per ripristinare lo Human Order.', 'https://www.animelove.tv/assets/img/FateGrandOrderspecialsubita.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2063-Fate-Grand-Order:-Himuro-no-Tenchi-7-nin-no-Saikyou-Ijin-hen/1/', (SELECT id FROM Anime WHERE nome = 'Fate Grand Order: Himuro no Tenchi 7 nin no Saikyou Ijin hen'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fortune Arterial: Akai Yakusoku', 'feel., Zexcs', '2010-0-1', 'La storia ruota intorno alla figura del protagonista Kohei Hasekura, trasferitosi da poco in una prestigiosa scuola pubblica strutturata sul modello inglese. La scuola, chiamata Shuchikan Academy, è situata sull’isola di Tamatsu, a largo delle coste giapponesi, e può essere raggiunta solo in barca. Un’apparente normalità che tuttavia sparirà nel momento in cui Kohei scoprirà che una sua compagna di scuola, Erika Sendo, è in realtà un vampiro.', 'https://www.animelove.tv/assets/img/FortuneArterial.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/1/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/2/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/3/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/4/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/5/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/6/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/7/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/8/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/9/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/10/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/11/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/2051-Fortune-Arterial:-Akai-Yakusoku/12/', (SELECT id FROM Anime WHERE nome = 'Fortune Arterial: Akai Yakusoku'));
INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Fuuto Tantei', 'AUTORE: N/A', '2022-0-1', 'Nell\'ecologica città di Fuuto, dei misteriosi congegni con l\'aspetto di chiavette USB chiamati Gaia Memories vengono utilizzati da criminali e altri soggetti interessati ad affari loschi per trasformarsi in mostri chiamati Dopants, impossibili da fermare anche dalle forze dell\'ordine. Peggio ancora, le Gaia Memories rilasciano una tossina che fa impazzire l\'ospite, fino a metterne a repentaglio la vita. Dopo la morte del suo capo, l\'autoproclamatosi detective hard-boiled Shoutaro Hidari e il misterioso Philip investigano sui crimini commessi da questi Dopants, usando a loro volta delle Gaia Memories che, combinate alle loro cinture, permettono loro di trasformarsi in Kamen Rider Double per combattere i Dopants e mantenere Fuuto al sicuro.', 'https://www.animelove.tv/assets/img/FuutoTantei.jpg');
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/1/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/2/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/3/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/4/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/5/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/6/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/7/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/8/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/9/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/10/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/11/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));
INSERT INTO Episodio (id, link, AnimeID) VALUES (default, 'https://www.animelove.tv/anime/1852-Fuuto-Tantei/12/', (SELECT id FROM Anime WHERE nome = 'Fuuto Tantei'));

