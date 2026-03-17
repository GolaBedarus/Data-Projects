CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    price_gbp NUMERIC(10,2),
    stock_available INTEGER,
    rating INTEGER,
    product_page_url TEXT,
    scraped_at TIMESTAMP
);