/****** Object:  Database [AssetManagementFullStackDB]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE DATABASE [AssetManagementFullStackDB]
CONTAINMENT = NONE
ON  PRIMARY 
( NAME = N'AssetManagementFullStackDB', FILENAME = N'C:\Users\youyo\OneDrive\Bureau\FullStackAsset\backend-.net\AssetManagementFullStackDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
LOG ON 
( NAME = N'AssetManagementFullStackDB_log', FILENAME = N'C:\Users\youyo\OneDrive\Bureau\FullStackAsset\backend-.net\AssetManagementFullStackDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AssetManagementFullStackDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssetManagementFullStackDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET  MULTI_USER 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssetManagementFullStackDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssetManagementFullStackDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AssetManagementFullStackDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssetManagementFullStackDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SenderUserName] [nvarchar](max) NOT NULL,
	[ReceiverUserName] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250419232251_init', N'8.0.15')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5d888c75-8abb-454f-aadd-742f49e470d6', N'MANAGER', N'MANAGER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'cfe419e1-2616-4a73-b73f-bb298e7a1d56', N'ADMIN', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd', N'USER', N'USER', NULL)
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (1, N'imano', N'Registered to Website', CAST(N'2025-04-23T00:19:14.2188287' AS DateTime2), CAST(N'2025-04-23T00:19:14.2188392' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (2, N'imano', N'Registered to Website', CAST(N'2025-04-23T00:31:57.8287640' AS DateTime2), CAST(N'2025-04-23T00:31:57.8287791' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (3, N'imano', N'New Login', CAST(N'2025-04-23T00:39:11.4119686' AS DateTime2), CAST(N'2025-04-23T00:39:11.4119889' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (4, N'imano', N'New Login', CAST(N'2025-04-23T00:43:15.8358856' AS DateTime2), CAST(N'2025-04-23T00:43:15.8358940' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (5, N'imano', N'New Login', CAST(N'2025-04-23T18:48:35.8385370' AS DateTime2), CAST(N'2025-04-23T18:48:35.8385463' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (6, N'imano', N'New Login', CAST(N'2025-04-23T18:57:00.7748032' AS DateTime2), CAST(N'2025-04-23T18:57:00.7748115' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (7, N'imano', N'New Login', CAST(N'2025-04-23T18:57:06.7845739' AS DateTime2), CAST(N'2025-04-23T18:57:06.7845812' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (8, N'imano', N'New Token Generated', CAST(N'2025-04-23T18:58:17.5119091' AS DateTime2), CAST(N'2025-04-23T18:58:17.5119204' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (9, N'benuser1', N'Registered to Website', CAST(N'2025-04-23T19:06:12.1364834' AS DateTime2), CAST(N'2025-04-23T19:06:12.1364886' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (10, N'benuser2', N'Registered to Website', CAST(N'2025-04-23T19:07:02.9445920' AS DateTime2), CAST(N'2025-04-23T19:07:02.9445977' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (11, N'benuser3', N'Registered to Website', CAST(N'2025-04-23T19:07:39.8833248' AS DateTime2), CAST(N'2025-04-23T19:07:39.8833291' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (12, N'benuser4', N'Registered to Website', CAST(N'2025-04-23T19:11:27.6992280' AS DateTime2), CAST(N'2025-04-23T19:11:27.6992319' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (13, N'benuser5', N'Registered to Website', CAST(N'2025-04-23T19:12:23.2411264' AS DateTime2), CAST(N'2025-04-23T19:12:23.2411306' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (14, N'benuser6', N'Registered to Website', CAST(N'2025-04-23T19:12:44.0161687' AS DateTime2), CAST(N'2025-04-23T19:12:44.0161736' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (15, N'benuser7', N'Registered to Website', CAST(N'2025-04-23T19:12:53.7159459' AS DateTime2), CAST(N'2025-04-23T19:12:53.7159501' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (16, N'benuser8', N'Registered to Website', CAST(N'2025-04-23T19:13:04.4753699' AS DateTime2), CAST(N'2025-04-23T19:13:04.4753729' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (17, N'benuser9', N'Registered to Website', CAST(N'2025-04-23T19:13:14.4397423' AS DateTime2), CAST(N'2025-04-23T19:13:14.4397462' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (18, N'benuser1', N'New Login', CAST(N'2025-04-23T19:16:21.5052272' AS DateTime2), CAST(N'2025-04-23T19:16:21.5052304' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (19, N'imano', N'New Login', CAST(N'2025-04-23T19:22:26.5527116' AS DateTime2), CAST(N'2025-04-23T19:22:26.5527157' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (20, N'imano', N'New Login', CAST(N'2025-04-23T21:24:58.6767747' AS DateTime2), CAST(N'2025-04-23T21:24:58.6767790' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (21, N'benuser2', N'New Login', CAST(N'2025-04-23T21:35:31.5438447' AS DateTime2), CAST(N'2025-04-23T21:35:31.5438482' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (22, N'imano', N'New Login', CAST(N'2025-04-23T21:41:18.5755649' AS DateTime2), CAST(N'2025-04-23T21:41:18.5755682' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (23, N'benuser8', N'Role updated to MANAGER', CAST(N'2025-04-23T21:41:55.3782331' AS DateTime2), CAST(N'2025-04-23T21:41:55.3782370' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (24, N'imano', N'New Login', CAST(N'2025-04-23T23:35:28.2739519' AS DateTime2), CAST(N'2025-04-23T23:35:28.2739648' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (25, N'benuser8', N'Role updated to ADMIN', CAST(N'2025-04-23T23:36:28.1364280' AS DateTime2), CAST(N'2025-04-23T23:36:28.1364404' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (26, N'benuser5', N'Role updated to MANAGER', CAST(N'2025-04-23T23:40:23.9711657' AS DateTime2), CAST(N'2025-04-23T23:40:23.9711749' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (27, N'benuser5', N'Role updated to USER', CAST(N'2025-04-23T23:41:14.2722050' AS DateTime2), CAST(N'2025-04-23T23:41:14.2722106' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (28, N'benuser5', N'Role updated to MANAGER', CAST(N'2025-04-23T23:41:51.2491816' AS DateTime2), CAST(N'2025-04-23T23:41:51.2491879' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (29, N'benuser5', N'Role updated to ADMIN', CAST(N'2025-04-23T23:42:06.3226848' AS DateTime2), CAST(N'2025-04-23T23:42:06.3226900' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (30, N'benuser9', N'New Login', CAST(N'2025-04-23T23:53:00.8772070' AS DateTime2), CAST(N'2025-04-23T23:53:00.8772103' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (31, N'benuser6', N'New Login', CAST(N'2025-04-24T00:10:17.7085357' AS DateTime2), CAST(N'2025-04-24T00:10:17.7085456' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (32, N'benuser5', N'New Login', CAST(N'2025-04-24T00:13:12.3601286' AS DateTime2), CAST(N'2025-04-24T00:13:12.3601455' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (33, N'benuser5', N'New Login', CAST(N'2025-04-24T00:13:15.0993714' AS DateTime2), CAST(N'2025-04-24T00:13:15.0993805' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (34, N'benuser10', N'Registered to Website', CAST(N'2025-04-24T00:14:20.3170066' AS DateTime2), CAST(N'2025-04-24T00:14:20.3170168' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (35, N'benuser5', N'New Login', CAST(N'2025-04-24T16:13:38.4618501' AS DateTime2), CAST(N'2025-04-24T16:13:38.4618602' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (36, N'benuser5', N'New Token Generated', CAST(N'2025-04-24T16:40:21.2600363' AS DateTime2), CAST(N'2025-04-24T16:40:21.2600445' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (37, N'benuser3', N'New Login', CAST(N'2025-04-24T16:40:48.6359745' AS DateTime2), CAST(N'2025-04-24T16:40:48.6359835' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (38, N'benuser3', N'Send Message', CAST(N'2025-04-24T16:42:03.3364498' AS DateTime2), CAST(N'2025-04-24T16:42:03.3364626' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (39, N'benuser11', N'Registered to Website', CAST(N'2025-04-26T13:22:50.8791982' AS DateTime2), CAST(N'2025-04-26T13:22:50.8792079' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (40, N'benuser11', N'New Login', CAST(N'2025-04-26T16:00:42.2223466' AS DateTime2), CAST(N'2025-04-26T16:00:42.2223554' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (41, N'benuser11', N'New Login', CAST(N'2025-04-26T16:03:50.6752055' AS DateTime2), CAST(N'2025-04-26T16:03:50.6752140' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (42, N'benuser11', N'New Token Generated', CAST(N'2025-04-26T16:04:21.4251056' AS DateTime2), CAST(N'2025-04-26T16:04:21.4251137' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (43, N'benuser11', N'New Token Generated', CAST(N'2025-04-26T16:04:45.7598507' AS DateTime2), CAST(N'2025-04-26T16:04:45.7598574' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (44, N'benuser11', N'New Login', CAST(N'2025-04-26T16:08:16.6029972' AS DateTime2), CAST(N'2025-04-26T16:08:16.6030037' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (45, N'benuser11', N'New Login', CAST(N'2025-04-26T16:19:29.9069335' AS DateTime2), CAST(N'2025-04-26T16:19:29.9069432' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (46, N'benuser11', N'New Login', CAST(N'2025-04-26T16:20:01.3363695' AS DateTime2), CAST(N'2025-04-26T16:20:01.3363753' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (47, N'imano', N'New Login', CAST(N'2025-04-26T16:25:44.9200674' AS DateTime2), CAST(N'2025-04-26T16:25:44.9200724' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (48, N'imano', N'New Login', CAST(N'2025-04-26T16:56:02.4650416' AS DateTime2), CAST(N'2025-04-26T16:56:02.4650496' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (49, N'imano', N'New Token Generated', CAST(N'2025-04-26T16:59:12.6063248' AS DateTime2), CAST(N'2025-04-26T16:59:12.6064627' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (50, N'benuser11', N'New Login', CAST(N'2025-04-26T17:03:07.0395208' AS DateTime2), CAST(N'2025-04-26T17:03:07.0395247' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (51, N'benuser11', N'New Token Generated', CAST(N'2025-04-26T17:03:22.0120227' AS DateTime2), CAST(N'2025-04-26T17:03:22.0120292' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (52, N'benuser11', N'New Token Generated', CAST(N'2025-04-26T17:03:30.1370358' AS DateTime2), CAST(N'2025-04-26T17:03:30.1370393' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (53, N'imano', N'New Login', CAST(N'2025-04-26T17:04:21.9110804' AS DateTime2), CAST(N'2025-04-26T17:04:21.9110838' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (54, N'benuser7', N'Role updated to MANAGER', CAST(N'2025-04-26T17:05:27.6211328' AS DateTime2), CAST(N'2025-04-26T17:05:27.6211363' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (55, N'benuser7', N'New Login', CAST(N'2025-04-26T17:05:44.6555200' AS DateTime2), CAST(N'2025-04-26T17:05:44.6555233' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (56, N'imano', N'New Login', CAST(N'2025-04-26T18:15:42.3120102' AS DateTime2), CAST(N'2025-04-26T18:15:42.3120246' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (57, N'imano', N'New Token Generated', CAST(N'2025-04-26T18:18:07.9404442' AS DateTime2), CAST(N'2025-04-26T18:18:07.9404596' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (58, N'benuser7', N'New Token Generated', CAST(N'2025-04-26T18:25:38.6253945' AS DateTime2), CAST(N'2025-04-26T18:25:38.6253971' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (59, N'imano', N'New Login', CAST(N'2025-04-26T18:29:18.4949819' AS DateTime2), CAST(N'2025-04-26T18:29:18.4949852' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (60, N'benuser7', N'New Login', CAST(N'2025-04-26T23:05:45.3481421' AS DateTime2), CAST(N'2025-04-26T23:05:45.3481450' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (61, N'benuser7', N'New Token Generated', CAST(N'2025-04-26T23:06:06.1195084' AS DateTime2), CAST(N'2025-04-26T23:06:06.1195113' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (62, N'benuser7', N'New Token Generated', CAST(N'2025-04-26T23:23:32.1803372' AS DateTime2), CAST(N'2025-04-26T23:23:32.1803405' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (63, N'benuser7', N'New Token Generated', CAST(N'2025-04-26T23:29:58.5655230' AS DateTime2), CAST(N'2025-04-26T23:29:58.5655260' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (64, N'imano', N'New Login', CAST(N'2025-04-26T23:48:23.1837870' AS DateTime2), CAST(N'2025-04-26T23:48:23.1837899' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (65, N'imano', N'New Token Generated', CAST(N'2025-04-26T23:51:30.3261035' AS DateTime2), CAST(N'2025-04-26T23:51:30.3261063' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (66, N'imano', N'New Login', CAST(N'2025-04-26T23:55:28.8016638' AS DateTime2), CAST(N'2025-04-26T23:55:28.8016665' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (67, N'imano', N'Send Message', CAST(N'2025-04-26T23:56:38.0235741' AS DateTime2), CAST(N'2025-04-26T23:56:38.0235776' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (68, N'imano', N'New Token Generated', CAST(N'2025-04-26T23:56:45.2504169' AS DateTime2), CAST(N'2025-04-26T23:56:45.2504226' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (69, N'imano', N'Send Message', CAST(N'2025-04-27T00:09:19.3918815' AS DateTime2), CAST(N'2025-04-27T00:09:19.3918846' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (70, N'imano', N'New Login', CAST(N'2025-04-27T10:49:13.5021836' AS DateTime2), CAST(N'2025-04-27T10:49:13.5021875' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (71, N'imano', N'New Login', CAST(N'2025-04-27T16:26:52.1732397' AS DateTime2), CAST(N'2025-04-27T16:26:52.1732494' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (72, N'benuser7', N'Role updated to USER', CAST(N'2025-04-27T16:29:25.4487056' AS DateTime2), CAST(N'2025-04-27T16:29:25.4487222' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (73, N'benuser11', N'Role updated to MANAGER', CAST(N'2025-04-27T16:29:50.5839392' AS DateTime2), CAST(N'2025-04-27T16:29:50.5839469' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (74, N'benuser8', N'Role updated to MANAGER', CAST(N'2025-04-27T16:30:20.5802879' AS DateTime2), CAST(N'2025-04-27T16:30:20.5802927' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (75, N'imano', N'New Token Generated', CAST(N'2025-04-27T17:41:01.5413598' AS DateTime2), CAST(N'2025-04-27T17:41:01.5413627' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (76, N'imano', N'New Login', CAST(N'2025-04-28T01:49:58.1594952' AS DateTime2), CAST(N'2025-04-28T01:49:58.1594993' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (77, N'imano', N'New Login', CAST(N'2025-04-28T18:03:46.6984467' AS DateTime2), CAST(N'2025-04-28T18:03:46.6984500' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (78, N'imano', N'New Login', CAST(N'2025-04-28T18:04:43.4906734' AS DateTime2), CAST(N'2025-04-28T18:04:43.4906766' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (79, N'benuser9', N'Role updated to ADMIN', CAST(N'2025-04-28T18:05:33.9607786' AS DateTime2), CAST(N'2025-04-28T18:05:33.9607819' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (80, N'benuser6', N'New Login', CAST(N'2025-04-28T19:14:09.3473754' AS DateTime2), CAST(N'2025-04-28T19:14:09.3473900' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (81, N'benuser6', N'New Login', CAST(N'2025-04-29T23:09:04.6030784' AS DateTime2), CAST(N'2025-04-29T23:09:04.6030969' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (82, N'benuser6', N'New Token Generated', CAST(N'2025-04-29T23:09:15.1407495' AS DateTime2), CAST(N'2025-04-29T23:09:15.1407592' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (83, N'benuser9', N'New Login', CAST(N'2025-04-29T23:10:06.7884815' AS DateTime2), CAST(N'2025-04-29T23:10:06.7884896' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (84, N'benuser11', N'New Login', CAST(N'2025-04-29T23:10:31.6256403' AS DateTime2), CAST(N'2025-04-29T23:10:31.6256459' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (85, N'benuser6', N'New Login', CAST(N'2025-04-29T23:23:36.5902306' AS DateTime2), CAST(N'2025-04-29T23:23:36.5902368' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (86, N'benuser5', N'New Login', CAST(N'2025-04-29T23:27:06.3120335' AS DateTime2), CAST(N'2025-04-29T23:27:06.3120378' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (87, N'benuser5', N'New Login', CAST(N'2025-04-29T23:27:47.3660818' AS DateTime2), CAST(N'2025-04-29T23:27:47.3660870' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (88, N'benuser1', N'New Login', CAST(N'2025-04-29T23:28:16.9597232' AS DateTime2), CAST(N'2025-04-29T23:28:16.9597283' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (89, N'benuser7', N'New Login', CAST(N'2025-04-30T17:02:52.0217585' AS DateTime2), CAST(N'2025-04-30T17:02:52.0217746' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (90, N'benuser7', N'New Login', CAST(N'2025-04-30T17:50:47.0900413' AS DateTime2), CAST(N'2025-04-30T17:50:47.0900444' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (91, N'benuser7', N'New Login', CAST(N'2025-04-30T17:52:07.7795254' AS DateTime2), CAST(N'2025-04-30T17:52:07.7795284' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (92, N'benuser6', N'New Login', CAST(N'2025-04-30T18:52:02.9111060' AS DateTime2), CAST(N'2025-04-30T18:52:02.9111113' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (93, N'benuser6', N'New Token Generated', CAST(N'2025-04-30T18:53:42.7674333' AS DateTime2), CAST(N'2025-04-30T18:53:42.7674370' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (94, N'benuser6', N'New Login', CAST(N'2025-04-30T19:07:10.1636122' AS DateTime2), CAST(N'2025-04-30T19:07:10.1636158' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (95, N'benuser7', N'New Login', CAST(N'2025-04-30T19:42:04.2660120' AS DateTime2), CAST(N'2025-04-30T19:42:04.2660162' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (96, N'benuser7', N'New Token Generated', CAST(N'2025-04-30T19:43:56.3283009' AS DateTime2), CAST(N'2025-04-30T19:43:56.3283049' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (97, N'benuser7', N'New Login', CAST(N'2025-04-30T19:49:23.9908032' AS DateTime2), CAST(N'2025-04-30T19:49:23.9908069' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (98, N'benuser7', N'New Login', CAST(N'2025-04-30T19:50:47.3710402' AS DateTime2), CAST(N'2025-04-30T19:50:47.3710438' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (99, N'benuser7', N'New Login', CAST(N'2025-04-30T19:51:55.8790527' AS DateTime2), CAST(N'2025-04-30T19:51:55.8790566' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (100, N'benuser7', N'New Login', CAST(N'2025-04-30T19:59:46.2402005' AS DateTime2), CAST(N'2025-04-30T19:59:46.2402040' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (101, N'benuser7', N'New Login', CAST(N'2025-05-01T00:52:50.3596581' AS DateTime2), CAST(N'2025-05-01T00:52:50.3596626' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (102, N'benuser1', N'New Login', CAST(N'2025-05-01T00:54:22.9950022' AS DateTime2), CAST(N'2025-05-01T00:54:22.9950057' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (103, N'benuser4', N'New Login', CAST(N'2025-05-01T16:43:56.1544058' AS DateTime2), CAST(N'2025-05-01T16:43:56.1544093' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (104, N'benuser4', N'New Token Generated', CAST(N'2025-05-01T16:44:35.7956267' AS DateTime2), CAST(N'2025-05-01T16:44:35.7956303' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (105, N'imano', N'New Login', CAST(N'2025-05-01T16:52:15.5067804' AS DateTime2), CAST(N'2025-05-01T16:52:15.5067848' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (106, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:00:52.0046418' AS DateTime2), CAST(N'2025-05-01T18:00:52.0046457' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (107, N'imano', N'New Login', CAST(N'2025-05-01T18:01:04.6677850' AS DateTime2), CAST(N'2025-05-01T18:01:04.6677886' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (108, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:31:19.9978923' AS DateTime2), CAST(N'2025-05-01T18:31:19.9978969' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (109, N'imano', N'New Login', CAST(N'2025-05-01T18:32:06.0410392' AS DateTime2), CAST(N'2025-05-01T18:32:06.0410432' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (110, N'benuser4', N'Role updated to ADMIN', CAST(N'2025-05-01T18:33:08.5167168' AS DateTime2), CAST(N'2025-05-01T18:33:08.5167260' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (111, N'imano', N'New Login', CAST(N'2025-05-01T18:48:31.7879283' AS DateTime2), CAST(N'2025-05-01T18:48:31.7879408' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (112, N'benuser10', N'New Login', CAST(N'2025-05-01T18:49:03.7468328' AS DateTime2), CAST(N'2025-05-01T18:49:03.7468419' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (113, N'benuser8', N'New Login', CAST(N'2025-05-01T18:51:31.8166794' AS DateTime2), CAST(N'2025-05-01T18:51:31.8166874' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (114, N'benuser8', N'New Login', CAST(N'2025-05-01T18:51:35.4259339' AS DateTime2), CAST(N'2025-05-01T18:51:35.4259408' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (115, N'imano', N'New Login', CAST(N'2025-05-01T18:53:32.7249441' AS DateTime2), CAST(N'2025-05-01T18:53:32.7249495' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (116, N'benuser12', N'Registered to Website', CAST(N'2025-05-01T18:54:07.4228000' AS DateTime2), CAST(N'2025-05-01T18:54:07.4228073' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (117, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:54:16.2635660' AS DateTime2), CAST(N'2025-05-01T18:54:16.2635712' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (118, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:55:33.5595482' AS DateTime2), CAST(N'2025-05-01T18:55:33.5595552' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (119, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:55:33.6570975' AS DateTime2), CAST(N'2025-05-01T18:55:33.6571018' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (120, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:56:08.7831075' AS DateTime2), CAST(N'2025-05-01T18:56:08.7831105' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (121, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:56:41.2339665' AS DateTime2), CAST(N'2025-05-01T18:56:41.2339694' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (122, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:56:41.3312717' AS DateTime2), CAST(N'2025-05-01T18:56:41.3312746' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (123, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:56:43.0775293' AS DateTime2), CAST(N'2025-05-01T18:56:43.0775327' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (124, N'imano', N'New Token Generated', CAST(N'2025-05-01T18:56:44.0115863' AS DateTime2), CAST(N'2025-05-01T18:56:44.0115888' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (125, N'benuser5', N'New Login', CAST(N'2025-05-01T19:35:11.4662504' AS DateTime2), CAST(N'2025-05-01T19:35:11.4662610' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (126, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:47:33.7614032' AS DateTime2), CAST(N'2025-05-01T19:47:33.7614099' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (127, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:47:36.4372027' AS DateTime2), CAST(N'2025-05-01T19:47:36.4372086' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (128, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:47:51.1302758' AS DateTime2), CAST(N'2025-05-01T19:47:51.1302814' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (129, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:48:23.1740165' AS DateTime2), CAST(N'2025-05-01T19:48:23.1740219' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (130, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:48:31.6830346' AS DateTime2), CAST(N'2025-05-01T19:48:31.6830397' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (131, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:48:33.3773010' AS DateTime2), CAST(N'2025-05-01T19:48:33.3773074' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (132, N'benuser5', N'New Token Generated', CAST(N'2025-05-01T19:51:05.3036135' AS DateTime2), CAST(N'2025-05-01T19:51:05.3036175' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (133, N'benuser13', N'Registered to Website', CAST(N'2025-05-01T19:56:01.7003271' AS DateTime2), CAST(N'2025-05-01T19:56:01.7003308' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (134, N'benuser13', N'New Login', CAST(N'2025-05-01T19:57:26.0510191' AS DateTime2), CAST(N'2025-05-01T19:57:26.0510222' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (135, N'benuser5', N'New Login', CAST(N'2025-05-01T19:58:07.4466463' AS DateTime2), CAST(N'2025-05-01T19:58:07.4466499' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (136, N'imano', N'New Login', CAST(N'2025-05-01T19:59:24.8701379' AS DateTime2), CAST(N'2025-05-01T19:59:24.8701413' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (137, N'benuser13', N'New Login', CAST(N'2025-05-01T19:59:58.2746308' AS DateTime2), CAST(N'2025-05-01T19:59:58.2746344' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (138, N'benuser2', N'New Login', CAST(N'2025-05-01T20:07:21.1550899' AS DateTime2), CAST(N'2025-05-01T20:07:21.1550934' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (139, N'imano', N'New Login', CAST(N'2025-05-01T20:10:57.7581100' AS DateTime2), CAST(N'2025-05-01T20:10:57.7581133' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (140, N'imano', N'New Token Generated', CAST(N'2025-05-01T20:14:10.3231301' AS DateTime2), CAST(N'2025-05-01T20:14:10.3231345' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (141, N'imano', N'New Login', CAST(N'2025-05-01T20:14:51.3331079' AS DateTime2), CAST(N'2025-05-01T20:14:51.3331112' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (142, N'benuser5', N'New Login', CAST(N'2025-05-01T20:17:28.2925127' AS DateTime2), CAST(N'2025-05-01T20:17:28.2925163' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (143, N'imano', N'New Login', CAST(N'2025-05-02T00:18:14.9635043' AS DateTime2), CAST(N'2025-05-02T00:18:14.9635106' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (144, N'imano', N'New Login', CAST(N'2025-05-02T00:19:03.4942065' AS DateTime2), CAST(N'2025-05-02T00:19:03.4942099' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (145, N'imano', N'New Login', CAST(N'2025-05-02T00:19:15.9049040' AS DateTime2), CAST(N'2025-05-02T00:19:15.9049072' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (146, N'imano', N'New Login', CAST(N'2025-05-02T00:19:28.5667325' AS DateTime2), CAST(N'2025-05-02T00:19:28.5667359' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (147, N'benuser7', N'New Login', CAST(N'2025-05-02T00:20:01.1652345' AS DateTime2), CAST(N'2025-05-02T00:20:01.1652380' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (148, N'benuser7', N'New Token Generated', CAST(N'2025-05-02T00:20:39.5394690' AS DateTime2), CAST(N'2025-05-02T00:20:39.5394725' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (149, N'benuser7', N'New Token Generated', CAST(N'2025-05-02T00:49:50.7273903' AS DateTime2), CAST(N'2025-05-02T00:49:50.7273934' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (150, N'benuser6', N'New Login', CAST(N'2025-05-03T09:32:21.8060319' AS DateTime2), CAST(N'2025-05-03T09:32:21.8060415' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (151, N'benuser6', N'New Login', CAST(N'2025-05-03T09:33:07.9486203' AS DateTime2), CAST(N'2025-05-03T09:33:07.9486350' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (152, N'benuser6', N'New Login', CAST(N'2025-05-03T09:33:28.8777910' AS DateTime2), CAST(N'2025-05-03T09:33:28.8777995' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (153, N'benuser6', N'New Login', CAST(N'2025-05-03T09:35:19.6197799' AS DateTime2), CAST(N'2025-05-03T09:35:19.6197872' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (154, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:44:21.8846910' AS DateTime2), CAST(N'2025-05-03T09:44:21.8847025' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (155, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:45:45.4323245' AS DateTime2), CAST(N'2025-05-03T09:45:45.4323374' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (156, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:46:36.2987521' AS DateTime2), CAST(N'2025-05-03T09:46:36.2987583' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (157, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:46:46.9771791' AS DateTime2), CAST(N'2025-05-03T09:46:46.9771854' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (158, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:48:01.4169925' AS DateTime2), CAST(N'2025-05-03T09:48:01.4169980' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (159, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:52:14.3317628' AS DateTime2), CAST(N'2025-05-03T09:52:14.3317681' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (160, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:52:17.9581041' AS DateTime2), CAST(N'2025-05-03T09:52:17.9581093' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (161, N'benuser6', N'New Token Generated', CAST(N'2025-05-03T09:54:16.3898330' AS DateTime2), CAST(N'2025-05-03T09:54:16.3899114' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (162, N'imano', N'New Login', CAST(N'2025-05-03T09:57:05.9576024' AS DateTime2), CAST(N'2025-05-03T09:57:05.9576061' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (163, N'benuser7', N'New Login', CAST(N'2025-05-03T09:58:46.8353767' AS DateTime2), CAST(N'2025-05-03T09:58:46.8353806' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (164, N'benuser9', N'New Login', CAST(N'2025-05-03T10:04:42.9376684' AS DateTime2), CAST(N'2025-05-03T10:04:42.9376718' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (165, N'benuser4', N'New Login', CAST(N'2025-05-03T10:05:07.1309150' AS DateTime2), CAST(N'2025-05-03T10:05:07.1309187' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (166, N'benuser13', N'New Login', CAST(N'2025-05-03T10:05:23.5318844' AS DateTime2), CAST(N'2025-05-03T10:05:23.5318875' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (167, N'benuser13', N'New Token Generated', CAST(N'2025-05-03T10:14:37.5401776' AS DateTime2), CAST(N'2025-05-03T10:14:37.5401806' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (168, N'imano', N'New Login', CAST(N'2025-05-03T10:18:44.2725985' AS DateTime2), CAST(N'2025-05-03T10:18:44.2726020' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (169, N'benuser7', N'New Login', CAST(N'2025-05-03T10:19:51.9848680' AS DateTime2), CAST(N'2025-05-03T10:19:51.9848719' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (170, N'imano', N'New Login', CAST(N'2025-05-03T10:21:18.7490266' AS DateTime2), CAST(N'2025-05-03T10:21:18.7490317' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (171, N'benuser11', N'New Login', CAST(N'2025-05-03T10:22:24.7891018' AS DateTime2), CAST(N'2025-05-03T10:22:24.7891049' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (172, N'benuser6', N'New Login', CAST(N'2025-05-03T12:19:13.6688228' AS DateTime2), CAST(N'2025-05-03T12:19:13.6688316' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (173, N'benuser6', N'Updated credentials', CAST(N'2025-05-03T12:21:13.5791351' AS DateTime2), CAST(N'2025-05-03T12:21:13.5791441' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (174, N'benuser6', N'Updated credentials', CAST(N'2025-05-03T12:22:05.6151290' AS DateTime2), CAST(N'2025-05-03T12:22:05.6151418' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (175, N'benuser6', N'Updated credentials', CAST(N'2025-05-03T12:22:23.7888042' AS DateTime2), CAST(N'2025-05-03T12:22:23.7888163' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (176, N'benuser3', N'New Login', CAST(N'2025-05-03T12:23:13.7340577' AS DateTime2), CAST(N'2025-05-03T12:23:13.7340652' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (177, N'benuser3', N'Updated credentials', CAST(N'2025-05-03T12:24:28.9834822' AS DateTime2), CAST(N'2025-05-03T12:24:28.9834890' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (178, N'benuser3', N'Updated credentials', CAST(N'2025-05-03T12:25:52.7690847' AS DateTime2), CAST(N'2025-05-03T12:25:52.7690918' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (179, N'benuser3', N'New Login', CAST(N'2025-05-03T12:26:34.3795944' AS DateTime2), CAST(N'2025-05-03T12:26:34.3796012' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (180, N'imano', N'New Login', CAST(N'2025-05-03T12:27:55.5597819' AS DateTime2), CAST(N'2025-05-03T12:27:55.5597872' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (181, N'imano', N'Updated credentials', CAST(N'2025-05-03T12:30:10.7197166' AS DateTime2), CAST(N'2025-05-03T12:30:10.7197217' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (182, N'benuser5', N'New Login', CAST(N'2025-05-03T12:31:13.1983234' AS DateTime2), CAST(N'2025-05-03T12:31:13.1983290' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (183, N'benuser5', N'New Token Generated', CAST(N'2025-05-03T12:31:47.0536983' AS DateTime2), CAST(N'2025-05-03T12:31:47.0537025' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (184, N'benuser3', N'New Login', CAST(N'2025-05-03T14:43:01.9606119' AS DateTime2), CAST(N'2025-05-03T14:43:01.9606305' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (185, N'imano', N'New Login', CAST(N'2025-05-03T14:43:58.1830011' AS DateTime2), CAST(N'2025-05-03T14:43:58.1830047' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (186, N'benuser1', N'New Login', CAST(N'2025-05-03T16:29:35.4347907' AS DateTime2), CAST(N'2025-05-03T16:29:35.4348035' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (187, N'benuser2', N'New Login', CAST(N'2025-05-03T16:32:34.8279630' AS DateTime2), CAST(N'2025-05-03T16:32:34.8279712' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (188, N'benuser2', N'Updated credentials', CAST(N'2025-05-03T16:37:44.8031918' AS DateTime2), CAST(N'2025-05-03T16:37:44.8032004' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (189, N'benuser2', N'New Login', CAST(N'2025-05-03T16:41:49.1416315' AS DateTime2), CAST(N'2025-05-03T16:41:49.1416444' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (190, N'imano', N'New Login', CAST(N'2025-05-03T16:42:46.4356398' AS DateTime2), CAST(N'2025-05-03T16:42:46.4357290' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (191, N'imano', N'New Token Generated', CAST(N'2025-05-03T16:55:24.7368048' AS DateTime2), CAST(N'2025-05-03T16:55:24.7368087' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (192, N'imano', N'New Login', CAST(N'2025-05-03T18:12:41.5656487' AS DateTime2), CAST(N'2025-05-03T18:12:41.5656640' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (193, N'imano', N'New Token Generated', CAST(N'2025-05-03T18:13:26.4200837' AS DateTime2), CAST(N'2025-05-03T18:13:26.4200930' AS DateTime2), 1, 0)
INSERT [dbo].[Logs] ([Id], [UserName], [Description], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (194, N'imano', N'New Token Generated', CAST(N'2025-05-03T18:15:24.6158453' AS DateTime2), CAST(N'2025-05-03T18:15:24.6158508' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [SenderUserName], [ReceiverUserName], [Text], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (1, N'benuser3', N'benuser6', N'hi benuser6, didn''t you know me , it''s me benuser3', CAST(N'2025-04-24T16:42:03.1577845' AS DateTime2), CAST(N'2025-04-24T16:42:03.1582909' AS DateTime2), 1, 0)
INSERT [dbo].[Messages] ([Id], [SenderUserName], [ReceiverUserName], [Text], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (2, N'imano', N'benuser7', N'hi, this is your admin imano, user7 you are fired', CAST(N'2025-04-26T23:56:37.9407769' AS DateTime2), CAST(N'2025-04-26T23:56:37.9407802' AS DateTime2), 1, 0)
INSERT [dbo].[Messages] ([Id], [SenderUserName], [ReceiverUserName], [Text], [CreatedAt], [UpdatedAt], [IsActive], [IsDeleted]) VALUES (3, N'imano', N'benuser2', N'hi user2 it me imano', CAST(N'2025-04-27T00:09:19.3745698' AS DateTime2), CAST(N'2025-04-27T00:09:19.3745731' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'2f28a7cf-6b06-41f7-971f-7ea1bbf8a818', N'5d888c75-8abb-454f-aadd-742f49e470d6')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'2f7fca39-a9c9-4872-8136-e25e433f6b33', N'5d888c75-8abb-454f-aadd-742f49e470d6')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'1a7037a8-9f0a-4e24-9dde-5b8611c649ac', N'cfe419e1-2616-4a73-b73f-bb298e7a1d56')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'3e470ad5-61b2-463f-b0a1-bdca20d466af', N'cfe419e1-2616-4a73-b73f-bb298e7a1d56')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'7151edc1-b3a4-4cbd-ad37-68b7e4556972', N'cfe419e1-2616-4a73-b73f-bb298e7a1d56')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'7b6c0f9e-edbb-430b-8e83-e5f65c6e1f72', N'cfe419e1-2616-4a73-b73f-bb298e7a1d56')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'891dca66-5e26-416e-a128-e9a42302d601', N'cfe419e1-2616-4a73-b73f-bb298e7a1d56')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'45916c99-c21e-4437-ab38-7b8380d91e7a', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'4c6a71fd-823f-4e2f-94d5-47277b75e8db', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'5536c8ad-6a54-4dfd-8a78-0694d2a10380', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'7dd8d7e8-1a91-4de0-ba25-b4be7fc0e550', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'8bedbd91-2f55-4a3f-aa2f-e04d16de42c2', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'e63472ed-e3ee-437d-9637-f5e622f825f6', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'f3b8453e-e837-4603-ab90-b6fb29a533c9', N'f7a871a1-c0bf-4c5a-b747-2355c610d8bd')
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1a7037a8-9f0a-4e24-9dde-5b8611c649ac', N'user2', N'buser2', N'location of user2', CAST(N'2025-04-23T19:07:02.3035326' AS DateTime2), N'benuser2', N'BENUSER2', N'user2@example.com', N'USER2@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEOOjuiXGMWb6ZIMcmpF8ikNRooAcnfStHYabgCClMDLS01iUYEzDeB5I6y4dYVK24Q==', N'2XQ37DOUNQSIKLLQGJMXWFSKJDZJPJXA', N'7204de2f-5e72-4136-9812-03128c48a14a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f28a7cf-6b06-41f7-971f-7ea1bbf8a818', N'user11', N'ben user11', N'user11 location', CAST(N'2025-04-26T13:22:48.9498913' AS DateTime2), N'benuser11', N'BENUSER11', N'benuser11@gmail.com', N'BENUSER11@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKp5GBOp4/M+jYOfXQpXyJIRZwNLs/Ix+BZGFHGTF2IJAWq3tARMNMyDjJeC8DyE+w==', N'HC64ZV3FHFSIAQ2AECO4EK7TY3RCZ7OM', N'7d0cb1fb-61f4-49d3-92c1-5a69015df8bb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f7fca39-a9c9-4872-8136-e25e433f6b33', N'user8', N'ben user8', N'user8 address', CAST(N'2025-04-23T19:13:03.3755865' AS DateTime2), N'benuser8', N'BENUSER8', N'benuser8@gmail.com', N'BENUSER8@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEEN3l5kfjRydVrL//FxIhdsLtQBHwbCnWDyIEDqx5ae7g/tK7QqO9lPtH+BcF4SKuw==', N'2MSDWCEEI4L2M2YDV4NZPWJU72RPAVWW', N'99f47f6e-b462-4549-962f-bfce8b999845', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3e470ad5-61b2-463f-b0a1-bdca20d466af', N'user9', N'ben user9', N'user9 address', CAST(N'2025-04-23T19:13:13.7025383' AS DateTime2), N'benuser9', N'BENUSER9', N'benuser9@gmail.com', N'BENUSER9@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJ4V6ru9jfCT4Z+eIMZovvXjs4ciX7pSypmTtzumw988accTbChS0yahh0NY0x4bDQ==', N'X5NXL2PLUDINRRUFO65OHEL3HJDKMIY6', N'e037e8e6-45fd-41b2-a09c-fb8026750630', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'45916c99-c21e-4437-ab38-7b8380d91e7a', N'user3', N'ben user3', N'user3 location', CAST(N'2025-04-23T19:07:39.2324510' AS DateTime2), N'benuser3', N'BENUSER3', N'benuser3@outlook.com', N'BENUSER3@OUTLOOK.COM', 0, N'AQAAAAIAAYagAAAAEBzdIA6AM6S41cMNX+iWYVT0MaWVPffHju9VFYJm3K+AOOyWkKfUgrVfvwcKt6xhcw==', N'SGTWDCP5NWUZBZ2V5XGJVSPHMUJME5QX', N'959fd604-170b-4b7a-bd2a-64ea6aa68333', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4c6a71fd-823f-4e2f-94d5-47277b75e8db', N'user10', N'ben user10', N'user10 location', CAST(N'2025-04-24T00:14:19.2759481' AS DateTime2), N'benuser10', N'BENUSER10', N'benuser10@gmail.com', N'BENUSER10@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBXV46UpglayeWN34PyG31LoFSGFrppic1aJl2YljgmQrfFwJYZa8Fhtq74EETxQqg==', N'Y6N4QA2BTC6YLNUTAUJORMDIXQ34YLPP', N'f825faf0-f5e6-429c-8945-22eb323dc839', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5536c8ad-6a54-4dfd-8a78-0694d2a10380', N'user13', N'ben user13', N'user13 location', CAST(N'2025-05-01T19:56:00.3597287' AS DateTime2), N'benuser13', N'BENUSER13', N'benuser13@gmail.com', N'BENUSER13@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIg37yBSrHtfrGIM9ErxRn6Nte1xkh3hMqi6mEcusvcRRCib60dnfpX7BPZjWChKdQ==', N'WESE2444TZHC4CBBFJLN3U7PAJGXJ47E', N'fc36c949-89bf-4366-bb2d-c624333d6fe8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7151edc1-b3a4-4cbd-ad37-68b7e4556972', N'aemon', N'kazer', N'aemon location', CAST(N'2025-04-23T00:31:56.8831634' AS DateTime2), N'imano', N'IMANO', N'aemonkazer@outlook.com', N'AEMONKAZER@OUTLOOK.COM', 0, N'AQAAAAIAAYagAAAAEIaSqdpF86GAp3ra2pzhulT95I+g6DRRs8evyL5yP5SgeQ/pa4m8iNlLXGDDow/3xA==', N'UZZUMXBEPOIOIAV7F7UHGEIYYQO3QWBD', N'def29b9f-a667-4f1d-910d-9c296cb4ff98', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7b6c0f9e-edbb-430b-8e83-e5f65c6e1f72', N'user5', N'ben user5', N'user5 address', CAST(N'2025-04-23T19:12:22.7727813' AS DateTime2), N'benuser5', N'BENUSER5', N'benuser5@gmail.com', N'BENUSER5@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELu4BLZqTc1JLryZmuUivrIiJOxGMhEebvUIGbBkcO1psK2bFvOD7IgX3Q/gYa9sBg==', N'SHLE63TYHSFPQH7QFFP6JAQP557PYRKV', N'17debf39-1968-42ff-8863-86c8d3cca221', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7dd8d7e8-1a91-4de0-ba25-b4be7fc0e550', N'user7', N'ben user7', N'user7 address', CAST(N'2025-04-23T19:12:52.8204342' AS DateTime2), N'benuser7', N'BENUSER7', N'benuser7@gmail.com', N'BENUSER7@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEEtvJG3+9NndjP3bBeDIGfIPaP09UuDEMsJvPfDbLZjfEvnWm1V99RMNlB4ukCTPvw==', N'ETG3JPDRUMUYKVOPWO5P2A7UCSCPLRWG', N'614c58d9-b9f5-4481-a45b-147670a22e30', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'891dca66-5e26-416e-a128-e9a42302d601', N'user4', N'ben user4', N'user4 address', CAST(N'2025-04-23T19:11:27.0265942' AS DateTime2), N'benuser4', N'BENUSER4', N'benuser4@gmail.com', N'BENUSER4@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEFJlQyE6NLR1XvAZlOt9sdBAsext74RTPoLuzIw8xXORGI9RU0vppuaNI5z5U8KhNg==', N'BOFOHGMJAKBFRQZTOYE5POLK2Q7JD27O', N'39352c25-e276-4a75-a0cb-0992b11719fa', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8bedbd91-2f55-4a3f-aa2f-e04d16de42c2', N'user1', N'ben user1', N'user1 address', CAST(N'2025-04-23T19:06:11.2172517' AS DateTime2), N'benuser1', N'BENUSER1', N'benuser1@gmail.com', N'BENUSER1@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPFUxwdd3r8E1pvgtFummnQFEPPyx1HdereRM0SSYPTgTZ4WEvGjb30jvYVzt6468Q==', N'VMD5EPLFPIUEZ77OCYVJSGMEUJLDZLEZ', N'05a37c38-3a9e-4b30-a2ba-a3cde7421b6a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e63472ed-e3ee-437d-9637-f5e622f825f6', N'user12', N'ben user12', N'user12 location', CAST(N'2025-05-01T18:54:06.6031882' AS DateTime2), N'benuser12', N'BENUSER12', N'benuser12@gmail.com', N'BENUSER12@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAjqzhcrWjy1ZDVNnBcRc2NNd2+ZIXVbWtpxx6rnuv0GxQUUexR27E+aIzKXs4Gl5A==', N'FOXAJY3TRT7R2EIOKIWNSSO5QH7AUSCL', N'aae7556e-bf93-457c-a784-56ef90b4decd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Address], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f3b8453e-e837-4603-ab90-b6fb29a533c9', N'user6', N'ben user6', N'user6 location', CAST(N'2025-04-23T19:12:43.3084316' AS DateTime2), N'benuser6', N'BENUSER6', N'benuser6@outlook.com', N'BENUSER6@OUTLOOK.COM', 0, N'AQAAAAIAAYagAAAAEBTlkOxX5qhS9DPMlDOfREiNN5E3cLQ/8OFsSGbG8HF7VMYbi+85bQZqAIrqImK12A==', N'6TH5ZA7QLLQLAC7JJMBG5CYCFMF77MYM', N'9c7b6015-a29d-4a87-a067-2dd68485aaf4', NULL, 0, 0, NULL, 1, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/3/2025 6:44:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
ALTER DATABASE [AssetManagementFullStackDB] SET  READ_WRITE 
GO

/****** Object:  Table [dbo].[Permissions]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](500) NULL,
    [Module] [nvarchar](100) NOT NULL,
    [Action] [nvarchar](50) NOT NULL,
    [CreatedAt] [datetime2](7) NOT NULL DEFAULT GETDATE(),
    [UpdatedAt] [datetime2](7) NOT NULL DEFAULT GETDATE(),
    [IsActive] [bit] NOT NULL DEFAULT 1,
    CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RolePermissions]    Script Date: 5/3/2025 6:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [RoleId] [nvarchar](450) NOT NULL,
    [PermissionId] [int] NOT NULL,
    [CreatedAt] [datetime2](7) NOT NULL DEFAULT GETDATE(),
    [UpdatedAt] [datetime2](7) NOT NULL DEFAULT GETDATE(),
    [IsActive] [bit] NOT NULL DEFAULT 1,
    CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id]),
    CONSTRAINT [FK_RolePermissions_Permissions] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permissions] ([Id])
) ON [PRIMARY]
GO

-- Insertion des permissions de base
INSERT INTO [dbo].[Permissions] (Name, Description, Module, Action)
VALUES 
('View Assets', 'Can view asset list and details', 'Asset', 'View'),
('Create Assets', 'Can create new assets', 'Asset', 'Create'),
('Edit Assets', 'Can edit existing assets', 'Asset', 'Edit'),
('Delete Assets', 'Can delete assets', 'Asset', 'Delete'),
('View Categories', 'Can view category list and details', 'Category', 'View'),
('Create Categories', 'Can create new categories', 'Category', 'Create'),
('Edit Categories', 'Can edit existing categories', 'Category', 'Edit'),
('Delete Categories', 'Can delete categories', 'Category', 'Delete'),
('View Users', 'Can view user list and details', 'User', 'View'),
('Create Users', 'Can create new users', 'User', 'Create'),
('Edit Users', 'Can edit existing users', 'User', 'Edit'),
('Delete Users', 'Can delete users', 'User', 'Delete'),
('Manage Roles', 'Can manage roles and permissions', 'Role', 'Manage'),
('View Reports', 'Can view reports', 'Report', 'View'),
('Generate Reports', 'Can generate new reports', 'Report', 'Generate'),
('View Maintenance', 'Can view maintenance records', 'Maintenance', 'View'),
('Create Maintenance', 'Can create maintenance records', 'Maintenance', 'Create'),
('Edit Maintenance', 'Can edit maintenance records', 'Maintenance', 'Edit'),
('Delete Maintenance', 'Can delete maintenance records', 'Maintenance', 'Delete');
