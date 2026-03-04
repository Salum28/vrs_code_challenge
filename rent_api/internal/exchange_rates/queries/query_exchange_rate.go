package queries

import (
	http "net/http"
	dbi "rent_api/internal/database"
	dto "rent_api/internal/exchange_rates/dtos"
	hprs "rent_api/internal/helpers"
	tm "time"
)

func QueryWriteExchangeRateInDatabase(createDto *dto.CreateExchangeRateDto) error {
	conn  := dbi.DB

	query := `
		INSERT INTO exchange_rates (
			brl,
			usd,
			created_at
		) VALUES (
			$1, $2, NOW()
		)
	`

	_, err := conn.Exec(
		query,
		createDto.Brl,
		createDto.Usd,
	)

	if err != nil {
		return hprs.PassErrorWithSuggestedStatus("(Q) Failed to write exchange rate", err)
	}
	
	return nil
}

func QueryGetCurrentExchangeRateInDatabase() (*dto.ExchangeRate, error) {
	conn := dbi.DB

	query := `
		SELECT
			er.id,
			er.brl,
			er.usd,
			er.created_at
		FROM exchange_rates AS er
		ORDER BY er.created_at DESC
		LIMIT 1
	`

	rows, err := conn.Query(query)

	if err != nil {
		return nil, &hprs.ErrorWithSuggestedStatus{
			ErrorMsg: "(Q) Error while getting last exchange rate",
			Status: http.StatusInternalServerError,
		}
	}

	defer rows.Close()

	var exchangeRate dto.ExchangeRate

	for rows.Next() {
		err := rows.Scan(
			&exchangeRate.Id,
			&exchangeRate.Brl,
			&exchangeRate.Usd,
			&exchangeRate.CreatedAt,
		)

		if err != nil {
			return nil, &hprs.ErrorWithSuggestedStatus{
				ErrorMsg: "(Q) Couldn't scan current exchange rate",
				Status: http.StatusInternalServerError,
			}
		}

		exchangeRate.CreatedAt = exchangeRate.CreatedAt.In(tm.FixedZone("GMT-3", -3*3600))
	}

	return &exchangeRate, nil
}