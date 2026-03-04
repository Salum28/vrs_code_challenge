package queries

import (
	sql "database/sql"
	http "net/http"
	dbi "rent_api/internal/database"
	hprs "rent_api/internal/helpers"
	dto "rent_api/internal/listings/dtos"
	tm "time"
)

func QueryWriteListingInDatabase(createDto *dto.CreateListingDto) error {
	conn  := dbi.DB

	query := `
		INSERT INTO listings (
			type,
			price_brl,
			image_path,
			zip_code,
			street,
			district,
			city,
			state,
			created_at,
			updated_at
		) VALUES (
			$1, $2, $3, $4, $5, $6, $7, $8, NOW(), NOW()
		)
	`

	_, err := conn.Exec(
		query,
		createDto.Type,
		createDto.PriceBrl,
		createDto.ImagePath,
		createDto.ZipCode,
		createDto.Street,
		createDto.District,
		createDto.City,
		createDto.State,
	)

	if err != nil {
		return hprs.PassErrorWithSuggestedStatus("(Q) Failed to write listing", err)
	}
	
	return nil
}

func QueryGetPaginatedListingInDatabase(hpDto hprs.PaginationModel) ([]dto.Listings, error) {
	conn := dbi.DB

	query := `
		SELECT
			l.id,
			l.type,
			l.price_brl,
			l.image_path,
			l.zip_code,
			l.street,
			l.district,
			l.city,
			l.state,
			l.created_at,
			l.updated_at
		FROM listings AS l
		ORDER BY l.created_at DESC
		LIMIT $1 OFFSET $2
	`

	rows, err := conn.Query(query, hpDto.Limit, hpDto.Offset)

	if err != nil {
		return nil, &hprs.ErrorWithSuggestedStatus{
			ErrorMsg: "(Q) Error while getting listings",
			Status: http.StatusInternalServerError,
		}
	}

	defer rows.Close()

	var deleted_at sql.NullTime
	var listings []dto.Listings

	for rows.Next() {
		var listing dto.Listings
		err := rows.Scan(
			&listing.Id,
			&listing.Type,
			&listing.PriceBrl,
			&listing.ImagePath,
			&listing.ZipCode,
			&listing.Street,
			&listing.District,
			&listing.City,
			&listing.State,
			&listing.CreatedAt,
			&listing.UpdatedAt,
		)

		if err != nil {
			return nil, &hprs.ErrorWithSuggestedStatus{
				ErrorMsg: "(Q) Couldn't scan listing",
				Status: http.StatusInternalServerError,
			}
		}

		if deleted_at.Valid {
			listing.DeletedAt = deleted_at.Time.In(tm.FixedZone("GMT-3", -3*3600))
		}

		listing.CreatedAt = listing.CreatedAt.In(tm.FixedZone("GMT-3", -3*3600))
		listing.UpdatedAt = listing.UpdatedAt.In(tm.FixedZone("GMT-3", -3*3600))

		listings = append(listings, listing)
	}

	if err = rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return []dto.Listings{}, nil 
		}
		return []dto.Listings{}, hprs.PassErrorWithSuggestedStatus("(Q) Error while iterating through listing data", err)
	}

	return listings, nil
}