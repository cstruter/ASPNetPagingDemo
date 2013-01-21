SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friends](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_friends] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO friends(firstname, lastname) VALUES ('Julie', 'Truter')
INSERT INTO friends(firstname, lastname) VALUES ('Eugene', 'Stander')
INSERT INTO friends(firstname, lastname) VALUES ('Pam', 'Nizar')
INSERT INTO friends(firstname, lastname) VALUES ('Alexander', 'Mehlhorn')
INSERT INTO friends(firstname, lastname) VALUES ('Roland', 'Cooper')
INSERT INTO friends(firstname, lastname) VALUES ('Loren', 'Stevens')
INSERT INTO friends(firstname, lastname) VALUES ('Edward', 'Anderson')
INSERT INTO friends(firstname, lastname) VALUES ('Wayne', 'Kleynhans')

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFriends]
	@maximumRows AS INT, 
	@startRowIndex AS INT
AS
BEGIN
	WITH entries AS 
	( 
		SELECT ROW_NUMBER() OVER (ORDER BY id ASC) AS ROW, id, firstname, lastname
		FROM friends
	)
 
	SELECT firstname, lastname
	FROM entries 
	WHERE ROW BETWEEN 
		@startRowIndex+1 AND (@startRowIndex + @maximumRows)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountFriends]
AS
BEGIN
	SELECT COUNT(*) FROM friends
END