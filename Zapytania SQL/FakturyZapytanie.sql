USE CDN;
SELECT

CDN.TraNag.TrN_Opis AS 'Opis',
CDN.TraNag.TrN_OpeZalKod AS 'Kto Założył',
CDN.TraNag.TrN_OpeModKod AS 'Kto Ostatnio Zmodyfikował',
CDN.Kontrahenci.Knt_Kod AS 'Kontrahent',
CDN.operatorzy.Ope_Kod AS 'Opiekun',
CDN.TraNag.TrN_RazemNetto AS 'Kwota Netto',
CDN.TraNag.TrN_DataWys AS 'Data Wystawienia',
CDN.TraNag.TrN_Rabat AS 'Rabat',
CDN.FormyPlatnosci.FPl_Nazwa AS 'Płatność', 
CDN.TraNag.TrN_Termin AS 'Termin',
CDN.TraNag.TrN_NumerPelny AS 'Numer Zamówienia',
CDN.TraNag.TrN_Kategoria AS 'Kategoria'

FROM CDN.TraNag		
	LEFT OUTER JOIN 
		CDN.Kontrahenci ON CDN.TraNag.TrN_PodID = CDN.Kontrahenci.Knt_KntId
	LEFT OUTER JOIN 
		CDN.operatorzy ON CDN.Kontrahenci.Knt_OpiekunId = CDN.operatorzy.Ope_OpeID
	LEFT OUTER JOIN
		CDN.FormyPlatnosci ON CDN.TraNag.TrN_FPlId = CDN.FormyPlatnosci.FPl_FPlId

WHERE TrN_NumerPelny LIKE 'FS%' + CAST(YEAR(getdate()) AS varchar(4)) AND TrN_Anulowany = 0;
