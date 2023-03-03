DROP TABLE if EXISTS users, categories, events, requests, compilations, compilation_event;
CREATE TABLE if NOT EXISTS public.users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE
);
CREATE TABLE if NOT EXISTS public.categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE
);
CREATE TABLE if NOT EXISTS public.events (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    annotation VARCHAR(50) NOT NULL,
    category_id BIGINT NOT NULL,
    created_on timestamp without time zone NOT NULL,
    description VARCHAR(200),
    event_date timestamp without time zone NOT NULL,
    initiator_id BIGINT NOT NULL,
    lat float NOT NULL,
    lon float NOT NULL,
    paid boolean NOT NULL,
    participant_limit BIGINT,
    published_on timestamp without time zone,
    request_moderation boolean,
    state VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL
);
CREATE TABLE if NOT EXISTS public.requests (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_id BIGINT NOT NULL,
    created timestamp without time zone NOT NULL,
    requester_id BIGINT NOT NULL,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT uq_requests UNIQUE(event_id, requester_id)
);
CREATE TABLE if NOT EXISTS public.compilations (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    pinned boolean NOT NULL
);
CREATE TABLE if NOT EXISTS public.compilation_event (
    compilation_id BIGINT NOT NULL,
    event_id BIGINT NOT NULL,
    CONSTRAINT compilation_event_pk PRIMARY KEY (compilation_id, event_id)
);