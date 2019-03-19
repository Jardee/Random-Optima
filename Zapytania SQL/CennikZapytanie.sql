*** POBIERANIE CENNIKA ***


USE CDN3;
SELECT 
	CDN.Towary.Twr_Kod AS 'Kod',
	CDN.Towary.Twr_NumerKat AS 'Numer Katalogowy',
	CDN.Towary.Twr_Nazwa AS 'Nazwa',
	CDN.Towary.Twr_Opis AS 'Opis',
	(SELECT CDN.TwrCeny.TwC_Wartosc FROM CDN.TwrCeny WHERE CDN.TwrCeny.TwC_TwrID = CDN.Towary.Twr_TwrId AND TwC_TwCNumer = 2) AS 'Cena Zakupu',
	(SELECT CDN.TwrCeny.TwC_Wartosc FROM CDN.TwrCeny WHERE CDN.TwrCeny.TwC_TwrID = CDN.Towary.Twr_TwrId AND TwC_TwCNumer = 3) AS 'Cena Katalogowa'
FROM CDN.Towary;