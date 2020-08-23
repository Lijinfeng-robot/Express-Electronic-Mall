CREATE TABLE [dbo].[tb_User] (
 [UserId] int IDENTITY(1,1) NOT NULL,
 [Email] nvarchar(max) NOT NULL,
 [Password] nvarchar(max) NOT NULL,
 [Type] int Not NULL,
PRIMARY KEY (UserId)
);
GO

CREATE TABLE [dbo].[tb_Brunch] (
 [BrunchId] int IDENTITY(1,1) NOT NULL,
 [Name] nvarchar(max) NOT NULL,
 [Address] nvarchar(max) NOT NULL,
 [CostForTwo] int Not NULL,
 [Hours] nvarchar(max) NOT NULL,
 [AverRating] int ,
PRIMARY KEY ([BrunchId])
);
GO

CREATE TABLE [dbo].[tb_Rating] (
 [RatingId] int IDENTITY(1,1) NOT NULL,
 [BrunchId] int NOT NULL,
 [UserId] int NOT NULL,
 [Rating] int Not NULL,
 [Comment] nvarchar(max) NOT NULL,
 [RatingDate] date NOT NULL,
PRIMARY KEY ([RatingId]),
FOREIGN KEY (BrunchId) REFERENCES tb_Brunch(BrunchId),
FOREIGN KEY (UserId) REFERENCES tb_User(UserId)
);
GO

