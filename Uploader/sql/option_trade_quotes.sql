create table if not exists thetadata_option_trade_quotes
( security      LowCardinality(String)
, expiration    DATETIME64(3, 'EST') CODEC (DoubleDelta, ZSTD(1))
, side          LowCardinality(String)
, strike        UInt32               CODEC (T64, ZSTD(1))
, time_of_trade DATETIME64(3, 'EST') CODEC (DoubleDelta, ZSTD(1))
, size          UInt32               CODEC (T64, ZSTD(1))
, condition     LowCardinality(String)
, price         Float32              CODEC (Gorilla, ZSTD(1))
, time_of_quote DATETIME64(3, 'EST') CODEC (DoubleDelta, ZSTD(1))
, bid_size      UInt32               CODEC (T64, ZSTD(1))
, bid           Float32              CODEC (Gorilla, ZSTD(1))
, bid_exchange  LowCardinality(String)
, ask_size      UInt32               CODEC (T64, ZSTD(1))
, ask           Float32              CODEC (Gorilla, ZSTD(1))
, ask_exchange  LowCardinality(String)
) engine = MergeTree
partition by toYYYYMMDD(time_of_trade)
order by (security, expiration, side, strike, time_of_trade)