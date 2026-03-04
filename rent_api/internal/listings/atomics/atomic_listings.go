package atomics

import (
	query "rent_api/internal/listings/queries"
	dto "rent_api/internal/listings/dtos"
	hprs "rent_api/internal/helpers"
)

func AtomicWriteListing(dto *dto.CreateListingDto) error {
	err := query.QueryWriteListingInDatabase(dto)

	if err != nil {
		return hprs.PassErrorWithSuggestedStatus("(A) Couldn't write listing: ", err)
	}

	return nil
}

func AtomicGetPaginatedListings(hpDto hprs.PaginationModel) ([]dto.Listings, error) {
	listings, err := query.QueryGetPaginatedListingInDatabase(hpDto)

	if err != nil {
		return listings, hprs.PassErrorWithSuggestedStatus("(A) Couldn't get paginated listings: ", err)
	}

	return listings, nil
}