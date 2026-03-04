DO $$ BEGIN
    CREATE TYPE listing_type AS ENUM ('SALE', 'RENT');
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE IF NOT EXISTS listings (
    id          SERIAL PRIMARY KEY,
    type        listing_type  NOT NULL,
    price_brl   NUMERIC(12,2) NOT NULL,
    image_path  VARCHAR(255),
    zip_code    VARCHAR(9),
    street      VARCHAR(255) NOT NULL,
    district   VARCHAR(255) NOT NULL,
    city        VARCHAR(255) NOT NULL,
    state       VARCHAR(2)   NOT NULL,
    created_at  TIMESTAMPTZ DEFAULT NOW(),
    updated_at  TIMESTAMPTZ DEFAULT NOW(),
    deleted_at  TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS exchange_rates (
    id          SERIAL PRIMARY KEY,
    brl         NUMERIC(10,4) NOT NULL,
    usd         NUMERIC(10,4) NOT NULL,
    created_at  TIMESTAMPTZ DEFAULT NOW()
);
