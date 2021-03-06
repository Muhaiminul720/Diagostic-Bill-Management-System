
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 1/11/2017 9:51:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_name] [varchar](50) NULL,
	[date_of_birth] [datetime] NULL,
	[bill_no] [varchar](50) NULL,
	[mobile] [varchar](11) NULL,
	[paymentStatus] [bit] NULL,
	[created_at] [datetime] NULL,
	[dueAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientTest]    Script Date: 1/11/2017 9:51:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientTest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientID] [int] NULL,
	[testSetupID] [int] NULL,
	[billNo] [varchar](10) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestSetup]    Script Date: 1/11/2017 9:51:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestSetup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[testname] [varchar](150) NOT NULL,
	[fee] [decimal](12, 2) NOT NULL,
	[type_id] [int] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestType]    Script Date: 1/11/2017 9:51:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TestSetup_View]    Script Date: 1/11/2017 9:51:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TestSetup_View] AS
SELECT testname, fee, name FROM TestType tt, TestSetup ts
WHERE tt.id = ts.type_id
GO
ALTER TABLE [dbo].[PatientTest]  WITH CHECK ADD FOREIGN KEY([patientID])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[PatientTest]  WITH CHECK ADD FOREIGN KEY([testSetupID])
REFERENCES [dbo].[TestSetup] ([id])
GO
ALTER TABLE [dbo].[TestSetup]  WITH CHECK ADD  CONSTRAINT [fk_TestType] FOREIGN KEY([type_id])
REFERENCES [dbo].[TestType] ([id])
GO
ALTER TABLE [dbo].[TestSetup] CHECK CONSTRAINT [fk_TestType]
GO
USE [DiagnosisAppDB]
GO
ALTER DATABASE [DiagnosisAppDB] SET  READ_WRITE 
GO
