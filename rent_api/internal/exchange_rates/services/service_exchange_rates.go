package services

import (
	atomic "rent_api/internal/exchange_rates/atomics"
	dto "rent_api/internal/exchange_rates/dtos"
	hprs "rent_api/internal/helpers"
)

func ServiceWriteExchangeRate(dto *dto.CreateExchangeRateDto) error {
	err := atomic.AtomicWriteExchangeRate(dto)

	if err != nil {
		return hprs.PassErrorWithSuggestedStatus("(S) Couldn't write exchange rate: ", err)
	}

	return nil
}

func ServiceGetCurrentExchangeRate() (*dto.ExchangeRate, error) {
	exchangeRate, err := atomic.AtomicGetCurrentExchangeRate()

	if err != nil {
		return exchangeRate, hprs.PassErrorWithSuggestedStatus("(S) Couldn't get current exchange rate: ", err)
	}

	return exchangeRate, nil
}