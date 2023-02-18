use pasticceria;
insert into Utente(email,Username,Psword,IfAdmin,Nome,Via,Cap,Citta,telefono) values
( 'sarapizza@gmail.com','sarapizza7','09876fghj',false,'Sara','Giuseppe Mazzini','80136','Napoli','123456789'),
( 'giorgioprisco@icloud.com','gprisco91','qrty487',false,'Giorgio','Via dei Cappuccini','04010','Latina','987654321'),
( 'mariorossi@gmail.com','mrossi32','1567yhg',false ,'Mario','Via 4 novembre','23010','Pedesina','333666999'),
( 'rosamaio@libero.it','rosamaio09','cgutr56',false ,'Rosa','Via dei Tribunali','80136','Napoli','222555888'),
( 'morenogrosso@icloud.com','mgrosso98','123erfvh',false ,'Moreno','Via Parigi','11100','Aosta','111444777'),
( 'elisaverde@gmail.com','elisa11','pass',false ,'Elisa','Via Teseo','93013','Mazzarino','789456123'),
( 'martinagirolamo2001@gmail.com','Martins01','Spinazzola',true ,'Martina','Via Bisciglieto ','83035','Grottaminarda','456789123'),
( 'elena.prudente@icloud.com','elena01','123elp',true ,'Elena','Via Peschiera','83051','Nusco','123964733');

insert into Tipologia(id,nome)values
(15678,'Torta'),
(09876,'Biscotti'),
(23468,'Panettone'),
(98754,'Dolci Pasquali');

insert into Dolci (Cod,Nome,Descrizione,TCottura,TConservazione,PrezzoKg,Peso,idTipologia,cover) values
(000001,'Torta al limone','INGREDIENTI: UOVA, farina di MANDORLE, zucchero a velo, BURRO, crema bianca, LATTE, fecola di patate, lievito chimico, aroma limone, sale.
COPERTURA: pasta di zucchero gialla, sciroppo di zucchero invertito. PUò CONTENERE TRACCE DI  frutta a guscio, semi di sesamo.','180°','15°',10.00,0.9,15678,"immagini/prodotti/Caprese_al_limone_2-1536x1536.png"),
(000002,'Torta Sacher','PRODOTTO DOLCIARIO DA FORNO INGREDIENTI: Farina di GRANO tenero tipo 00, BURRO, zucchero a velo, UOVA, zucchero, farina di NOCCIOLE,
CACAO in polvere, lievito chimico, amido di FRUMENTO. FARCITURA: purea di albicocche  COPERTURA: cioccolato al LATTE, aroma naturale. PUò CONTENERE TRACCE DI soia e altra frutta a guscio., semi di sesamo.  ','180°','15°',8.00,0.8,15678,"immagini/prodotti/sacher.jpg"),
(000003,'Crostata alla marmellata','INGREDIENTI: Farina di GRANO tenero tipo 00, farina di MAIS, zucchero semolato, sale fino, bacca di vaniglia, limone,
BURRO, MANDORLE, tuorlo d’UOVO pastorizzato, amido di FRUMENTO. FARCITURA: Marmellata Frutti di Bosco , zucchero, sciroppo di glucosio-fruttosio, aromi.
Può contenere tracce di soia e derivati, arachidi e derivati, semi di sesamo. ','160°','20°',10.00,0.8,15678,"immagini/prodotti/crostata.png"),
(000004,'Torta delizia','INGREDIENTI: zucchero, farina di GRANO tenero tipo 0, amido di FRUMENTO, LATTE scremato in polvere, sale, aromi, UOVA, acqua.
FARCITURA: purea di albicocche, zucchero, colorante:estratto di paprika, aromi.
COPERTURA: pasta di MANDORLE. PUò CONTENERE TRACCE DI soia e altra frutta a guscio, semi di sesamo. ','140°','10°',15.00,1.00,15678,"immagini/prodotti/TortaDelizia_q-600x600.png"),
(000005,'Biscotti all anice', 'INGREDIENTI: Farina di GRANO tenero tipo 0, zucchero, UOVA, lievito chimico, semi di anice 3%.
 PUò CONTENERE TRACCE DI latte e derivati, soia e altra frutta a guscio, semi di sesamo.',  '160','15°',8.00,0.5,09876,"immagini/prodotti/Biscotti-allanice-600x450.png"),
(000006,'Brutti ma buoni','INGREDIENTI: zucchero a velo ( zucchero, amido di mais non ogm max 3%), MANDORLE sgusciate, NOCCIOLE, albume d’UOVO omogenizzato e pastorizzato.
PUò CONTENERE TRACCE DI latte e derivati, soia e altra frutta a guscio.', '150°','15°',7.00,0.6,09876,"immagini/prodotti/Brutti-ma-buoni.jpg"),
(000007,'Panettone','INGREDIENTI: Farina di GRANO tenero tipo 0, zucchero a velo, margarina vegetale, acqua, BURRO,LATTE, aromi,sale,regolatori dell’acidità,
UOVA,GRANELLA DI NOCCIOLA. PUò CONTENRE TRACCE DI arachidi e derivati, soja e derivati, semi di sesamo.', '150°','15',10.00,1.2,23468,"immagini/prodotti/PanettoneUvetta_b-600x600.jpg"),
(000008,'Colomba di Pasqua','INGREDIENTI: Farina di GRANO tenero tipo 0, arancia candita, BURRO, zucchero, tuorlo d’UOVO,
fruttosio,lievito, sale, aromi naturali. COPERTURA: glassa di zucchero, aromi, granella di zucchero, MANDORLE. Può contenere tracce di soia, latte, frutta a guscio e semi di sesamo. ','150°','15',25.00,1.3,98754,"immagini/prodotti/colombaNEW.jpg");





insert into Ordine(idOrdine, quantita,email,dataOrdine)values
(1,2,'rosamaio@libero.it','2019-06-27'),
(2,5,'mariorossi@gmail.com','2020-12-23'),
(3,7,'sarapizza@gmail.com','2021-04-24'),
(4,1,'giorgioprisco@icloud.com','2021-05-5'),
(5,2,'morenogrosso@icloud.com','2018-12-28'),
(6,1,'elisaverde@gmail.com','2019-03-21'),
(7,2,'giorgioprisco@icloud.com','2021-02-18'),
(8,2,'elisaverde@gmail.com','2020-12-6');

insert into ordinedolci(idOrdine,codice,quantita)values
(1,000001,1),
(1,000002,1),
(2,000005,4),
(2,000003,1),
(3,000008,5),
(3,000006,2),
(4,000004,1),
(5,000002,2),
(6,000007,1),
(7,000006,2),
(8,000005,2);