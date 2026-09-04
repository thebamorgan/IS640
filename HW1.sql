-- Part 1
CREATE TABLE USER(
    UserID int PrimaryKey,
    UserName varchar(50) NOT NULL,
    email varchar(50) NOT NULL
)

CREATE TABLE FILE(
    FileID int PrimaryKey,
    FileName varchar(50) NOT NULL,
    FileSize varchar(50) NOT NULL,
    
)