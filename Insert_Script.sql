insert into artist
values
	(1, 'Die Antwoord'),
	(2, 'Limp Bizkit'),
	(3, 'Lil Peep'),
	(4, 'Fred Again..'),
	(5, 'Nirvana');
	
insert into genre
values 
	(1, 'Rap'),
	(2, 'Rock'),
	(3, 'Electronic');
	
insert into artistgenre 
values 
	(1, 1),
	(1, 3),
	(2, 1),
	(2, 2),
	(3, 1),
	(4, 3),
	(5, 2);

insert into album 
values 
	(1, 'Ten$ion', 2012),
	(2, 'Donker Mag', 2014),
	(3, 'Threee Dollar Bill Y`all', 1997),
	(4, 'Significant Other', 1999),
	(5, 'Come Over When You`re Sober', 2018),
	(6, 'Everybody`s Everything', 2019),
	(7, 'Actual Life', 2021),
	(8, 'Ten Days', 2024),
	(9, 'Nevermind', 1991);

insert into artistalbum 
values 
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(4, 8),
	(5, 9);
	
insert into trackinfo
values 
	(1, 1, 'I Fink U Freeky', 202),
	(2, 1, 'Baby`s on Fire', 236),
	(3, 2, 'Ugly Boy', 216),
	(4, 2, 'Pitbull Terrier', 220),
	(5, 3, 'Faith', 232),
	(6, 3, 'Leech', 131),
	(7, 4, 'Nookie', 266),
	(8, 4, 'Break Stuff', 166),
	(9, 5, 'The Brightside', 216),
	(10, 5, 'Broken Smile (My All)', 280),
	(11, 6, 'witchblades', 150),
	(12, 6, 'RATCHETS', 192),
	(13, 7, 'Marea (We`ve Lost Dancing)', 242),
	(14, 7, 'Kyle (I Found You)', 196),
	(15, 8, 'adore u', 220),
	(16, 8, 'ten', 181),
	(17, 9, 'Something in the Way', 230),
	(18, 9, 'Come As You Are', 218),
	(19, 9, 'Lithium', 257);
	
insert into mixtape 
values 
	(1, 'Best 1990`s Rock Songs', 2000),
	(2, 'Best 2010`s Rap Songs', 2020),
	(3, 'African Rap', 2014),
	(4, 'UK Dance Hits', 2024);

insert into mixtapetracklist 
values 
	(1, 2),
	(1, 3),
	(2, 2),
	(2, 3),
	(3, 3),
	(3, 2),
	(4, 3),
	(5, 1),
	(7, 1),
	(8, 1),
	(9, 2),
	(11, 2),
	(13, 4),
	(14, 4),
	(15, 4),
	(18, 1);

insert into album 
values 
	(10, 'test', 9999);

insert into trackinfo
values
	(20, 10, 'myself', 1),
	(21, 10, 'by myself', 1),
	(22, 10, 'my own', 1),
	(23, 10, 'own my', 1);
