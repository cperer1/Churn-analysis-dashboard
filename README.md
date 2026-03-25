# ETL de Ventas con Python y PostgreSQL

## Descripción del Proyecto
Este proyecto implementa un pipeline ETL (Extract, Transform, Load) completo para procesar datos de ventas desde un archivo Excel hasta una base de datos PostgreSQL.

El objetivo es transformar datos crudos en información estructurada y lista para análisis, aplicando buenas prácticas de ingeniería de datos.

---

## Objetivos
- Extraer datos desde una fuente externa (Excel)
- Limpiar y transformar los datos aplicando reglas de negocio
- Cargar los datos a una base de datos PostgreSQL
- Separar entorno de staging y tabla final
- Generar KPIs utilizando SQL
- Documentar el flujo completo del pipeline

---

## Arquitectura del Proyecto

![Flujo ETL](assets/flujo_etl.png)

El flujo sigue las siguientes etapas:

1. **Extract** Lectura del archivo `ventas_raw.xlsx` (Este dataset fue descargado de kaggle.com)
2. **Transform** Limpieza, validaciones y creación de métricas
3. **Load** Carga en tabla `ventas_staging`
4. **Staging SQL** Creación de tabla final `ventas`
5. **KPIs** Consultas analíticas para métricas de negocio

---

## Tecnologías Utilizadas
- Python
- Pandas
- PostgreSQL
- SQL
- SQLAlchemy
- DBeaver

---

## Estructura del Proyecto

```
etl_ventas/
│
├── README.md
├── RESULTADOS_ETL.md
│
├── data/
│   └── ventas_raw.xlsx
│
├── etl/
│   ├── extract.py
│   ├── transform.py
│   ├── load.py
│   └── pipeline.py
│
├── sql/
│   ├── staging.sql
│   ├── kpis.sql
│
└── assets/
    ├──flujo_etl.png
    ├──productos_mas_vendidos.png
    └── ventas_por_pais.png
```
---

## Fases del Pipeline

### Extract
Lectura del archivo Excel sin modificaciones para preservar la integridad de la fuente de datos.

### Transform
- Normalización de nombres de columnas
- Eliminación de duplicados
- Conversión de tipos de datos
- Creación de columnas derivadas (`ingresos`, `margen`, `year`, `month`)
- Validaciones básicas de calidad de datos

### Load
Carga de los datos transformados a PostgreSQL en la tabla `ventas_staging`.

### Modelado SQL
Separación entre tabla staging y tabla final `ventas`, lista para análisis.

### KPIs
Consultas SQL para:
- Ingresos totales
- Margen total y promedio
- Top productos por ingresos
- Ventas por ciudad

---

## Cómo Ejecutar el Proyecto

1. Crear la base de datos en PostgreSQL:

```sql
CREATE DATABASE ventas_etl;
```

2. Ejecutar el pipeline:

```bash
python etl/pipeline.py
```

3. Ejecutar los scripts SQL en DBeaver:

- `sql/staging.sql`
- `sql/kpis.sql`

---

## Aprendizajes Clave
- Implementación de un pipeline ETL real
- Separación de responsabilidades por módulo
- Integración Python ↔ PostgreSQL
- Diseño de arquitectura staging → producción
- Documentación técnica profesional

---

## Este proyecto fue desarrollado por Cristian Camilo Perez Rodriguez como parte de mi portafolio personal enfocado en Data Analytics e Ingeniería de Datos.

