
*** ZLECENIA SERWISOWE ***



USE CDN3;

SELECT 
CDN.SrsZlecenia.SrZ_NumerPelny AS 'Numer Zlecenia',
CASE
	WHEN CDN.SrsZlecenia.SrZ_Bufor = 0
		THEN 'Nie'
		ELSE 'Tak'
	END AS 'Czy w Buforze',
CDN.Kontrahenci.Knt_Kod AS 'Kontrahent',
CDN.SrsZlecenia.SrZ_TS_Zal AS 'Data Założenia',
CDN.SrsZlecenia.SrZ_DataPrzyjecia AS 'Data Przyjęcia',
CDN.SrsZlecenia.SrZ_DataRealizacji AS 'Data Realizacji',
CDN.SrsZlecenia.SrZ_DataZamkniecia AS 'Data Zamknięcia',
CDN.SrsZlecenia.SrZ_EtapOpis AS 'Etap',
CDN.SrsZlecenia.SrZ_Stan AS 'Stan',
CDN.SrsZlecenia.SrZ_Opis AS 'Opis',
CDN.SrsZlecenia.SrZ_WartoscNetto AS 'Wartość Netto',
CAST(CDN.SrsZlecenia.SrZ_CzasRealizacjiCzynnosci / 60 as varchar(10))  + ' h' AS 'Czas Realizacji Czynno?ci',
CDN.SrsZlecenia.SrZ_OpeZalKod AS 'Kto Założył',
CDN.SrsZlecenia.SrZ_OpeModKod AS 'Kto Ostatnio Modyfikował',
CDN.Kategorie.Kat_KodOgolny AS 'Kod Ogólny Kategorii',
CDN.Kategorie.Kat_KodSzczegol AS 'Kod Szczegłowy Kategorii'

FROM CDN.SrsZlecenia 
	LEFT JOIN 
		CDN.Kontrahenci ON CDN.SrsZlecenia.SrZ_PodmiotId = CDN.Kontrahenci.Knt_KntId
	LEFT OUTER JOIN  
		CDN.Kategorie ON CDN.SrsZlecenia.SrZ_KatID = CDN.Kategorie.Kat_KatID
WHERE CDN.SrsZlecenia.SrZ_TS_Zal > CAST(YEAR(getdate()) AS varchar(4)) + '-01-01 00:00:00.000';
