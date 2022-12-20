USE [master]
GO
/****** Object:  Database [Абоненты]    Script Date: 20.12.2022 9:54:00 ******/
CREATE DATABASE [Абоненты]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Абоненты] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты', N'ON'
GO
ALTER DATABASE [Абоненты] SET QUERY_STORE = OFF
GO
USE [Абоненты]
GO
/****** Object:  Table [dbo].[Абоненты]    Script Date: 20.12.2022 9:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абоненты](
	[id_Абонента] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговоры]    Script Date: 20.12.2022 9:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговоры](
	[id_Разговоры] [int] NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Дата_разговора] [date] NOT NULL,
	[Продолжительность] [time](7) NULL,
	[Статус_оплаты] [nvarchar](50) NULL,
	[id_Телефона_Абонента] [int] NULL,
	[id_Тарифа] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Разговоры] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефоны_Абонентов]    Script Date: 20.12.2022 9:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефоны_Абонентов](
	[id_Телефона_Абонента] [int] NOT NULL,
	[Номер_Договора] [int] NOT NULL,
	[Дата_Установки] [date] NOT NULL,
	[id_Абонента] [int] NULL,
	[Номер] [nvarchar](50) NULL,
 CONSTRAINT [PK__Телефоны__A47AF84E554753A1] PRIMARY KEY CLUSTERED 
(
	[id_Телефона_Абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Представление_Конструктор]    Script Date: 20.12.2022 9:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Представление_Конструктор]
AS
SELECT        dbo.Телефоны_Абонентов.Номер, dbo.Абоненты.Фамилия, dbo.Абоненты.Имя, dbo.Абоненты.Отчество, dbo.Разговоры.id_Разговоры, dbo.Разговоры.id_Телефона_Абонента, 
                         dbo.Телефоны_Абонентов.id_Телефона_Абонента AS Expr1, dbo.Разговоры.id_Телефона_Абонента AS Expr2, dbo.Телефоны_Абонентов.id_Абонента, dbo.Абоненты.id_Абонента AS Expr3
FROM            dbo.Телефоны_Абонентов INNER JOIN
                         dbo.Разговоры ON dbo.Телефоны_Абонентов.id_Телефона_Абонента = dbo.Разговоры.id_Телефона_Абонента INNER JOIN
                         dbo.Абоненты ON dbo.Телефоны_Абонентов.id_Абонента = dbo.Абоненты.id_Абонента
GO
/****** Object:  Table [dbo].[Тарифы]    Script Date: 20.12.2022 9:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тарифы](
	[id_Тарифа] [int] NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Тариф] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Тарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Абоненты] ([id_Абонента], [Фамилия], [Имя], [Отчество], [Адрес]) VALUES (1, N'Орлов', N'Сергей', N'Борисович', N'Мира 54,4')
INSERT [dbo].[Абоненты] ([id_Абонента], [Фамилия], [Имя], [Отчество], [Адрес]) VALUES (3, N'Вавилов', N'Сергей', N'Борисович', N'пр.Маркса 34,23')
INSERT [dbo].[Абоненты] ([id_Абонента], [Фамилия], [Имя], [Отчество], [Адрес]) VALUES (4, N'Титова', N'Александра', N'Ивановна', N'Ленина 5,24')
GO
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (1, N'Омск', CAST(N'2021-03-02' AS Date), CAST(N'00:12:00' AS Time), N'Не оплачено', 4, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (2, N'Новосибирск', CAST(N'2021-03-02' AS Date), CAST(N'00:02:00' AS Time), N'Оплачено', 2, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (3, N'Воронеж', CAST(N'2021-03-08' AS Date), CAST(N'00:15:00' AS Time), N'Оплачено', 3, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (4, N'Воронеж', CAST(N'2021-03-08' AS Date), CAST(N'00:05:00' AS Time), N'Оплачено', 1, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (5, N'Санкт-Петербург', CAST(N'2021-03-15' AS Date), CAST(N'00:10:00' AS Time), N'Оплачено', 4, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (6, N'Омск', CAST(N'2021-03-15' AS Date), CAST(N'00:01:00' AS Time), N'Не оплачено', 3, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (7, N'Омск', CAST(N'2021-03-15' AS Date), CAST(N'00:10:00' AS Time), N'не оплачено', 1, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (8, N'Москва', CAST(N'2021-03-15' AS Date), CAST(N'00:01:00' AS Time), N'Оплачено', 2, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (10, N'Воронеж', CAST(N'2021-04-01' AS Date), CAST(N'00:03:00' AS Time), N'Не оплачено', 4, NULL)
INSERT [dbo].[Разговоры] ([id_Разговоры], [Город], [Дата_разговора], [Продолжительность], [Статус_оплаты], [id_Телефона_Абонента], [id_Тарифа]) VALUES (11, N'Воронеж', CAST(N'2021-04-01' AS Date), CAST(N'00:03:00' AS Time), N'Оплачено', 2, NULL)
GO
INSERT [dbo].[Тарифы] ([id_Тарифа], [Город], [Тариф]) VALUES (1, N'Омск', 10.0000)
INSERT [dbo].[Тарифы] ([id_Тарифа], [Город], [Тариф]) VALUES (2, N'Москва', 30.0000)
INSERT [dbo].[Тарифы] ([id_Тарифа], [Город], [Тариф]) VALUES (3, N'Воронеж', 20.0000)
INSERT [dbo].[Тарифы] ([id_Тарифа], [Город], [Тариф]) VALUES (4, N'Новосибирск', 10.0000)
INSERT [dbo].[Тарифы] ([id_Тарифа], [Город], [Тариф]) VALUES (5, N'Санкт-Петербург', 30.0000)
GO
INSERT [dbo].[Телефоны_Абонентов] ([id_Телефона_Абонента], [Номер_Договора], [Дата_Установки], [id_Абонента], [Номер]) VALUES (1, 3465, CAST(N'2012-10-09' AS Date), 4, N'(3812)333490   ')
INSERT [dbo].[Телефоны_Абонентов] ([id_Телефона_Абонента], [Номер_Договора], [Дата_Установки], [id_Абонента], [Номер]) VALUES (2, 3466, CAST(N'2012-10-09' AS Date), 4, N'(3812)951211   ')
INSERT [dbo].[Телефоны_Абонентов] ([id_Телефона_Абонента], [Номер_Договора], [Дата_Установки], [id_Абонента], [Номер]) VALUES (3, 4523, CAST(N'2004-08-04' AS Date), 1, N'(3812)531178')
INSERT [dbo].[Телефоны_Абонентов] ([id_Телефона_Абонента], [Номер_Договора], [Дата_Установки], [id_Абонента], [Номер]) VALUES (4, 2378, CAST(N'2004-08-04' AS Date), 1, N' (3812)326789      ')
INSERT [dbo].[Телефоны_Абонентов] ([id_Телефона_Абонента], [Номер_Договора], [Дата_Установки], [id_Абонента], [Номер]) VALUES (5, 99345, CAST(N'2013-01-01' AS Date), 3, N'(3812)953412   ')
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Тарифы] FOREIGN KEY([id_Тарифа])
REFERENCES [dbo].[Тарифы] ([id_Тарифа])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Тарифы]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Телефоны_Абонентов] FOREIGN KEY([id_Телефона_Абонента])
REFERENCES [dbo].[Телефоны_Абонентов] ([id_Телефона_Абонента])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Телефоны_Абонентов]
GO
ALTER TABLE [dbo].[Телефоны_Абонентов]  WITH CHECK ADD  CONSTRAINT [FK_Телефоны_Абонентов_Абоненты] FOREIGN KEY([id_Абонента])
REFERENCES [dbo].[Абоненты] ([id_Абонента])
GO
ALTER TABLE [dbo].[Телефоны_Абонентов] CHECK CONSTRAINT [FK_Телефоны_Абонентов_Абоненты]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Телефоны_Абонентов"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Разговоры"
            Begin Extent = 
               Top = 6
               Left = 293
               Bottom = 136
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Абоненты"
            Begin Extent = 
               Top = 6
               Left = 548
               Bottom = 136
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Представление_Конструктор'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Представление_Конструктор'
GO
USE [master]
GO
ALTER DATABASE [Абоненты] SET  READ_WRITE 
GO
