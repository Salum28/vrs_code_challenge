package dtos

type CepRequestDto struct {
	Cep string `json:"cep"`
}

type CepResponseDTO struct {
	Cep 	 string `json:"cep"`
	Street 	 string `json:"logradouro"`
	District string `json:"bairro"`
	City 	 string `json:"localidade"`
	State 	 string `json:"uf"`
	Error 	 bool 	`json:"erro"` 
}