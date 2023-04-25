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

INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');
INSERT INTO Episodio (id, link)
VALUES (default, '');


INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Il castello errante di Howl', 'Studio Ghibli', '2005-09-09', 'Il Castello errante di Howl potrebbe inserirsi almeno in parte nel genere e l\'arte di Miyazaki stesso è un\'arte composita in cui resti del passato suo personale (l\'esperienza della guerra) e della cultura giapponese (lo shintoismo) si mescolano con la tecnologia avanzata delle sue opere di animazione.', 'https://upload.wikimedia.org/wikipedia/en/a/a0/Howls-moving-castleposter.jpg');

INSERT INTO Anime (id, nome, studio, data, descrizione, copertina)
VALUES (default, 'Kiseijū', 'Madhouse', '2014-10-08', 'Un adolescente combatte l\'attacco di parassiti provenienti dallo spazio con l\'aiuto di Migi, una docile creatura che ha preso possesso della sua mano destra.', 'https://myanimelist.net/anime/22535/Kiseijuu__Sei_no_Kakuritsu/pics');
