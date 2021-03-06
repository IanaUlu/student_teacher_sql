USE [master]
GO
/****** Object:  Database [student_teacher_relation]     ******/
CREATE DATABASE [student_teacher_relation]
GO
ALTER DATABASE [student_teacher_relation] SET COMPATIBILITY_LEVEL = 120
GO

ALTER DATABASE [student_teacher_relation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [student_teacher_relation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [student_teacher_relation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [student_teacher_relation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [student_teacher_relation] SET ARITHABORT OFF 
GO
ALTER DATABASE [student_teacher_relation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [student_teacher_relation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [student_teacher_relation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [student_teacher_relation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [student_teacher_relation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [student_teacher_relation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [student_teacher_relation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [student_teacher_relation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [student_teacher_relation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [student_teacher_relation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [student_teacher_relation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [student_teacher_relation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [student_teacher_relation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [student_teacher_relation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [student_teacher_relation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [student_teacher_relation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [student_teacher_relation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [student_teacher_relation] SET RECOVERY FULL 
GO
ALTER DATABASE [student_teacher_relation] SET  MULTI_USER 
GO
ALTER DATABASE [student_teacher_relation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [student_teacher_relation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [student_teacher_relation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [student_teacher_relation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [student_teacher_relation] SET DELAYED_DURABILITY = DISABLED 
GO
USE [student_teacher_relation]
GO
/****** Object:  Table [dbo].[Class]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [char](10) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[relation]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relation](
	[relation_ID] [int] IDENTITY(1,1) NOT NULL,
	[s_ID] [int] NOT NULL,
	[t_ID] [int] NOT NULL,
 CONSTRAINT [PK_relation] PRIMARY KEY CLUSTERED 
(
	[relation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[s_ID] [int] IDENTITY(1,1) NOT NULL,
	[studentName] [nvarchar](50) NOT NULL,
	[studentLastName] [nvarchar](50) NOT NULL,
	[studentGender] [char](1) NOT NULL,
	[studentClass] [int] NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[s_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subject]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subjectID] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teacher]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[t_ID] [int] IDENTITY(1,1) NOT NULL,
	[teacherName] [nvarchar](50) NOT NULL,
	[teacherLastName] [nvarchar](50) NOT NULL,
	[teacherGender] [nvarchar](1) NOT NULL,
	[teacherSubject] [int] NOT NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[t_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[studentToTeacher]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[studentToTeacher]
AS
SELECT        dbo.student.studentName, dbo.teacher.teacherName, dbo.teacher.teacherLastName, dbo.subject.subjectName
FROM            dbo.relation INNER JOIN
                         dbo.student ON dbo.relation.s_ID = dbo.student.s_ID INNER JOIN
                         dbo.teacher ON dbo.relation.t_ID = dbo.teacher.t_ID INNER JOIN
                         dbo.subject ON dbo.teacher.teacherSubject = dbo.subject.subjectID
WHERE        (dbo.student.studentName = N'George')

GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([classID], [className]) VALUES (1, N'Class_1   ')
INSERT [dbo].[Class] ([classID], [className]) VALUES (2, N'class_2   ')
INSERT [dbo].[Class] ([classID], [className]) VALUES (3, N'class_3   ')
INSERT [dbo].[Class] ([classID], [className]) VALUES (4, N'class_4   ')
INSERT [dbo].[Class] ([classID], [className]) VALUES (5, N'class_5   ')
INSERT [dbo].[Class] ([classID], [className]) VALUES (6, N'Georg_Clas')
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[relation] ON 

INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (1, 21, 6)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (2, 21, 1)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (3, 21, 2)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (4, 20, 7)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (5, 20, 9)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (6, 20, 12)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (7, 20, 15)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (11, 24, 15)
INSERT [dbo].[relation] ([relation_ID], [s_ID], [t_ID]) VALUES (12, 24, 1)
SET IDENTITY_INSERT [dbo].[relation] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (1, N'student_1', N'studentLastName_1', N'M', 1)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (2, N'student_2', N'studentLastName_2', N'M', 1)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (3, N'student_3', N'studentLastName_3', N'M', 5)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (4, N'student_4', N'studentLastName_4', N'M', 2)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (5, N'student_5', N'studentLastName_5', N'F', 2)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (6, N'student_6', N'studentLastName_6', N'F', 4)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (7, N'student_7', N'studentLastName_7', N'F', 4)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (8, N'student_8', N'studentLastName_8', N'M', 6)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (9, N'student_9', N'studentLastName_9', N'M', 5)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (10, N'student_10', N'studentLastName_10', N'M', 1)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (11, N'student_11', N'studentLastName_11', N'F', 3)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (12, N'student_12', N'studentLastName_12', N'F', 3)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (13, N'student_13', N'studentLastName_13', N'M', 6)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (14, N'student_14', N'studentLastName_14', N'M', 1)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (15, N'student_15', N'studentLastName_15', N'F', 4)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (16, N'student_16', N'studentLastName_16', N'M', 4)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (17, N'student_17', N'studentLastName_17', N'F', 1)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (18, N'student_18', N'studentLastName_18', N'F', 6)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (19, N'student_19', N'studentLastName_19', N'F', 1)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (20, N'George', N'GeorgeLatsname', N'M', 6)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (21, N'Iana', N'Bogdonova', N'F', 6)
INSERT [dbo].[student] ([s_ID], [studentName], [studentLastName], [studentGender], [studentClass]) VALUES (24, N'serdar', N'ulu', N'M', 6)
SET IDENTITY_INSERT [dbo].[student] OFF
SET IDENTITY_INSERT [dbo].[subject] ON 

INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (1, N'English')
INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (2, N'Math')
INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (3, N'Science')
INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (4, N'Music')
INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (5, N'Technology/Computer')
SET IDENTITY_INSERT [dbo].[subject] OFF
SET IDENTITY_INSERT [dbo].[teacher] ON 

INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (1, N'teacher_1', N'teacherLastname_1', N'M', 1)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (2, N'teacher_2', N'teacherLastname_2', N'F', 1)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (3, N'teacher_3', N'teacherLastname_3', N'F', 5)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (4, N'teacher_4', N'teacherLastname_4', N'F', 2)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (5, N'teacher_5', N'teacherLastname_5', N'M', 2)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (6, N'teacher_6', N'teacherLastname_6', N'M', 4)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (7, N'teacher_7', N'teacherLastname_7', N'M', 4)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (8, N'teacher_8', N'teacherLastname_8', N'F', 5)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (9, N'teacher_9', N'teacherLastname_9', N'F', 5)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (10, N'teacher_10', N'teacherLastname_10', N'M', 1)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (11, N'teacher_11', N'teacherLastname_11', N'M', 3)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (12, N'teacher_12', N'teacherLastname_12', N'F', 3)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (13, N'teacher_13', N'teacherLastname_13', N'F', 5)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (14, N'teacher_14', N'teacherLastname_14', N'M', 1)
INSERT [dbo].[teacher] ([t_ID], [teacherName], [teacherLastName], [teacherGender], [teacherSubject]) VALUES (15, N'teacher_15', N'teacherLastname_15', N'M', 4)
SET IDENTITY_INSERT [dbo].[teacher] OFF
ALTER TABLE [dbo].[relation]  WITH CHECK ADD  CONSTRAINT [FK_relation_student] FOREIGN KEY([s_ID])
REFERENCES [dbo].[student] ([s_ID])
GO
ALTER TABLE [dbo].[relation] CHECK CONSTRAINT [FK_relation_student]
GO
ALTER TABLE [dbo].[relation]  WITH CHECK ADD  CONSTRAINT [FK_relation_teacher] FOREIGN KEY([t_ID])
REFERENCES [dbo].[teacher] ([t_ID])
GO
ALTER TABLE [dbo].[relation] CHECK CONSTRAINT [FK_relation_teacher]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_Class] FOREIGN KEY([studentClass])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_Class]
GO
ALTER TABLE [dbo].[teacher]  WITH CHECK ADD  CONSTRAINT [FK_teacher_subject] FOREIGN KEY([teacherSubject])
REFERENCES [dbo].[subject] ([subjectID])
GO
ALTER TABLE [dbo].[teacher] CHECK CONSTRAINT [FK_teacher_subject]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[8] 3) )"
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
         Begin Table = "relation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "student"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "teacher"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 256
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "subject"
            Begin Extent = 
               Top = 6
               Left = 685
               Bottom = 198
               Right = 855
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3180
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3510
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
   En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentToTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentToTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentToTeacher'
GO
USE [master]
GO
ALTER DATABASE [student_teacher_relation] SET  READ_WRITE 
GO
