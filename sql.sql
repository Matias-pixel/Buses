CREATE TABLE estadoUsuario(
    id int AUTO_INCREMENT  PRIMARY KEY,
    nombre varchar(50)
);

CREATE TABLE estadoTipoUsuario(
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50)
);
CREATE TABLE estadoAsiento(
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50)
);



CREATE TABLE tipoUsuario(
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    estado_tipoUsuario_id_fk int,

    FOREIGN KEY (estado_tipoUsuario_id_fk) REFERENCES estadoTipoUsuario(id)

);

CREATE TABLE usuario(
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    correo varchar(50),
    pass varchar(50),
    estado_usuario_id_fk int,
    tipo_usuario_id_fk int,

    FOREIGN KEY (tipo_usuario_id_fk) REFERENCES tipoUsuario(id),
    FOREIGN KEY (estado_usuario_id_fk) REFERENCES estadoUsuario(id)
);

CREATE TABLE asiento(
    id int AUTO_INCREMENT PRIMARY KEY,
    numero varchar (100),
    estado_asiento_id_fk int,
    usuario_id_fk int,
    FOREIGN KEY(usuario_id_fk) REFERENCES usuario(id),
    FOREIGN KEY(estado_asiento_id_fk) REFERENCES estadoAsiento(id)
);



INSERT INTO estadoUsuario VALUES(null, 'habilitada');
INSERT INTO estadoUsuario VALUES(null, 'deshabilitada');

INSERT INTO estadoAsiento VALUES(null, 'habilitada');
INSERT INTO estadoAsiento VALUES(null, 'deshabilitada');

INSERT INTO estadoTipoUsuario VALUES(null, 'habilitada');
INSERT INTO estadoTipoUsuario VALUES(null, 'deshabilitada');

INSERT INTO tipoUsuario VALUES(null, 'super admin',1);
INSERT INTO tipoUsuario VALUES(null, 'admin',1);
INSERT INTO tipoUsuario VALUES(null, 'cliente',1);

INSERT INTO usuario VALUES(null, 'Matias', 'matias@gmail.com', '123',1,1);
INSERT INTO usuario VALUES(null, 'Gaston', 'gaston@gmail.com', '123',1,2);
INSERT INTO usuario VALUES(null, 'Esteban', 'esteban@gmail.com', '123',1,3);

INSERT INTO asiento VALUES(null, 'A1',1,3);
INSERT INTO asiento VALUES(null, 'A2',1,3);
INSERT INTO asiento VALUES(null, 'B1',1,3);
INSERT INTO asiento VALUES(null, 'B2',1,3);



SELECT usuario.nombre, asiento.numero 
FROM usuario
INNER JOIN asiento ON asiento.usuario_id_fk = usuario.id
WHERE usuario.nombre = 'Esteban'
