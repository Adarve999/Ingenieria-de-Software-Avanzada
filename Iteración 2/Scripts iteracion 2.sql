-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public.empleados | type: TABLE --
-- DROP TABLE IF EXISTS public.empleados CASCADE;
CREATE TABLE public.empleados(
	"IdEmpleados" uuid NOT NULL,
	"DNI" character varying(9),
	nombre character varying(15),
	"fecha-nacimiento" date,
	telefono numeric(9),
	profesion character varying(15),
	salario numeric(6),
	CONSTRAINT empleados_pk PRIMARY KEY ("IdEmpleados")

);
-- ddl-end --
ALTER TABLE public.empleados OWNER TO postgres;
-- ddl-end --

-- object: public.monitores | type: TABLE --
-- DROP TABLE IF EXISTS public.monitores CASCADE;
CREATE TABLE public.monitores(
	"IdMonitores" numeric(9) NOT NULL,
	turno character varying(15),
	actividad character varying(15),
	"puntuacionMedia" numeric(2),
	CONSTRAINT monitores_pk PRIMARY KEY ("IdMonitores")

);
-- ddl-end --
ALTER TABLE public.monitores OWNER TO postgres;
-- ddl-end --

-- object: public.registro_monitores | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_monitores CASCADE;
CREATE TABLE public.registro_monitores(
	"IdEmpleados_empleados" uuid NOT NULL,
	"IdMonitores_monitores" numeric(9) NOT NULL,
	CONSTRAINT registro_monitores_pk PRIMARY KEY ("IdEmpleados_empleados","IdMonitores_monitores")

);
-- ddl-end --

-- object: empleados_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_monitores DROP CONSTRAINT IF EXISTS empleados_fk CASCADE;
ALTER TABLE public.registro_monitores ADD CONSTRAINT empleados_fk FOREIGN KEY ("IdEmpleados_empleados")
REFERENCES public.empleados ("IdEmpleados") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: monitores_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_monitores DROP CONSTRAINT IF EXISTS monitores_fk CASCADE;
ALTER TABLE public.registro_monitores ADD CONSTRAINT monitores_fk FOREIGN KEY ("IdMonitores_monitores")
REFERENCES public.monitores ("IdMonitores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.limpiadores | type: TABLE --
-- DROP TABLE IF EXISTS public.limpiadores CASCADE;
CREATE TABLE public.limpiadores(
	"IdLimpiadores" uuid NOT NULL,
	CONSTRAINT limpiadores_pk PRIMARY KEY ("IdLimpiadores")

);
-- ddl-end --
ALTER TABLE public.limpiadores OWNER TO postgres;
-- ddl-end --

-- object: public.resgistro_limpiadores | type: TABLE --
-- DROP TABLE IF EXISTS public.resgistro_limpiadores CASCADE;
CREATE TABLE public.resgistro_limpiadores(
	"IdLimpiadores_limpiadores" uuid NOT NULL,
	"IdEmpleados_empleados" uuid NOT NULL,
	CONSTRAINT resgistro_limpiadores_pk PRIMARY KEY ("IdEmpleados_empleados","IdLimpiadores_limpiadores")

);
-- ddl-end --

-- object: empleados_fk | type: CONSTRAINT --
-- ALTER TABLE public.resgistro_limpiadores DROP CONSTRAINT IF EXISTS empleados_fk CASCADE;
ALTER TABLE public.resgistro_limpiadores ADD CONSTRAINT empleados_fk FOREIGN KEY ("IdEmpleados_empleados")
REFERENCES public.empleados ("IdEmpleados") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: limpiadores_fk | type: CONSTRAINT --
-- ALTER TABLE public.resgistro_limpiadores DROP CONSTRAINT IF EXISTS limpiadores_fk CASCADE;
ALTER TABLE public.resgistro_limpiadores ADD CONSTRAINT limpiadores_fk FOREIGN KEY ("IdLimpiadores_limpiadores")
REFERENCES public.limpiadores ("IdLimpiadores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.recepcionista | type: TABLE --
-- DROP TABLE IF EXISTS public.recepcionista CASCADE;
CREATE TABLE public.recepcionista(
	"IdRecepcionista" numeric(9) NOT NULL,
	CONSTRAINT recepcionista_pk PRIMARY KEY ("IdRecepcionista")

);
-- ddl-end --
ALTER TABLE public.recepcionista OWNER TO postgres;
-- ddl-end --

-- object: public.registro_recepcionista | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_recepcionista CASCADE;
CREATE TABLE public.registro_recepcionista(
	"IdRecepcionista_recepcionista" numeric(9) NOT NULL,
	"IdEmpleados_empleados" uuid NOT NULL,
	CONSTRAINT registro_recepcionista_pk PRIMARY KEY ("IdEmpleados_empleados","IdRecepcionista_recepcionista")

);
-- ddl-end --

-- object: empleados_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_recepcionista DROP CONSTRAINT IF EXISTS empleados_fk CASCADE;
ALTER TABLE public.registro_recepcionista ADD CONSTRAINT empleados_fk FOREIGN KEY ("IdEmpleados_empleados")
REFERENCES public.empleados ("IdEmpleados") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: recepcionista_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_recepcionista DROP CONSTRAINT IF EXISTS recepcionista_fk CASCADE;
ALTER TABLE public.registro_recepcionista ADD CONSTRAINT recepcionista_fk FOREIGN KEY ("IdRecepcionista_recepcionista")
REFERENCES public.recepcionista ("IdRecepcionista") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.entrenadores | type: TABLE --
-- DROP TABLE IF EXISTS public.entrenadores CASCADE;
CREATE TABLE public.entrenadores(
	"IdEntrenadores" uuid NOT NULL,
	"HorasLibres" numeric(2),
	"HorasReservadas" numeric(2),
	CONSTRAINT entrenadores_pk PRIMARY KEY ("IdEntrenadores")

);
-- ddl-end --
ALTER TABLE public.entrenadores OWNER TO postgres;
-- ddl-end --

-- object: public.registro_entrenadores | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_entrenadores CASCADE;
CREATE TABLE public.registro_entrenadores(
	"IdEmpleados_empleados" uuid NOT NULL,
	"IdEntrenadores_entrenadores" uuid NOT NULL,
	CONSTRAINT registro_entrenadores_pk PRIMARY KEY ("IdEntrenadores_entrenadores","IdEmpleados_empleados")

);
-- ddl-end --

-- object: entrenadores_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_entrenadores DROP CONSTRAINT IF EXISTS entrenadores_fk CASCADE;
ALTER TABLE public.registro_entrenadores ADD CONSTRAINT entrenadores_fk FOREIGN KEY ("IdEntrenadores_entrenadores")
REFERENCES public.entrenadores ("IdEntrenadores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: empleados_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_entrenadores DROP CONSTRAINT IF EXISTS empleados_fk CASCADE;
ALTER TABLE public.registro_entrenadores ADD CONSTRAINT empleados_fk FOREIGN KEY ("IdEmpleados_empleados")
REFERENCES public.empleados ("IdEmpleados") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.socios | type: TABLE --
-- DROP TABLE IF EXISTS public.socios CASCADE;
CREATE TABLE public.socios(
	"IdSocio" uuid NOT NULL,
	"Nsocio" numeric(9) NOT NULL,
	nombre character varying(15) NOT NULL,
	telefono numeric(9) NOT NULL,
	"NcuentaBancaria" numeric(9) NOT NULL,
	CONSTRAINT socios_pk PRIMARY KEY ("IdSocio")

);
-- ddl-end --
ALTER TABLE public.socios OWNER TO postgres;
-- ddl-end --

-- object: public.actividades | type: TABLE --
-- DROP TABLE IF EXISTS public.actividades CASCADE;
CREATE TABLE public.actividades(
	"Identificador" uuid NOT NULL,
	"NombreActividad" character varying(20),
	horario time,
	aforo numeric(50),
	"SalaImparticion" character varying(20),
	"Fecha" date,
	CONSTRAINT actividades_pk PRIMARY KEY ("Identificador")

);
-- ddl-end --
ALTER TABLE public.actividades OWNER TO postgres;
-- ddl-end --

-- object: public."Factura" | type: TABLE --
-- DROP TABLE IF EXISTS public."Factura" CASCADE;
CREATE TABLE public."Factura"(
	"IdFactura" uuid NOT NULL,
	"Tcuota" character varying(20),
	"Precio" float,
	CONSTRAINT "Factura_pk" PRIMARY KEY ("IdFactura")

);
-- ddl-end --
ALTER TABLE public."Factura" OWNER TO postgres;
-- ddl-end --

-- object: public.registro_actividades | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_actividades CASCADE;
CREATE TABLE public.registro_actividades(
	"IdMonitores_monitores" numeric(9) NOT NULL,
	"Identificador_actividades" uuid NOT NULL,
	CONSTRAINT registro_actividades_pk PRIMARY KEY ("IdMonitores_monitores","Identificador_actividades")

);
-- ddl-end --

-- object: monitores_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_actividades DROP CONSTRAINT IF EXISTS monitores_fk CASCADE;
ALTER TABLE public.registro_actividades ADD CONSTRAINT monitores_fk FOREIGN KEY ("IdMonitores_monitores")
REFERENCES public.monitores ("IdMonitores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: actividades_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_actividades DROP CONSTRAINT IF EXISTS actividades_fk CASCADE;
ALTER TABLE public.registro_actividades ADD CONSTRAINT actividades_fk FOREIGN KEY ("Identificador_actividades")
REFERENCES public.actividades ("Identificador") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."registro_Valoracion" | type: TABLE --
-- DROP TABLE IF EXISTS public."registro_Valoracion" CASCADE;
CREATE TABLE public."registro_Valoracion"(
	"IdMonitores_monitores" numeric(9) NOT NULL,
	"IdSocio_socios" uuid NOT NULL,
	CONSTRAINT "registro_Valoracion_pk" PRIMARY KEY ("IdSocio_socios","IdMonitores_monitores")

);
-- ddl-end --

-- object: socios_fk | type: CONSTRAINT --
-- ALTER TABLE public."registro_Valoracion" DROP CONSTRAINT IF EXISTS socios_fk CASCADE;
ALTER TABLE public."registro_Valoracion" ADD CONSTRAINT socios_fk FOREIGN KEY ("IdSocio_socios")
REFERENCES public.socios ("IdSocio") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: monitores_fk | type: CONSTRAINT --
-- ALTER TABLE public."registro_Valoracion" DROP CONSTRAINT IF EXISTS monitores_fk CASCADE;
ALTER TABLE public."registro_Valoracion" ADD CONSTRAINT monitores_fk FOREIGN KEY ("IdMonitores_monitores")
REFERENCES public.monitores ("IdMonitores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.registro_emision | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_emision CASCADE;
CREATE TABLE public.registro_emision(
	"IdSocio_socios" uuid NOT NULL,
	"IdFactura_Factura" uuid NOT NULL,
	CONSTRAINT registro_emision_pk PRIMARY KEY ("IdSocio_socios","IdFactura_Factura")

);
-- ddl-end --

-- object: socios_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_emision DROP CONSTRAINT IF EXISTS socios_fk CASCADE;
ALTER TABLE public.registro_emision ADD CONSTRAINT socios_fk FOREIGN KEY ("IdSocio_socios")
REFERENCES public.socios ("IdSocio") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Factura_fk" | type: CONSTRAINT --
-- ALTER TABLE public.registro_emision DROP CONSTRAINT IF EXISTS "Factura_fk" CASCADE;
ALTER TABLE public.registro_emision ADD CONSTRAINT "Factura_fk" FOREIGN KEY ("IdFactura_Factura")
REFERENCES public."Factura" ("IdFactura") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.registro_asignacion | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_asignacion CASCADE;
CREATE TABLE public.registro_asignacion(
	"IdEntrenadores_entrenadores" uuid NOT NULL,
	"IdSocio_socios" uuid NOT NULL,
	CONSTRAINT registro_asignacion_pk PRIMARY KEY ("IdEntrenadores_entrenadores","IdSocio_socios")

);
-- ddl-end --

-- object: entrenadores_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_asignacion DROP CONSTRAINT IF EXISTS entrenadores_fk CASCADE;
ALTER TABLE public.registro_asignacion ADD CONSTRAINT entrenadores_fk FOREIGN KEY ("IdEntrenadores_entrenadores")
REFERENCES public.entrenadores ("IdEntrenadores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: socios_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_asignacion DROP CONSTRAINT IF EXISTS socios_fk CASCADE;
ALTER TABLE public.registro_asignacion ADD CONSTRAINT socios_fk FOREIGN KEY ("IdSocio_socios")
REFERENCES public.socios ("IdSocio") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.registro_realizan | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_realizan CASCADE;
CREATE TABLE public.registro_realizan(
	"IdSocio_socios" uuid NOT NULL,
	"Identificador_actividades" uuid NOT NULL,
	CONSTRAINT registro_realizan_pk PRIMARY KEY ("IdSocio_socios","Identificador_actividades")

);
-- ddl-end --

-- object: socios_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_realizan DROP CONSTRAINT IF EXISTS socios_fk CASCADE;
ALTER TABLE public.registro_realizan ADD CONSTRAINT socios_fk FOREIGN KEY ("IdSocio_socios")
REFERENCES public.socios ("IdSocio") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: actividades_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_realizan DROP CONSTRAINT IF EXISTS actividades_fk CASCADE;
ALTER TABLE public.registro_realizan ADD CONSTRAINT actividades_fk FOREIGN KEY ("Identificador_actividades")
REFERENCES public.actividades ("Identificador") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.horarios | type: TABLE --
-- DROP TABLE IF EXISTS public.horarios CASCADE;
CREATE TABLE public.horarios(
	"IDturno" uuid NOT NULL,
	turno character varying(20),
	zona_asignada character varying(20),
	CONSTRAINT "Gestion_Turnos_pk" PRIMARY KEY ("IDturno")

);
-- ddl-end --
ALTER TABLE public.horarios OWNER TO postgres;
-- ddl-end --

-- object: public.registro_horarios | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_horarios CASCADE;
CREATE TABLE public.registro_horarios(
	"IdLimpiadores_limpiadores" uuid NOT NULL,
	"IDturno_horarios" uuid NOT NULL,
	CONSTRAINT registro_horarios_pk PRIMARY KEY ("IDturno_horarios","IdLimpiadores_limpiadores")

);
-- ddl-end --

-- object: horarios_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_horarios DROP CONSTRAINT IF EXISTS horarios_fk CASCADE;
ALTER TABLE public.registro_horarios ADD CONSTRAINT horarios_fk FOREIGN KEY ("IDturno_horarios")
REFERENCES public.horarios ("IDturno") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: limpiadores_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_horarios DROP CONSTRAINT IF EXISTS limpiadores_fk CASCADE;
ALTER TABLE public.registro_horarios ADD CONSTRAINT limpiadores_fk FOREIGN KEY ("IdLimpiadores_limpiadores")
REFERENCES public.limpiadores ("IdLimpiadores") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Gimnasio" | type: TABLE --
-- DROP TABLE IF EXISTS public."Gimnasio" CASCADE;
CREATE TABLE public."Gimnasio"(
	"IdGimnasio" uuid NOT NULL,
	"Provincia" character varying(25),
	"Ciudad" character varying(25),
	CONSTRAINT "Gimnasio_pk" PRIMARY KEY ("IdGimnasio")

);
-- ddl-end --
ALTER TABLE public."Gimnasio" OWNER TO postgres;
-- ddl-end --

-- object: public.registro_gimnasio | type: TABLE --
-- DROP TABLE IF EXISTS public.registro_gimnasio CASCADE;
CREATE TABLE public.registro_gimnasio(
	"IdGimnasio_Gimnasio" uuid NOT NULL,
	"IdEmpleados_empleados" uuid NOT NULL,
	CONSTRAINT registro_gimnasio_pk PRIMARY KEY ("IdGimnasio_Gimnasio","IdEmpleados_empleados")

);
-- ddl-end --

-- object: "Gimnasio_fk" | type: CONSTRAINT --
-- ALTER TABLE public.registro_gimnasio DROP CONSTRAINT IF EXISTS "Gimnasio_fk" CASCADE;
ALTER TABLE public.registro_gimnasio ADD CONSTRAINT "Gimnasio_fk" FOREIGN KEY ("IdGimnasio_Gimnasio")
REFERENCES public."Gimnasio" ("IdGimnasio") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: empleados_fk | type: CONSTRAINT --
-- ALTER TABLE public.registro_gimnasio DROP CONSTRAINT IF EXISTS empleados_fk CASCADE;
ALTER TABLE public.registro_gimnasio ADD CONSTRAINT empleados_fk FOREIGN KEY ("IdEmpleados_empleados")
REFERENCES public.empleados ("IdEmpleados") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


