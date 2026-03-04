package helpers

type PaginationModel struct {
	Limit int `json:"limit" validate:"required"`
	Offset int `json:"offset" validate:"required"`
}
