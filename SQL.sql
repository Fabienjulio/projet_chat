#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
drop database plateforme_talky;
CREATE DATABASE plateforme_talky;
USE plateforme_talky;
#------------------------------------------------------------
# Table: utilisateur
#------------------------------------------------------------

CREATE TABLE utilisateur(
        id_utilisateur     INT Auto_Increment ,
        prenom_utilisateur Varchar (100) NULL,
        nom_utilisateur    Varchar (50) NOT NULL ,
        sexe               Char (5) NOT NULL ,
        pseudo_utilisateur Varchar (20) ,
        ville              Varchar (50) NOT NULL ,
        mot_de_passe       Varchar (255) NOT NULL ,
        email              Varchar (50) NOT NULL ,
        telephone          Int NOT NULL ,
        statut             Varchar (10) NOT NULL,
        lien_photo_de_profil Varchar(500),
		PRIMARY KEY (id_utilisateur),
	CONSTRAINT pseudo
		UNIQUE(pseudo_utilisateur),
	CONSTRAINT utilisateur_photo_de_profil0_AK 
		UNIQUE (lien_photo_de_profil)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: groupe
#------------------------------------------------------------

CREATE TABLE groupe(
        id_groupe  Int  Auto_increment  NOT NULL,
        nom_groupe Varchar (50) NOT NULL,
		PRIMARY KEY (id_groupe)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: être_membre
#------------------------------------------------------------

CREATE TABLE etre_membre(
        id_groupe      Int NOT NULL ,
        id_utilisateur INT NOT NULL,

    CONSTRAINT etre_membre_groupe0_FK
		FOREIGN KEY (id_groupe)
		REFERENCES groupe(id_groupe),

	CONSTRAINT etre_membre_utilisateur1_FK
		FOREIGN KEY (id_utilisateur)
		REFERENCES utilisateur(id_utilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: message
#------------------------------------------------------------

CREATE TABLE message(
        id_message     Int  Auto_increment  NOT NULL ,
        date_envoi     datetime NOT NULL ,
        id_expediteur    int  NOT NULL ,
        id_destinataire   int  NOT NULL ,
    	PRIMARY KEY (id_message),
    CONSTRAINT message_utilisateur0_FK
		FOREIGN KEY (id_expediteur)
		REFERENCES utilisateur(id_utilisateur),
	CONSTRAINT message_utilisateur1_FK
		FOREIGN KEY (id_destinataire)
		REFERENCES utilisateur(id_utilisateur)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: contenu
#------------------------------------------------------------

CREATE TABLE contenu(
        id_contenu   	  INT  Auto_increment  NOT NULL ,
        id_message   	  INT NOT NULL,
        text_message 	  TEXT NULL,
        type              Varchar (10) NOT NULL,
        nom_piece_jointe  Varchar (50)  NULL,
        lien_piece_jointe Varchar (500)  NULL,
    	PRIMARY KEY (id_contenu),
	CONSTRAINT pj_FK 
		FOREIGN KEY (id_message) 
		REFERENCES message(id_message)
)ENGINE=InnoDB;
