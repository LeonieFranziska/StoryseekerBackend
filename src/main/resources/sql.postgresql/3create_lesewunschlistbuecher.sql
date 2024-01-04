CREATE TABLE buch
(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    isbn VARCHAR(13),
    title VARCHAR(100),
    author VARCHAR(100)
);

ALTER TABLE buch
    ADD COLUMN user_id uuid;

ALTER TABLE buch
    ADD CONSTRAINT fk_nutzer_book
        FOREIGN KEY (user_id)
            REFERENCES nutzer(id);