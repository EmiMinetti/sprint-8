CREATE TABLE public.usuario
(
    id serial NOT NULL,
    email character varying(50) NOT NULL,
    activo boolean NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    CONSTRAINT email UNIQUE (email)
        INCLUDE(email)
);

ALTER TABLE IF EXISTS public.usuario
    OWNER to postgres;
	
CREATE TABLE public.prioridad
(
    id serial NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(50) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.prioridad
    OWNER to postgres;

CREATE TABLE public.tarea
(
    id serial NOT NULL,
    titulo character varying(50) NOT NULL,
    prioridad_id integer NOT NULL,
    usuario_id integer NOT NULL,
    completado boolean NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    CONSTRAINT prioridad_id FOREIGN KEY (prioridad_id)
        REFERENCES public.prioridad (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT usuario_id FOREIGN KEY (usuario_id)
        REFERENCES public.usuario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.tarea
    OWNER to postgres;

-- Ingreso de prioridades
INSERT INTO prioridad (nombre, descripcion) VALUES
('Alta', 'Prioridad alta para las tareas'),
('Media', 'Prioridad media para las tareas'),
('Baja', 'Prioridad baja para las tareas');

-- Ingreso de usuarios
INSERT INTO usuario (email, activo) VALUES
('example1@example.com', 'false'),
('example2@example.com', 'true'),
('example3@example.com', 'true');

-- Ingreso de tareas
INSERT INTO tarea (titulo, prioridad_id, usuario_id, completado) VALUES
('hacer la cama', 3 , 3 , 'false'),
('pasear al perro', 2 , 2 , 'true'),
('mirar a peñarol', 1 , 1 , 'false'),
('colgar la ropa', 2 , 2 , 'true');