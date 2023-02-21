DROP TABLE if EXISTS hits;
CREATE TABLE if NOT EXISTS public.hits (
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    app VARCHAR(50) NOT NULL,
    uri VARCHAR(200) NOT NULL,
    ip VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP without time zone NOT NULL
    );