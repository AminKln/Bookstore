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

CREATE TABLE "genre" (
    "isbn" INTEGER,
    "name" TEXT,
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("isbn", "name") 
);

CREATE TABLE "user" (
    "username" TEXT,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT,
    PRIMARY KEY ("username")
);

CREATE TABLE "admin_user" (
    "username" TEXT,
    FOREIGN KEY ("username") REFERENCES "user" ("username"),
    PRIMARY KEY ("username")
);

CREATE TABLE "order" (
    "username" TEXT NOT NULL,
    "isbn" INTEGER NOT NULL,
    "order_date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantity" INTEGER NOT NULL,
    "updated_on" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL CHECK ("status" IN ('pending', 'shipped', 'delivered', 'cancelled')),
    FOREIGN KEY ("username") REFERENCES "user" ("username"),
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("username", "isbn", "order_date")
);

CREATE TABLE "checkout_basket" (
    "username" TEXT NOT NULL,
    "isbn" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY ("username") REFERENCES "user" ("username"),
    FOREIGN KEY ("isbn") REFERENCES "book" ("isbn"),
    PRIMARY KEY ("username", "isbn")
);

END TRANSACTION;