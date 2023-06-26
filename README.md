-- Obtener todas las tareas
SELECT * FROM tarea;

-- Obtener todas las tareas por usuario
SELECT tar.titulo, usu.email
FROM tarea tar 
JOIN usuario usu on (tar.usuario_id=usu.id);

-- Obtener todas las tareas que sean de un usuario y estén pendiente

SELECT *
FROM tarea tar 
JOIN usuario usu on (tar.usuario_id=usu.id)
WHERE usu.id = 3 AND tar.completado = 'false' ;

-- Borrar una tarea

DELETE FROM tarea WHERE id=4;

-- Insertar un email repetido, ¿qué pasa?, ¿por qué?
INSERT INTO usuario (email, activo) VALUES
('example1@example.com', 'false');

--Respuesta; "Ya existe la llave (email)=(example1@example.com).llave duplicada viola restricción de unicidad «email» "
-- Dado que le aplicamos la restriccion 'unique' para que no se repita.

--Eliminar una prioridad que está siendo referenciada en una tarea, ¿es posible?, ¿por qué?, ¿qué significa la eliminación en cascada?
DELETE FROM prioridad WHERE id=3;

--Respuesta:"La llave (id)=(3) todavía es referida desde la tabla «tarea».update o delete en «prioridad» viola la llave foránea «prioridad_id» en la tabla «tarea»"
-- No va a ser posible dado que vinculamos las prioridades con las tareas mediante claves foranea. 
