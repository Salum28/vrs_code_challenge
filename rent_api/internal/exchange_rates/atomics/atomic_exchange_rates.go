package atomics

import (
	query "rent_api/internal/exchange_rates/queries"
	dto "rent_api/internal/exchange_rates/dtos"
	hprs "rent_api/internal/helpers"
)

func AtomicWriteExchangeRate(dto *dto.CreateExchangeRateDto) error {
	err := query.QueryWriteExchangeRateInDatabase(dto)

	if err != nil {
		return hprs.PassErrorWithSuggestedStatus("(A) Couldn't write exchange rate: ", err)
	}

	return nil
}

func AtomicGetCurrentExchangeRate() (*dto.ExchangeRate, error) {
	exchangeRate, err := query.QueryGetCurrentExchangeRateInDatabase()

	if err != nil {
		return exchangeRate, hprs.PassErrorWithSuggestedStatus("(A) Couldn't get current exchange rate: ", err)
	}

	return exchangeRate, nil
}