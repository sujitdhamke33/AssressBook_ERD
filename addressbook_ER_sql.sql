	-- UC1-> Createing the database AddressBook
    
CREATE DATABASE AddressBooks;
USE AddressBooks;
    
    -- UC2-> Createing the table 
    
CREATE TABLE AddressBook (
    firstName varchar(200),
    lastName varchar(200),
    address varchar(200),
    city varchar(50),
    state varchar(50),
    zip INT,
    phoneNumber varchar(50),
    email varchar(50)
    );

    -- UC3-> inserting the new contacts to the address book
    
INSERT INTO AddressBook 
(firstName, lastName, address, city, state, zip, phoneNumber, email)
VALUES 
('Rohit', 'Sharma', 'Bandra', 'Mumbai', 'Maharashtra', 421307, '9921834355', 'rohitsharma@gmail.com'),
('Hardik', 'Pandya', 'Vadodara', 'Vadodara', 'Gujarat', 521307, '7733232323', 'hardikpandya@gmail.com'),
('Virat', 'Kohli', 'Kohinoor', 'New Delhi', 'Delhi', 721307, '6833232323', 'virat@gmail.com'),
('Rohit', 'Sharma', 'Bandra', 'Mumbai', 'Maharashtra', 421307, '9833232323', 'rohitsharma@gmail.com'),
('Hardik', 'Pandya', 'Vadodara', 'Vadodara', 'Gujarat', 521307, '7733232323', 'hardikpandya@gmail.com'),
('Virat', 'Kohli', 'Kohinoor', 'New Delhi', 'Delhi', 721307, '6833232323', 'virat@gmail.com'),
('sujit', 'dhamke', 'partoli', 'mumbai', 'Maharashtra', 684307, '9803232323', 'bharat@gmail.com'),
('yogesh', 'Kohli', 'Vadodara', 'Vadodara', 'Gujarat', 991307, '8017232323', 'yogesh@gmail.com'),
('Jasprit', 'Bumrah', 'Vadodara', 'Vadodara', 'Gujarat', 711307, '9033232323', 'bumrah@gmail.com'),
('Rohit', 'Sharma', 'Bandra', 'Mumbai', 'Maharashtra', 421307, '9833232323', 'rohitsharma@gmail.com'),
('Hardik', 'Pandya', 'Vadodara', 'Vadodara', 'Gujarat', 521307, '7733232323', 'hardikpandya@gmail.com'),
('Virat', 'Kohli', 'Kohinoor', 'New Delhi', 'Delhi', 721307, '6833232323', 'virat@gmail.com'),
('sujit', 'dhamke', 'partoli', 'mumbai', 'Maharashtra', 684307, '9803232323', 'bharat@gmail.com'),
('yogesh', 'Kohli', 'Vadodara', 'Vadodara', 'Gujarat', 991307, '8017232323', 'yogesh@gmail.com'),
('Jasprit', 'Bumrah', 'Vadodara', 'Vadodara', 'Gujarat', 711307, '9033232323', 'bumrah@gmail.com');

SELECT * FROM Addressbook;

-- UC4-> Editing existing 

UPDATE Addressbook 
set phoneNumber = '9921834355'
where firstName ='Rohit';

SET SQL_SAFE_UPDATES = 0;
SELECT * FROM Addressbook;

-- UC5-> Deleting Person Name 

DELETE FROM addressbook
WHERE firstName ='Jasprit';

-- UC6-> Retriving person from their state name

SELECT * FROM Addressbook WHERE state ='Gujarat';

-- UC7-> counting the size by city and state

SELECT city, state, COUNT(*) AS total_per_city_state
FROM AddressBook
GROUP BY city, state;

-- UC8-> sorting the name alphabetically

SELECT * FROM Addressbook ORDER BY city ASC;

-- UC9-> 

ALTER TABLE Addressbook
 ADD COLUMN name varchar(200),
 ADD COLUMN type varchar(200);
 
 UPDATE Addressbook 
 SET name = 'Hardik Pandya',type = 'Friend'
 WHERE firstName = 'Hardik'; 
 
 UPDATE Addressbook 
 SET name = 'Virat Kohli',type = 'Family'
 WHERE firstName = 'Virat'; 
 
 UPDATE Addressbook 
 SET name = 'Yogesh Kohli',type = 'Friend'
 WHERE firstName = 'Yogesh';
 
  UPDATE Addressbook 
 SET name = 'Sujit Dhamke',type = 'Owner'
 WHERE firstName = 'Sujit'; 
 SELECT * FROM Addressbook;
 
 -- UC->10 count by the type
 SELECT type, count(type)
 from addressbook
 group by type;

-- UC->11 & 12

CREATE TABLE person (
    personID INT PRIMARY KEY AUTO_INCREMENT,
    personName VARCHAR(50)
);

CREATE TABLE addresstype (
    typeID INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50)
);

CREATE TABLE personDetails (
    personId INT,
    typeId INT,
    FOREIGN KEY (personId) REFERENCES person(personID),
    FOREIGN KEY (typeId) REFERENCES addresstype(typeID),
    PRIMARY KEY (personId, typeId)
);

insert into person values (6,"nancy");
select * from person;

insert into addresstype values (2,"family");
select * from addresstype;

insert into personDetails values (1,2), (2,2);

select * from person p join addresstype at on p.personID=at.typeID
join personDetails pd on at.typeID=pd.typeId;