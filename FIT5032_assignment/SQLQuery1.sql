CREATE TABLE [dbo].[tb_User] (
 [UserId] int IDENTITY(1,1) NOT NULL,
 [Email] nvarchar(max) NOT NULL,
 [Password] nvarchar(max) NOT NULL,
 [Type] int Not NULL,
PRIMARY KEY (UserId)
);
GO