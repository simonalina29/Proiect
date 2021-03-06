USE [master]
GO
/****** Object:  Database [HR]    Script Date: 21.05.2017 15:16:16 ******/
CREATE DATABASE [HR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HR.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HR_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HR] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HR] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR] SET RECOVERY FULL 
GO
ALTER DATABASE [HR] SET  MULTI_USER 
GO
ALTER DATABASE [HR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HR', N'ON'
GO
USE [HR]
GO
/****** Object:  Table [dbo].[acte]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[acte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[denumire] [varchar](30) NOT NULL,
	[continut] [varchar](30) NOT NULL,
 CONSTRAINT [PK__acte__3213E83FB7C53A47] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[candidates]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[candidates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_personal] [int] NOT NULL,
	[CV] [varchar](max) NULL,
 CONSTRAINT [PK__candidat__3213E83F23429DD8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employees]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_personal] [int] NOT NULL,
	[data_in] [date] NOT NULL,
	[data_out] [date] NOT NULL,
	[registration_nr] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[istoric_cereri]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[istoric_cereri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_acte] [int] NOT NULL,
	[id_personal] [int] NOT NULL,
	[data_desc] [datetime2](0) NOT NULL,
 CONSTRAINT [PK__istoric___3213E83FC1DB4BAC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[levels]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[levels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
 CONSTRAINT [PK__levels__3213E83FE7B8A8BB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logs]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_in] [datetime2](0) NOT NULL,
	[date_out] [datetime2](0) NOT NULL,
	[tabel] [int] NOT NULL,
	[view] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[form] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personal]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[personal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[phone] [int] NOT NULL,
	[address] [varchar](max) NOT NULL,
	[CNP] [int] NOT NULL,
	[email] [varchar](30) NOT NULL,
	[civilst] [varchar](max) NOT NULL,
	[depart] [varchar](30) NOT NULL,
	[sex] [varchar](30) NOT NULL,
	[username] [varchar](30) NULL,
	[pass] [varchar](30) NULL,
	[id_level] [int] NULL,
 CONSTRAINT [PK__personal__3213E83F7065D4BF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pontaje]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pontaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_personal] [int] NOT NULL,
	[date_in] [datetime2](0) NOT NULL,
	[date_out] [datetime2](0) NULL,
 CONSTRAINT [PK__pontaje__3213E83F11ECA5EB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rules]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_level] [int] NOT NULL,
	[view_form] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trainers]    Script Date: 21.05.2017 15:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_personal] [int] NOT NULL,
	[schedule] [datetime2](6) NOT NULL,
	[beginning] [date] NOT NULL,
	[finish] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [id_personal]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_personal] ON [dbo].[candidates]
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_personal]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_personal] ON [dbo].[employees]
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_acte]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_acte] ON [dbo].[istoric_cereri]
(
	[id_acte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_personal]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_personal] ON [dbo].[istoric_cereri]
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personal_logs_1]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [personal_logs_1] ON [dbo].[logs]
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [levels_personal_1]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [levels_personal_1] ON [dbo].[personal]
(
	[id_level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_personal]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_personal] ON [dbo].[pontaje]
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_level]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_level] ON [dbo].[rules]
(
	[id_level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_personal]    Script Date: 21.05.2017 15:16:16 ******/
CREATE NONCLUSTERED INDEX [id_personal] ON [dbo].[trainers]
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[logs] ADD  DEFAULT (getdate()) FOR [date_in]
GO
ALTER TABLE [dbo].[personal] ADD  CONSTRAINT [DF__personal__userna__145C0A3F]  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[personal] ADD  CONSTRAINT [DF__personal__pass__15502E78]  DEFAULT (NULL) FOR [pass]
GO
ALTER TABLE [dbo].[personal] ADD  CONSTRAINT [DF__personal__id_lev__164452B1]  DEFAULT (NULL) FOR [id_level]
GO
ALTER TABLE [dbo].[candidates]  WITH CHECK ADD  CONSTRAINT [candidates_ibfk_1] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id])
GO
ALTER TABLE [dbo].[candidates] CHECK CONSTRAINT [candidates_ibfk_1]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [employees_ibfk_1] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [employees_ibfk_1]
GO
ALTER TABLE [dbo].[istoric_cereri]  WITH CHECK ADD  CONSTRAINT [istoric_cereri_ibfk_1] FOREIGN KEY([id_acte])
REFERENCES [dbo].[acte] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[istoric_cereri] CHECK CONSTRAINT [istoric_cereri_ibfk_1]
GO
ALTER TABLE [dbo].[istoric_cereri]  WITH CHECK ADD  CONSTRAINT [istoric_cereri_ibfk_2] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[istoric_cereri] CHECK CONSTRAINT [istoric_cereri_ibfk_2]
GO
ALTER TABLE [dbo].[logs]  WITH CHECK ADD  CONSTRAINT [personal_logs_1] FOREIGN KEY([id_user])
REFERENCES [dbo].[personal] ([id])
GO
ALTER TABLE [dbo].[logs] CHECK CONSTRAINT [personal_logs_1]
GO
ALTER TABLE [dbo].[personal]  WITH CHECK ADD  CONSTRAINT [levels_personal_1] FOREIGN KEY([id_level])
REFERENCES [dbo].[levels] ([id])
GO
ALTER TABLE [dbo].[personal] CHECK CONSTRAINT [levels_personal_1]
GO
ALTER TABLE [dbo].[pontaje]  WITH CHECK ADD  CONSTRAINT [pontaje_ibfk_1] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pontaje] CHECK CONSTRAINT [pontaje_ibfk_1]
GO
ALTER TABLE [dbo].[rules]  WITH CHECK ADD  CONSTRAINT [rules_ibfk_1] FOREIGN KEY([id_level])
REFERENCES [dbo].[levels] ([id])
GO
ALTER TABLE [dbo].[rules] CHECK CONSTRAINT [rules_ibfk_1]
GO
ALTER TABLE [dbo].[trainers]  WITH CHECK ADD  CONSTRAINT [trainers_ibfk_1] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id])
GO
ALTER TABLE [dbo].[trainers] CHECK CONSTRAINT [trainers_ibfk_1]
GO
USE [master]
GO
ALTER DATABASE [HR] SET  READ_WRITE 
GO
