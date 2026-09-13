-- Part 1
CREATE TABLE USER(
    UserID int PRIMARY KEY,
    UserName varchar(50) NOT NULL,
    email varchar(50) NOT NULL
)

CREATE TABLE FILE(
    FileID int PRIMARY KEY,
    FileName varchar(50) NOT NULL,
    FileSize varchar(50) NOT NULL,
    UploadDate DATE NOT NULL,
    UserID int FOREIGN KEY,
    FOREIGN KEY (UserID) REFERENCES USER(UserID)
)

-- PART 2
CREATE TABLE STUDENT(
    StudentID int PRIMARY KEY,
    StudentName varchar(50) NOT NULL,
    StudentMajor varchar(50) NOT NULL  
)

CREATE TABLE COURSE(
    CourseID int PRIMARY KEY,
    CourseTitle varchar(50) NOT NULL,
    CourseHours int NOT NULL
)

CREATE TABLE ENROLLMENT(
    StudentID int FOREIGN KEY,
    CourseID int FOREIGN KEY,
    Semester varchar(50) NOT NULL,
    Grade int NOT NULL,
    PRIMARY KEY (StudentID, CourseID, Semester),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
)
