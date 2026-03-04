package atomics

import (
	rps "rent_api/internal/cep/repositories"
	dto "rent_api/internal/cep/dtos"
	hprs "rent_api/internal/helpers"
)

func AtomicFetchCep(cep string) (*dto.CepResponseDTO, error) {
	adrs, err := rps.RepositoryFetchCep(cep)

	if err != nil {
		return adrs, hprs.PassErrorWithSuggestedStatus("(A) Couldn't fetch cep: ", err)
	}

	return adrs, nil
}