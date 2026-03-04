package services

import (
	atomic "rent_api/internal/listings/atomics"
	dto "rent_api/internal/listings/dtos"
	hprs "rent_api/internal/helpers"
)

func ServiceWriteListing(dto *dto.CreateListingDto) error {
	err := atomic.AtomicWriteListing(dto)

	if err != nil {
		return hprs.PassErrorWithSuggestedStatus("(S) Couldn't write listing: ", err)
	}

	return nil
}

func ServiceGetPaginatedListings(hpDto hprs.PaginationModel) ([]dto.Listings, error) {
	listings, err := atomic.AtomicGetPaginatedListings(hpDto)

	if err != nil {
		return listings, hprs.PassErrorWithSuggestedStatus("(S) Couldn't get paginated listings: ", err)
	}

	return listings, nil
}