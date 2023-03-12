DROP TABLE if EXISTS users, categories, events, requests, compilations, compilation_event, comments;
CREATE TABLE if NOT EXISTS public.users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE if NOT EXISTS public.categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(128) NOT NULL UNIQUE
);
CREATE TABLE if NOT EXISTS public.events (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    annotation VARCHAR(2000) NOT NULL,
    category_id BIGINT NOT NULL,
    created_on timestamp without time zone NOT NULL,
    description VARCHAR(7000),
    event_date timestamp without time zone NOT NULL,
    initiator_id BIGINT NOT NULL,
    lat float NOT NULL,
    lon float NOT NULL,
    paid boolean NOT NULL,
    participant_limit BIGINT,
    published_on timestamp without time zone,
    request_moderation boolean,
    state VARCHAR(64) NOT NULL,
    title VARCHAR(128) NOT NULL
);
CREATE TABLE if NOT EXISTS public.requests (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_id BIGINT NOT NULL,
    created timestamp without time zone NOT NULL,
    requester_id BIGINT NOT NULL,
    status VARCHAR(32) NOT NULL,
    CONSTRAINT uq_requests UNIQUE(event_id, requester_id)
);
CREATE TABLE if NOT EXISTS public.compilations (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    pinned boolean NOT NULL
);
CREATE TABLE if NOT EXISTS public.compilation_event (
    compilation_id BIGINT NOT NULL,
    event_id BIGINT NOT NULL,
    CONSTRAINT compilation_event_pk PRIMARY KEY (compilation_id, event_id)
);
CREATE TABLE if NOT EXISTS public.comments (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    text VARCHAR(2000) NOT NULL,
    author_id BIGINT NOT NULL,
    event_id BIGINT NOT NULL,
    created_on timestamp without time zone NOT NULL
);