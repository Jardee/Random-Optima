SELECT TrN_PodNazwa1, TrN_NumerPelny, TrN_OdbTelefon, TrN_OdbEmail, TrN_Termin, TrN_RazemNetto
FROM CDN.TraNag
WHERE CDN.TraNag.TrN_TrNID in (SELECT DISTINCT(TrE_TrNId) FROM CDN.TraElem WHERE TrE_TwrKod LIKE '%MDF-%') AND TrN_NumerPelny LIKE 'ZAM%' AND TrN_Anulowany = 0
