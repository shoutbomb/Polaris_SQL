SET NOCOUNT ON
SELECT REPLACE(pr.Phonevoice1,'-',''), p.Barcode
	FROM polaris.Polaris.PatronRegistration pr
		inner join Polaris.polaris.patrons p
	ON pr.PatronID = p.PatronID
	WHERE pr.DeliveryOptionID = 8
	AND pr.PhoneVoice1 IS NOT NULL
	AND p.Barcode IS NOT NULL
	AND pr.Expirationdate > DATEADD(MONTH,-3,GETDATE())
	AND LEN(pr.PhoneVoice1) > 9
	ORDER BY p.Barcode