CREATE TABLE nutzer (
    id uuid PRIMARY KEY,
    username VARCHAR(50) NOT NULL unique,
    email VARCHAR(50) NOT NULL unique,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE buch
(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  /*  isbn VARCHAR(13),*/
    title VARCHAR(100),
    author VARCHAR(100),
    coverbild TEXT /*,
    tid VARCHAR(15)*/
-- Verfügbarkeit?
);


/*
ALTER TABLE buch
    ADD CONSTRAINT fk_buch_nutzer
        FOREIGN KEY (nutzer_id)
            REFERENCES nutzer (id);

*/

ALTER TABLE buch
    ADD COLUMN user_id uuid;

ALTER TABLE buch
    ADD CONSTRAINT fk_nutzer_book
        FOREIGN KEY (user_id)
            REFERENCES nutzer(id);

CREATE TABLE book_isbns (
    book_id SERIAL REFERENCES buch(id) ON DELETE CASCADE,
    book_isbn VARCHAR(13) not null,
    PRIMARY KEY (book_id, book_isbn)
);

CREATE TABLE book_tids (
    book_id SERIAL REFERENCES buch(id) ON DELETE CASCADE,
    book_tid VARCHAR(13) not null ,
    PRIMARY KEY (book_id, book_tid)
);

/*
ALTER TABLE buch
    ADD COLUMN book_tid VARCHAR(15);

ALTER TABLE buch
    ADD CONSTRAINT fk_nutzer_book_tid
        FOREIGN KEY (book_tid)
            REFERENCES buch(id);*/