
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/11/2019 20:50:28
-- Generated from EDMX file: C:\Users\Jessie\source\repos\FIT5032_assignment\FIT5032_assignment\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Assignment_db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__tb_Rating__Brunc__2A4B4B5E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tb_Rating] DROP CONSTRAINT [FK__tb_Rating__Brunc__2A4B4B5E];
GO
IF OBJECT_ID(N'[dbo].[FK__tb_Rating__UserI__2B3F6F97]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tb_Rating] DROP CONSTRAINT [FK__tb_Rating__UserI__2B3F6F97];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tb_Brunch]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tb_Brunch];
GO
IF OBJECT_ID(N'[dbo].[tb_Rating]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tb_Rating];
GO
IF OBJECT_ID(N'[dbo].[tb_User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tb_User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tb_Brunch'
CREATE TABLE [dbo].[tb_Brunch] (
    [BrunchId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [CostForTwo] int  NOT NULL,
    [Hours] nvarchar(max)  NOT NULL,
    [AverRating] int  NULL
);
GO

-- Creating table 'tb_Rating'
CREATE TABLE [dbo].[tb_Rating] (
    [RatingId] int IDENTITY(1,1) NOT NULL,
    [BrunchId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Rating] int  NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [RatingDate] datetime  NOT NULL
);
GO

-- Creating table 'tb_User'
CREATE TABLE [dbo].[tb_User] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Type] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BrunchId] in table 'tb_Brunch'
ALTER TABLE [dbo].[tb_Brunch]
ADD CONSTRAINT [PK_tb_Brunch]
    PRIMARY KEY CLUSTERED ([BrunchId] ASC);
GO

-- Creating primary key on [RatingId] in table 'tb_Rating'
ALTER TABLE [dbo].[tb_Rating]
ADD CONSTRAINT [PK_tb_Rating]
    PRIMARY KEY CLUSTERED ([RatingId] ASC);
GO

-- Creating primary key on [UserId] in table 'tb_User'
ALTER TABLE [dbo].[tb_User]
ADD CONSTRAINT [PK_tb_User]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BrunchId] in table 'tb_Rating'
ALTER TABLE [dbo].[tb_Rating]
ADD CONSTRAINT [FK__tb_Rating__Brunc__2A4B4B5E]
    FOREIGN KEY ([BrunchId])
    REFERENCES [dbo].[tb_Brunch]
        ([BrunchId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tb_Rating__Brunc__2A4B4B5E'
CREATE INDEX [IX_FK__tb_Rating__Brunc__2A4B4B5E]
ON [dbo].[tb_Rating]
    ([BrunchId]);
GO

-- Creating foreign key on [UserId] in table 'tb_Rating'
ALTER TABLE [dbo].[tb_Rating]
ADD CONSTRAINT [FK__tb_Rating__UserI__2B3F6F97]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[tb_User]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tb_Rating__UserI__2B3F6F97'
CREATE INDEX [IX_FK__tb_Rating__UserI__2B3F6F97]
ON [dbo].[tb_Rating]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------