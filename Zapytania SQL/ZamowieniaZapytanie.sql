***ZAMÓWIENIA***


USE CDN3;
SELECT

CDN.TraNag.TrN_Opis AS 'Opis',
CDN.TraNag.TrN_OpeZalKod AS 'Kto Za³o¿y³',
CDN.TraNag.TrN_OpeModKod AS 'Kto Ostatnio Zmodyfikowa³',
CDN.Kontrahenci.Knt_Kod AS 'Kontrahent',
CDN_KNF_Konfiguracjaf.cdn.Operatorzy.Ope_Kod AS 'Opiekun',
CDN.TraNag.TrN_RazemNetto AS 'Kwota Netto',
CDN.TraNag.TrN_DataWys AS 'Data Wystawienia',
CDN.TraNag.TrN_Rabat AS 'Rabat',
CDN.FormyPlatnosci.FPl_Nazwa AS 'P³atnoœæ', 
CDN.TraNag.TrN_Termin AS 'Termin',
CDN.TraNag.TrN_NumerPelny AS 'Numer Zamówienia',
isnull([cdn].[ProcentWplaconychZaliczek2] (trn_trnid),0) AS 'Procent Wpłaconych'

FROM CDN.TraNag		
	LEFT OUTER JOIN 
		CDN.Kontrahenci ON CDN.TraNag.TrN_PodID = CDN.Kontrahenci.Knt_KntId
	LEFT OUTER JOIN 
		CDN_KNF_Konfiguracjaf.cdn.Operatorzy ON Ope_OpeID = CDN.Kontrahenci.Knt_OpiekunId
	LEFT OUTER JOIN 
		CDN.FormyPlatnosci ON CDN.TraNag.TrN_FPlId = CDN.FormyPlatnosci.FPl_FPlId

WHERE TrN_NumerPelny LIKE 'ZAM%' + CAST(YEAR(getdate()) AS varchar(4));
