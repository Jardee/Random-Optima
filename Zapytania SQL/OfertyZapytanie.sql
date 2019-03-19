***OFERTY***

USE CDN3;
SELECT
CDN.OfertyDok.OfD_Nazwa AS 'Nazwa',
CDN.OfertyDok.OfD_Opis AS 'Opis',
CDN.DefEtapy.DEt_Kod AS 'Status',
CDN.OfertyDok.OfD_StatusOpis AS 'Opis Statusu',
CDN.OfertyDok.OfD_OpeZalKod AS 'Kto Za³o¿y³',
CDN.OfertyDok.OfD_OpeModKod AS 'Kto Ostatnio Modyfikowa³',
CDN.OfertyKnt.OfK_Kod AS 'Kontrahent',
CDN.OfertyDok.OfD_DataOd AS 'Obowi¹zuje Od',
CDN.OfertyDok.OfD_DataDo AS 'Obowi¹zuje Do',

(SELECT SUM(CDN.OfertyElem.OfC_WartoscNetto) FROM CDN.OfertyElem WHERE CDN.OfertyElem.OfL_OfDId = CDN.OfertyDok.OfD_OfDId) AS 'Kwota Netto',


CDN.OfertyDok.OfD_Waluta AS 'Waluta',
--Na Procenty trzeba coœ wymyœliæ

CDN.OfertyDok.OfD_NumerPelny AS 'numer Dokumentu',

CASE
	WHEN CDN.OfertyDok.OfD_Bufor = 0
		THEN 'Nie'
		ELSE 'Tak'
	END AS 'Czy w Buforze'

FROM CDN.OfertyDok
	JOIN CDN.OfertyKnt ON CDN.OfertyDok.OfD_OfDId = CDN.OfertyKnt.OfK_OfDId
	JOIN CDN.DefEtapy ON CDN.OfertyDok.OfD_StatusId = CDN.DefEtapy.DEt_DEtId

WHERE OfD_TS_Zal > CAST(YEAR(getdate()) AS varchar(4)) + '-01-01 00:00:00.000';