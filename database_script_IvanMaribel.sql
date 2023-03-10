-- Usuarios
CREATE TABLE Usuario (
    id_usr INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_usr PRIMARY KEY CLUSTERED (id_usr),
    -- Table attributes
    username VARCHAR (40) NOT NULL,
    email VARCHAR (50) NOT NULL,
    passwd VARCHAR (50) NOT NULL
);

-- Datos Persona
CREATE TABLE Datos_Persona (
    id_datos_persona INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_datos_persona PRIMARY KEY CLUSTERED (id_datos_persona),
    -- Table attributes
    nombre VARCHAR(50),
    apellido_p VARCHAR(50),
    apellido_m VARCHAR(50),
    foto BIT,
    persona_2040 VARCHAR(5),
    fecha_nacimiento DATE,
    sexo BIT,
    telefono VARCHAR(20),
    estatus_acomp VARCHAR(20),
    seguro_medico VARCHAR(20),
);

-- Registros
CREATE TABLE Registro (
    id_registro INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_registro PRIMARY KEY CLUSTERED (id_registro),
    -- Table attributes
    id_usr INT NOT NULL,
    id_datos_persona INT NOT NULL,
    fecha DATE NOT NULL,
    -- Foreign keys
    CONSTRAINT FK_usuario FOREIGN KEY (id_usr) REFERENCES dbo.Usuario(id_usr),
    CONSTRAINT FK_datos_persona FOREIGN KEY (id_datos_persona) REFERENCES dbo.Datos_Persona(id_datos_persona)
)

-- Niño
CREATE TABLE Menor (
    id_menor INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_menor PRIMARY KEY CLUSTERED (id_menor),
    -- Table attributes
    id_datos_persona INT NOT NULL,
    curp VARCHAR(18),
    canal_difusion_plan VARCHAR(100),
    responsable VARCHAR(50),
    fecha_bautizo DATE,
    fecha_tentativa_nacimiento BIT,
    acompanante VARCHAR(50),
    bautizo BIT
    -- Foreign keys
    CONSTRAINT FK_datos_menor FOREIGN KEY (id_datos_persona) REFERENCES dbo.Datos_Persona(id_datos_persona)
);

-- Ubicación
CREATE TABLE Ubicacion (
    id_ubicacion INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_ubicacion PRIMARY KEY CLUSTERED (id_ubicacion),
    -- Table attributes
    id_menor INT NOT NULL,
    estado VARCHAR(50),
    municipio VARCHAR(50),
    localidad VARCHAR(50),
    colonia VARCHAR(50),
    calle VARCHAR(50),
    num_exterior VARCHAR(20),
    num_interior VARCHAR(20),
    cp VARCHAR(10),
    entre_calles VARCHAR(100),
    referencias VARCHAR(200),
    -- Foreign keys
    CONSTRAINT FK_menor_ubi FOREIGN KEY (id_menor) REFERENCES dbo.Menor(id_menor)
);

-- Familia
CREATE TABLE Familia (
    id_familia INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_familia PRIMARY KEY CLUSTERED (id_familia),
    -- Table attributes
    id_menor INT NOT NULL,
    estado_civ_padres VARCHAR(20),
    casa VARCHAR(50),
    num_hermanos INT,
    regis_civil BIT,
    foto_acta_nac BIT,
    fam_confianza BIT,
    -- Foreign keys
    CONSTRAINT FK_menor_fam FOREIGN KEY (id_menor) REFERENCES dbo.Menor(id_menor)
);

-- Salud
CREATE TABLE Salud (
    id_salud INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_salud PRIMARY KEY CLUSTERED (id_salud),
    -- Table attributes
    id_menor INT NOT NULL,
    hosp_nacimiento VARCHAR(50),
    peso FLOAT,
    estatura FLOAT,
    foto_cart_vacuna BIT,
    vacuna_bgc DATE,
    vac_hepat_b_nac DATE,
    auditiva BIT,
    tamiz BIT,
    -- Foreign keys
    CONSTRAINT FK_menor_sld FOREIGN KEY (id_menor) REFERENCES dbo.Menor(id_menor)
);

-- Padres
CREATE TABLE Adulto (
    id_adulto INT IDENTITY (1,1) NOT NULL, CONSTRAINT pk_adulto PRIMARY KEY CLUSTERED (id_adulto),
    -- Table attributes
    id_datos_persona INT NOT NULL,
    id_menor INT NOT NULL,
    estado_civil VARCHAR(20),
    nivel_escolar VARCHAR(20),
    ultimo_grado_esc VARCHAR(50),
    estudiando BIT,
    carrera_profesional VARCHAR(50),
    oficio VARCHAR(50),
    ocupacion VARCHAR(20),
    pos_laboral VARCHAR(50),
    salario_fijo_men FLOAT,
    sacramentos VARCHAR(100),
    -- Foreign keys
    CONSTRAINT FK_datos_adulto FOREIGN KEY (id_datos_persona) REFERENCES dbo.Datos_Persona(id_datos_persona),
    CONSTRAINT FK_menor_adulto FOREIGN KEY (id_menor) REFERENCES dbo.Menor(id_menor),
);

/* DELETE DATABASE
ALTER TABLE dbo.Registro
DROP CONSTRAINT FK_datos_persona, FK_usuario;

ALTER TABLE dbo.Menor
DROP CONSTRAINT FK_datos_menor;

ALTER TABLE dbo.Ubicacion
DROP CONSTRAINT FK_menor_ubi;

ALTER TABLE dbo.Familia
DROP CONSTRAINT FK_menor_fam;

ALTER TABLE dbo.Salud
DROP CONSTRAINT FK_menor_sld;

ALTER TABLE dbo.Adulto
DROP CONSTRAINT FK_datos_adulto, FK_menor_adulto;

DROP TABLE Usuario, Datos_Persona, Registro, Menor, Ubicacion, Familia, Salud, Adulto;
*/
