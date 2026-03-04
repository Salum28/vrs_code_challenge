package repositories

import (
	json "encoding/json"
	fmt "fmt"
	http "net/http"
	dto "rent_api/internal/cep/dtos"
	client "rent_api/internal/cep/client"
	hprs "rent_api/internal/helpers"
)

func RepositoryFetchCep(cep string) (*dto.CepResponseDTO, error) {
	url := fmt.Sprintf(client.Env.ViaCepBaseURL, cep)

	resp, err := client.Client.Get(url)

	if err != nil {
		return nil, hprs.PassErrorWithSuggestedStatus("(R) Via Cep service unavailable: ", err)
	}

	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, &hprs.ErrorWithSuggestedStatus{
			ErrorMsg: "(R) Cep not found!",
			Status: http.StatusNotFound,
		}
	}

	var result dto.CepResponseDTO

	if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
		return nil, hprs.PassErrorWithSuggestedStatus("(R) Error while parsing viacep response: ", err)
	}

	if result.Error {
		return nil, &hprs.ErrorWithSuggestedStatus{
			ErrorMsg: "(R) Cep not found!",
			Status: http.StatusNotFound,
		}
	}

	return &result, nil
}