CalcIvant0(ipay, ratio) {
	Ratio := RegExReplace(Ratio, ",", ".")
	Count := (Round(Ratio * ipay, 0))
	return Count
}

CalcIvant2(ipay, ratio) {
	Ratio := RegExReplace(Ratio, ",", ".")
	Count := (Round(Ratio * ipay, 2))
	return Count
}

CalcChaosRatio_use_ratio(ratio) {
	Ratio := RegExReplace(Ratio, ",", ".")
	ChaosRatio := (Round(1 / Ratio, 4))
	return ChaosRatio
}

CalcChaosRatio_not_use_ratio(ipay, iwant) {
	ChaosRatio := (Round(ipay / iwant, 4))
	return ChaosRatio
}

CalcCurrencyRatio_not_use_ratio(ipay, iwant) {
	ChaosRatio := (Round(iwant / ipay, 4))
	return ChaosRatio
}

PriceText(ivant, ipay, currency) {
	if ipay = 1
	{
		Price := "~price "
		Price .= ivant " " currency
	}
	else
	{
		Price := "~price "
		Price .= ivant "/" ipay " " currency
	}
	return Price
}

ExaltPart(oneex, partex) {
	Expartresult := (Round(oneex / 10 * partex , 0))
	;Expartresult := (Round(oneex / 10 * partex , 0))
	return Expartresult
}












