USE [master]
GO
/****** Object:  Database [SIMS]    Script Date: 7/14/2015 6:21:44 PM ******/
CREATE DATABASE [SIMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SIMS', FILENAME = N'i:\SetupFiles\SQLServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\SIMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SIMS_log', FILENAME = N'i:\SetupFiles\SQLServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\SIMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SIMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SIMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SIMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SIMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SIMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SIMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SIMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SIMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SIMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SIMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SIMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SIMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SIMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SIMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SIMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SIMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SIMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SIMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SIMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SIMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SIMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SIMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SIMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SIMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SIMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SIMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SIMS] SET  MULTI_USER 
GO
ALTER DATABASE [SIMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SIMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SIMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SIMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SIMS]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllDepartment]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetAllDepartment]
as
begin
     select * from tblDepartment
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllGender]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetAllGender]
as
begin
     select * from tblGender
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSession]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetAllSession]
as
begin
    select * from tblSession
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllYearTerm]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetAllYearTerm]
as
begin
     select * from tblYearTerm
end
GO
/****** Object:  StoredProcedure [dbo].[spSaveNewStudentInformation]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSaveNewStudentInformation]
@studentId varchar(100),
@studentName varchar(200),
@phone varchar(100),
@email varchar(200),
@presentAddress varchar(max),
@permanentAddress varchar(max),
@genderId int,
@nationality int,
@departmentId int,
@sessionId int,
@yearTermId int,
@code varchar(max),
@password varchar(max)
as
begin
    insert into tblStudent values(@studentId,@studentName,@phone,@email,
	@presentAddress,@permanentAddress,@genderId,@nationality,@departmentId,
	@yearTermId,@sessionId,@code,@password)
end
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCourse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseCode] [varchar](50) NOT NULL,
	[title] [varchar](200) NOT NULL,
	[credit] [decimal](2, 2) NOT NULL,
	[deptId] [int] NOT NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[facultyId] [int] NOT NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFaculty]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFaculty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[facultyName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblFaculty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGender]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblGender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGpa]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGpa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gpaType] [varchar](50) NOT NULL,
	[gpa] [decimal](1, 1) NOT NULL,
 CONSTRAINT [PK_tblGpa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNationality]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNationality](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nationality] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblNationality] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSession]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSession](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblSession] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStudent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [varchar](50) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[presentAddress] [varchar](100) NOT NULL,
	[parmenantAddress] [varchar](100) NOT NULL,
	[genderId] [int] NOT NULL,
	[nationalityId] [int] NOT NULL,
	[deptId] [int] NOT NULL,
	[sessionId] [int] NOT NULL,
	[yearTermId] [int] NOT NULL,
	[code] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblStudent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTeacher]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTeacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[designation] [varchar](100) NOT NULL,
	[mobile] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[genderId] [int] NOT NULL,
	[nationalityId] [int] NOT NULL,
	[deptId] [int] NOT NULL,
	[JoiningDate] [date] NOT NULL,
	[code] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblTeacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblYearTerm]    Script Date: 7/14/2015 6:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblYearTerm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[yearTermName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblYearTerm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblDepartment] ON 

INSERT [dbo].[tblDepartment] ([id], [name], [facultyId]) VALUES (1020, N'CSTE', 20)
INSERT [dbo].[tblDepartment] ([id], [name], [facultyId]) VALUES (1021, N'ACCE', 20)
INSERT [dbo].[tblDepartment] ([id], [name], [facultyId]) VALUES (1022, N'EEE', 20)
INSERT [dbo].[tblDepartment] ([id], [name], [facultyId]) VALUES (1023, N'EPS', 21)
INSERT [dbo].[tblDepartment] ([id], [name], [facultyId]) VALUES (1024, N'GETT', 6)
INSERT [dbo].[tblDepartment] ([id], [name], [facultyId]) VALUES (1025, N'English Literature', 22)
SET IDENTITY_INSERT [dbo].[tblDepartment] OFF
SET IDENTITY_INSERT [dbo].[tblFaculty] ON 

INSERT [dbo].[tblFaculty] ([id], [facultyName]) VALUES (22, N'Arts')
INSERT [dbo].[tblFaculty] ([id], [facultyName]) VALUES (21, N'Commerce')
INSERT [dbo].[tblFaculty] ([id], [facultyName]) VALUES (20, N'Engineering')
INSERT [dbo].[tblFaculty] ([id], [facultyName]) VALUES (6, N'Life Science')
SET IDENTITY_INSERT [dbo].[tblFaculty] OFF
SET IDENTITY_INSERT [dbo].[tblGender] ON 

INSERT [dbo].[tblGender] ([id], [name]) VALUES (1, N'Male')
INSERT [dbo].[tblGender] ([id], [name]) VALUES (2, N'Female')
INSERT [dbo].[tblGender] ([id], [name]) VALUES (3, N'Unknown')
SET IDENTITY_INSERT [dbo].[tblGender] OFF
SET IDENTITY_INSERT [dbo].[tblNationality] ON 

INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (1, N'Bangladeshi')
INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (2, N'Indian')
INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (3, N'Japanese')
INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (4, N'Chainese')
INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (5, N'English')
INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (6, N'American')
INSERT [dbo].[tblNationality] ([id], [nationality]) VALUES (7, N'Canadian')
SET IDENTITY_INSERT [dbo].[tblNationality] OFF
SET IDENTITY_INSERT [dbo].[tblSession] ON 

INSERT [dbo].[tblSession] ([id], [name]) VALUES (1, N'2009-2010')
INSERT [dbo].[tblSession] ([id], [name]) VALUES (2, N'2010-2011')
INSERT [dbo].[tblSession] ([id], [name]) VALUES (3, N'2011-2012')
INSERT [dbo].[tblSession] ([id], [name]) VALUES (4, N'2012-2013')
INSERT [dbo].[tblSession] ([id], [name]) VALUES (6, N'2013-2014')
INSERT [dbo].[tblSession] ([id], [name]) VALUES (7, N'2014-2015')
SET IDENTITY_INSERT [dbo].[tblSession] OFF
SET IDENTITY_INSERT [dbo].[tblYearTerm] ON 

INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (1, N'1st Year; 1st Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (2, N'1st Year; 2nd Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (3, N'2nd Year; 1st Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (4, N'2nd Year; 2nd Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (5, N'3rd Year; 1st Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (6, N'3rd Year; 2nd Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (7, N'4th Year; 1st Term')
INSERT [dbo].[tblYearTerm] ([id], [yearTermName]) VALUES (8, N'4th Year; 2nd Term')
SET IDENTITY_INSERT [dbo].[tblYearTerm] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblFaculty]    Script Date: 7/14/2015 6:21:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblFaculty] ON [dbo].[tblFaculty]
(
	[facultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_PK_tblCourse] FOREIGN KEY([deptId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_PK_tblCourse]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_PK_tblDepartment] FOREIGN KEY([deptId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_PK_tblDepartment]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_PK_tblGender] FOREIGN KEY([genderId])
REFERENCES [dbo].[tblGender] ([id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_PK_tblGender]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_PK_tblNationality] FOREIGN KEY([nationalityId])
REFERENCES [dbo].[tblNationality] ([id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_PK_tblNationality]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_PK_tblStudent] FOREIGN KEY([sessionId])
REFERENCES [dbo].[tblSession] ([id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_PK_tblStudent]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_PK_tblYearTerm] FOREIGN KEY([yearTermId])
REFERENCES [dbo].[tblYearTerm] ([id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_PK_tblYearTerm]
GO
ALTER TABLE [dbo].[tblTeacher]  WITH CHECK ADD  CONSTRAINT [FK_tblTeacher_PK_tblDepartment] FOREIGN KEY([deptId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblTeacher] CHECK CONSTRAINT [FK_tblTeacher_PK_tblDepartment]
GO
ALTER TABLE [dbo].[tblTeacher]  WITH CHECK ADD  CONSTRAINT [FK_tblTeacher_PK_tblGender] FOREIGN KEY([genderId])
REFERENCES [dbo].[tblGender] ([id])
GO
ALTER TABLE [dbo].[tblTeacher] CHECK CONSTRAINT [FK_tblTeacher_PK_tblGender]
GO
ALTER TABLE [dbo].[tblTeacher]  WITH CHECK ADD  CONSTRAINT [FK_tblTeacher_PK_tblNationality] FOREIGN KEY([nationalityId])
REFERENCES [dbo].[tblNationality] ([id])
GO
ALTER TABLE [dbo].[tblTeacher] CHECK CONSTRAINT [FK_tblTeacher_PK_tblNationality]
GO
USE [master]
GO
ALTER DATABASE [SIMS] SET  READ_WRITE 
GO
