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
