CalcIvant(ipay, ratio) {
	Ratio := RegExReplace(Ratio, ",", ".")
	Count := (Round(Ratio * ipay, 0))
	return Count
}

CalcChaosRatio(ratio) {
	Ratio := RegExReplace(Ratio, ",", ".")
	ChaosRatio := (Round(1 / Ratio, 4))
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





;7::
;CalcIvant(9, 1.5, Alt)
;MsgBox,,, % PriceText(6, 3, "Alt")