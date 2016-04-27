
CREATE DATABASE decodemtl_addressbook;

CREATE TABLE Account (id INT AUTO_INCREMENT PRIMARY KEY, 
    email VARCHAR(255),
    password VARCHAR(40),
    createdOn DATETIME,
    ModifiedOn DATETIME
);


CREATE TABLE AddressBook (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accountID INT,
    name VARCHAR(255),
    createdOn DATETIME,
    modifiedOn DATETIME
);

CREATE TABLE Entry (
    id INT AUTO_INCREMENT PRIMARY KEY,
    addressBookId INT,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    birthday DATETIME,
    type ENUM("phone", "address", "electronic-mail"),
    createdOn DATETIME,
    modifiedOn DATETIME
);


CREATE TABLE Address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT,
    type ENUM("home", "work", "other"),
    addressLine1 VARCHAR(255),
    addressLine2 VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(255),
    country VARCHAR(255),
    postalCode VARCHAR(255),
    createdOn DATETIME,
    modifiedOn DATETIME
);


CREATE TABLE Phone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT,
    type ENUM("home", "work", "other"),
    subtype ENUM("landline", "cellular", "fax"),
    content VARCHAR(255),
    createdOn DATETIME,
    modifiedOn DATETIME
);


CREATE TABLE ElectronicMail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT,
    type ENUM("home", "work", "other"),
    content VARCHAR(255),
    createdOn DATETIME,
    modifiedOn DATETIME
);

ALTER TABLE posts ADD FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE AddressBook ADD FOREIGN KEY (accountId)
    REFERENCES Account(id)
    ON DELETE CASCADE;


ALTER TABLE Entry ADD FOREIGN KEY (addressBookId)
    REFERENCES AddressBook(id)
    ON DELETE CASCADE;


ALTER TABLE Phone ADD FOREIGN KEY (entryId)
    REFERENCES Entry(id)
    ON DELETE CASCADE;


ALTER TABLE Address ADD FOREIGN KEY (entryId)
    REFERENCES Entry(id)
    ON DELETE CASCADE;
    
    
ALTER TABLE ElectronicMail ADD FOREIGN KEY (entryId)
    REFERENCES Entry(id)
    ON DELETE CASCADE;
    
    
    
ALTER TABLE Entry DROP COLUMN createdOn;
ALTER TABLE Entry DROP COLUMN modifiedOn;




ALTER TABLE AddressBook DROP FOREIGN KEY AddressBook_ibfk_1;
ALTER TABLE Entry DROP FOREIGN KEY Entry_ibfk_1;
ALTER TABLE Phone DROP FOREIGN KEY Phone_ibfk_1;
ALTER TABLE Address DROP FOREIGN KEY Address_ibfk_1;
ALTER TABLE ElectronicMail DROP FOREIGN KEY ElectronicMail_ibfk_1;


