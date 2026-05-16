# 1ACC0216 - TB1 - 2025-1

## Objetivo del trabajo
El propósito de este trabajo es realizar un Análisis Exploratorio de Datos (EDA) centrado en la industria hotelera utilizando el lenguaje de programación R. El objetivo principal consiste en aplicar técnicas de ciencia de datos para limpiar, inspeccionar y visualizar patrones de demanda reales de negocio que permitan optimizar la gestión de ingresos (Revenue Management) y la toma de decisiones operativas dentro del sector.

## Nombre de los alumnos participantes
* **Colonio Soto Rodrigo Aaron** - Código: u202323598
* **Donayre Salas Julio Gabriel** - Código: u20241a112
* **Flores Peralta Frank Alexander** - Código: u202410754
* **Yparraguirre Aquino Sebastián Alonso** - Código: u20241e121

## Breve descripción del dataset
El conjunto de datos utilizado es el **Hotel Booking Demand Dataset**, recopilado y publicado por Nuno Antonio, Ana de Almeida y Luis Nunes (2019).
* **Origen y fuente:** Los datos provienen directamente de las bases de datos SQL de los sistemas de gestión hotelera (PMS) de dos hoteles reales ubicados en Portugal: un hotel resort (H1 en la región de Algarve) y un hotel urbano (H2 en la ciudad de Lisboa).
* **Periodo de tiempo:** Comprende reservaciones con fecha de llegada entre el 1 de julio de 2015 y el 31 de agosto de 2017.
* **Volumen de datos:** El archivo original cuenta con un total de 119,390 observaciones y 32 variables analíticas (reducidas a 87,396 registros únicos tras el proceso de depuración y eliminación de datos redundantes).
* **Variables clave:** Incluye información sobre tarifas diarias promedio (ADR), tiempos de anticipación (Lead Time), cancelaciones, composición de los huéspedes (adultos, niños, bebés), requerimientos de estacionamiento y canales de distribución.

*(Nota: Puedes encontrar el informe detallado en formato PDF adjunto en la raíz de este repositorio para una descripción extendida de las variables y el diccionario de datos).*

## Conclusiones
1.  **Hegemonía del modelo urbano:** Existe una marcada preferencia del mercado hacia la tipología de hospedaje de ciudad (*City Hotel*), el cual concentra más del doble del volumen de reservas en comparación con el formato vacacional (*Resort Hotel*), debido a su accesibilidad y flujo corporativo.
2.  **Estacionalidad climatológica:** La demanda hotelera en Portugal está fuertemente condicionada por el clima europeo, identificándose tres picos claros: Temporada Alta (julio y agosto), Temporada Media (primavera y otoño) y Temporada Baja (meses de invierno).
3.  **Dependencia logística de estacionamientos:** El requerimiento de cocheras no es un servicio estándar, sino una ventaja crítica para el *Resort Hotel* (donde alcanza casi el 16% de la demanda por la naturaleza autónoma del viaje vacacional), mientras que en el *City Hotel* es marginal (~3.5%) gracias al transporte público local.
4.  **Incertidumbre en canales digitales:** Las agencias de viajes en línea (*Online TA*) representan el mayor motor de incertidumbre financiera al liderar la tasa de cancelaciones con un 35.3%, un comportamiento impulsado por la especulación que permiten las políticas de "cancelación gratuita".
5.  **El dilema del Lead Time (Horizonte Temporal):** Se comprobó matemáticamente que a mayor anticipación en la reserva (*Lead Time*), se incrementa drásticamente el riesgo de cancelación. Esto genera un escenario adverso de "falsos ingresos esperados" con tarifas nominales altas (ADR) que bloquean habitaciones valiosas que finalmente no se ocuparán.

## Licencia
Este proyecto está bajo la Licencia MIT. Esto significa que eres libre de usar, copiar, modificar y distribuir el código y el análisis siempre que se otorgue el crédito correspondiente a los autores originales.
