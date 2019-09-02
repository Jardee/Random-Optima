***OFERTY***

USE CDN3;
SELECT
CDN.OfertyDok.OfD_Nazwa AS 'Nazwa',
CDN.OfertyDok.OfD_Opis AS 'Opis',
CDN.DefEtapy.DEt_Kod AS 'Status',
CDN.OfertyDok.OfD_StatusOpis AS 'Opis Statusu',
CDN.OfertyDok.OfD_OpeZalKod AS 'Kto Założył',
CDN.OfertyDok.OfD_OpeModKod AS 'Kto Ostatnio Modyfikował',
CDN.OfertyKnt.OfK_Kod AS 'Kontrahent',
CDN.OfertyDok.OfD_DataOd AS 'Obowiązuje Od',
CDN.OfertyDok.OfD_DataDo AS 'Obowiązuje Do',
CDN.OfertyDok.OfD_TS_Zal AS 'Data Założenia Dokumentu',
(SELECT  CDN.DokAtrybuty.DAt_WartoscTxt FROM CDN.DokAtrybuty WHERE CDN.DokAtrybuty.DAt_DeAId = 66 AND CDN.DokAtrybuty.DAt_OfdID = CDN.OfertyDok.OfD_OfDId) AS 'Atrybut OD',
(SELECT CDN.operatorzy.Ope_Kod FROM CDN.operatorzy WHERE CDN.operatorzy.Ope_OpeID = (SELECT CDN.Kontrahenci.Knt_OpiekunId FROM CDN.Kontrahenci WHERE CDN.Kontrahenci.Knt_KntId = CDN.OfertyKnt.OfK_PodID)) AS 'Opiekun Kontrahenta',
(SELECT SUM(CDN.OfertyElem.OfC_WartoscNetto) FROM CDN.OfertyElem WHERE CDN.OfertyElem.OfL_OfDId = CDN.OfertyDok.OfD_OfDId) AS 'Kwota Netto',


CDN.OfertyDok.OfD_Waluta AS 'Waluta',
--Na Procenty trzeba coś wymyślić

CDN.OfertyDok.OfD_NumerPelny AS 'numer Dokumentu',

CASE
	WHEN CDN.OfertyDok.OfD_Bufor = 0
		THEN 'Nie'
		ELSE 'Tak'
	END AS 'Czy w Buforze'

FROM CDN.OfertyDok
	LEFT JOIN CDN.OfertyKnt ON CDN.OfertyDok.OfD_OfDId = CDN.OfertyKnt.OfK_OfDId
	LEFT JOIN CDN.DefEtapy ON CDN.OfertyDok.OfD_StatusId = CDN.DefEtapy.DEt_DEtId

WHERE OfD_TS_Zal > CAST(YEAR(getdate()) AS varchar(4)) + '-01-01 00:00:00.000';

