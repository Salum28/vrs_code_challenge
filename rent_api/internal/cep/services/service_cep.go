package services

import (
	atomic "rent_api/internal/cep/atomics"
	dto "rent_api/internal/cep/dtos"
	hprs "rent_api/internal/helpers"
)

func ServiceFetchCep(rqstDto dto.CepRequestDto) (*dto.CepResponseDTO, error) {
	adrs, err := atomic.AtomicFetchCep(rqstDto.Cep)

	if err != nil {
		return adrs, hprs.PassErrorWithSuggestedStatus("(S) Couldn't fetch cep: ", err)
	}

	return adrs, nil
}