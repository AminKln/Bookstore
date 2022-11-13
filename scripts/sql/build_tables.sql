--SQLITE3
BEGIN TRANSACTION;

DROP TABLE IF EXISTS "checkout_basket";
DROP TABLE IF EXISTS "order";
DROP TABLE IF EXISTS "admin_user";
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "book";
DROP TABLE IF EXISTS "publisher_phone_number";
DROP TABLE IF EXISTS "publisher";
DROP TABLE IF EXISTS "author";

CREATE TABLE "author" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "publisher" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "bank_account" INTEGER NOT NULL CHECK ("bank_account" >= 1000000000000000 AND "bank_account" <= 9999999999999999),
    PRIMARY KEY ("id")
);

CREATE TABLE "publisher_phone_number" (
    "publisher_id" INTEGER NOT NULL,
    "phone_number" INTEGER NOT NULL CHECK ("phone_number" >= 1000000000 AND "phone_number" <= 9999999999),
    FOREIGN KEY ("publisher_id") REFERENCES "publisher" (id),
    PRIMARY KEY ("publisher_id", "phone_number")
);

CREATE TABLE "book" (
    "isbn" INTEGER,
    "title" TEXT NOT NULL,
    "genre" TEXT NOT NULL CHECK ("genre" IN ('fiction', 'non-fiction', 'biography', 'poetry', 'drama', 'other')),
    "n_of_pages" INTEGER NOT NULL,
    "publish_date" DATETIME NOT NULL, --first publish date,
    "language" TEXT NOT NULL CHECK ("language" IN ('English', 'French', 'German', 'Italian', 'Spanish', 'Russian')),
    "description" TEXT,
    "price" DECIMAL(6,2) NOT NULL,
    "count" INTEGER NOT NULL,
    "author_id" INTEGER NOT NULL,
    "publisher_id" INTEGER NOT NULL,
    FOREIGN KEY ("author_id") REFERENCES "author" ("id"),
    FOREIGN KEY ("publisher_id") REFERENCES "publisher" ("id"),
    PRIMARY KEY ("isbn")
);

CREATE TABLE "user" (
    "id" INTEGER,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE "admin_user" (
    "user_id" INTEGER,
    FOREIGN KEY ("user_id") REFERENCES "user" ("id"),
    PRIMARY KEY ("user_id")
);

CREATE TABLE "order" (
    "user_id" INTEGER NOT NULL,
    "book_isbn" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "last_update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL CHECK ("status" IN ('pending', 'shipped', 'delivered', 'cancelled')),
    FOREIGN KEY ("user_id") REFERENCES "user" ("id"),
    FOREIGN KEY ("book_isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("user_id", "book_isbn")
);

CREATE TABLE "checkout_basket" (
    "user_id" INTEGER NOT NULL,
    "book_isbn" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "user" ("id"),
    FOREIGN KEY ("book_isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("user_id", "book_isbn")
);

END TRANSACTION;