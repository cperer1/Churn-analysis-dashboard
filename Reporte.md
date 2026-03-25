# Resultados del Proyecto ETL de Ventas

## Ejecución del Pipeline
El pipeline ETL fue ejecutado correctamente mediante:
python etl/pipeline.py

Durante la ejecución:
- Se extrajeron los datos desde `ventas_raw.xlsx`.
- Se limpiaron registros nulos y duplicados.
- Se estandarizaron formatos de fecha.
- Se generaron métricas derivadas como `ingresos`, `margen`, `year` y `month`.
- Los datos fueron cargados en la tabla `ventas_staging`.

---

## Validación en Base de Datos

### Total de registros cargados:
 1.000

---

## KPIs Generados

### Ingresos Totales : 
 $1289.101.896

---

### Margen Total:
 $382.025.379

---

### Top 5 Productos por Ingresos

![Productos mas vendidos ](assets/productos_mas_vendidos.png)
1. Doméstico	        $268795569
2. Material de oficina	$237252083
3. Cárnicos	            $178522753
4. Cosméticos	        $162215190
5. Alimento infantil	$110214331

---

### Top 5 ventas por Pais

![Ingresos por pais](assets/ventas_por_pais.png)

Paises con mayores ingresos: 

Equatorial Guinea	$21450067
The Gambia	        $20410468
Czech Republic	    $18652827
Haiti	            $18531556
Honduras	        $17940730

---

## Conclusiones Técnicas

- El pipeline permite transformar datos crudos en información lista para análisis.
- Se implementó una arquitectura con separación entre staging y tabla final.
- Las métricas generadas permiten análisis temporal y de rentabilidad.
- El proceso es reproducible y escalable.

---

## Impacto del Proyecto

Este proyecto demuestra:

- Implementación de un ETL real con Python y PostgreSQL
- Integración entre procesamiento de datos y análisis SQL
- Aplicación de buenas prácticas de ingeniería de datos
- Capacidad de documentar y validar resultados

---

## Este proyecto fue desarrollado por Cristian Camilo Perez Rodriguez como parte de mi portafolio personal enfocado en Data Analytics e Ingeniería de Datos.

