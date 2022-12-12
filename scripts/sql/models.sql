--SQLITE3
BEGIN TRANSACTION;

DROP TABLE IF EXISTS "cart";
DROP TABLE IF EXISTS "order_record";
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "written_by";
DROP TABLE IF EXISTS "genre";
DROP TABLE IF EXISTS "book";
DROP TABLE IF EXISTS "publisher_phone_number";
DROP TABLE IF EXISTS "publisher";
DROP TABLE IF EXISTS "author";

CREATE TABLE "author" (
    "name" TEXT NOT NULL,
    PRIMARY KEY ("name")
);

CREATE TABLE "publisher" (
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "bank_account" INTEGER NOT NULL CHECK ("bank_account" >= 1000000000000000 AND "bank_account" <= 9999999999999999), --16 digits
    PRIMARY KEY ("name")
);

CREATE TABLE "publisher_phone_number" (
    "publisher" TEXT NOT NULL,
    "phone_number" INTEGER NOT NULL CHECK ("phone_number" >= 1000000000 AND "phone_number" <= 9999999999), --10 digits
    FOREIGN KEY ("publisher") REFERENCES "publisher" ("name"),
    PRIMARY KEY ("publisher", "phone_number")
);

CREATE TABLE "book" (
    "isbn" INTEGER ,--CHECK ("isbn" >= 1000000000 AND "isbn" <= 9999999999999), -- between 10-13 digits
    "title" TEXT NOT NULL,
    "n_of_pages" INTEGER NOT NULL,
    "publication_date" DATETIME NOT NULL, --first ever publish date
    "language" TEXT NOT NULL ,--CHECK ("language" IN ('English', 'French', 'German', 'Italian', 'Spanish', 'Russian')),
    "description" TEXT,
    "price" DECIMAL(6,2) NOT NULL,
    "publisher_fees" DECIMAL(6,2) NOT NULL,
    "count" INTEGER NOT NULL,
    "publisher" TEXT NOT NULL,
    FOREIGN KEY ("publisher") REFERENCES "publisher" ("name"),
    PRIMARY KEY ("isbn")
);

CREATE TABLE "genre" (
    "isbn" INTEGER,
    "name" TEXT,
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("isbn", "name") 
);

CREATE TABLE "written_by" (
    "isbn" INTEGER,
    "author" TEXT,
    "is_primary" INTEGER NOT NULL CHECK ("is_primary" IN (0, 1)),
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn"),
    FOREIGN KEY ("author") REFERENCES "author" ("name"),
    PRIMARY KEY ("isbn", "author")
);

CREATE TABLE "user" (
    "username" TEXT,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT,
    "is_admin" INTEGER NOT NULL CHECK ("is_admin" IN (0, 1)),
    PRIMARY KEY ("username")
);

CREATE TABLE "order_record" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "isbn" INTEGER NOT NULL,
    "order_date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "count" INTEGER NOT NULL,
    "updated_on" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL CHECK ("status" IN ('pending', 'shipped', 'delivered', 'cancelled')),
    FOREIGN KEY ("username") REFERENCES "user" ("username"),
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn")
);

CREATE TABLE "cart" (
    "username" TEXT NOT NULL,
    "isbn" INTEGER NOT NULL,
    "count" INTEGER NOT NULL,
    FOREIGN KEY ("username") REFERENCES "user" ("username"),
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("username", "isbn")
);

END TRANSACTION;