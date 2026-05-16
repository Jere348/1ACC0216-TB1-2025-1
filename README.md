# 1ACC0216 - TB1 - 2026-1

## Objetivo del trabajo
El propósito de este trabajo es realizar un Análisis Exploratorio de Datos (EDA) centrado en la industria hotelera, un sector donde la disponibilidad de datos reales de negocio suele ser escasa debido a políticas de confidencialidad. El objetivo principal consiste en aplicar técnicas de ciencia de datos para limpiar, inspeccionar y visualizar patrones de demanda reales que permitan optimizar la gestión de ingresos (Revenue Management) y la toma de decisiones operativas dentro del sector.

## Nombre de los alumnos participantes
* **Colonio Soto Rodrigo Aaron** - Código: u202323598
* **Donayre Salas Julio Gabriel** - Código: u20241a112
* **Flores Peralta Frank Alexander** - Código: u202410754
* **Yparraguirre Aquino Sebastián Alonso** - Código: u20241e121

## Breve descripción del dataset
El conjunto de datos utilizado es el **Hotel Booking Demand Dataset**, cuyas especificaciones técnicas son las siguientes:
* **Autores y origen:** Los datos fueron recopilados y descritos por Nuno Antonio, Ana de Almeida y Luis Nunes (2019) en la revista *Data in Brief*. La información se extrajo directamente de las bases de datos SQL de los sistemas de gestión hotelera (PMS) de dos hoteles reales en Portugal: un hotel resort (H1 en la región de Algarve) y un hotel urbano (H2 en la ciudad de Lisboa).
* **Periodo de tiempo:** Comprende reservaciones con fecha de llegada entre el 1 de julio de 2015 y el 31 de agosto de 2017.
* **Volumen de datos:** El archivo original contiene 31 variables y un total de 119,390 observaciones. Tras el proceso de depuración y eliminación de datos redundantes (31,994 registros duplicados), el dataset final de análisis quedó conformado por **87,396 observaciones únicas**.
* **Variables analizadas:** Incluye información sobre tarifas diarias promedio (ADR), tiempos de anticipación (Lead Time), cancelaciones, composición de los huéspedes (adultos, niños, bebés), requerimientos de estacionamiento y canales de distribución.

🔗 **Enlace al documento de trabajo:** [Google Docs - Informe TB1](https://docs.google.com/document/d/1xfArwKdYn05pGuvB7Y87A7z54tA7lxBxuzQoEhZj8qA/edit?tab=t.0#heading=h.3dsyvdf89vdd)

## Conclusiones
1. **Hegemonía del modelo de negocio urbano:** Se demuestra una marcada preferencia del mercado hacia la tipología de hospedaje de ciudad (*City Hotel*), el cual concentra más del doble del volumen de reservas (~53,428) en comparación con el formato de descanso (*Resort Hotel* con ~33,967). Esto responde a la ubicación estratégica y la conectividad del hotel urbano para capturar flujos constantes de corta estancia y del segmento corporativo.
2. **Estacionalidad climatológica marcada:** La operación hotelera en Portugal está fuertemente condicionada por el clima europeo. Se identificaron con precisión tres estaciones de negocio: Temporada Alta (julio y agosto) con picos máximos de saturación de inventarios; Temporada Media (primavera y otoño); y Temporada Baja (meses de invierno, principalmente enero, febrero, noviembre y diciembre) con contracciones a niveles mínimos operativos.
3. **Dependencia de la infraestructura logística vehicular:** La necesidad de proveer plazas de estacionamiento está estrictamente condicionada a la ubicación geográfica de la propiedad. Mientras que en el hotel urbano representa un requerimiento marginal y despreciable (~3.5% de la demanda), en el *Resort Hotel* se eleva significativamente hasta abarcar el 15.9% de las reservas, convirtiéndose en una ventaja competitiva clave para el huésped vacacional que se desplaza de forma autónoma.
4. **Los canales digitales como motores de incertidumbre:** La deserción de reservas está fuertemente ligada al diseño comercial de los intermediarios de venta. El canal de agencias de viajes en línea (*Online TA*) lidera el índice de riesgo con un 35.3% de cancelaciones debido a la especulación de las políticas de "cancelación gratuita", seguido por el segmento de *Groups* (27%), mientras que las reservas directas o corporativas representan el núcleo más seguro y fiel del negocio.
5. **El dilema del horizonte temporal (Lead Time vs. ADR):** El análisis del equipo demostró matemáticamente que a mayor anticipación en la reserva (*Lead Time*), se incrementa drásticamente el riesgo de cancelación. Lo crítico es que estas habitaciones anuladas registran las tarifas nominales más altas (*ADR*), generando un escenario adverso de "falsos ingresos esperados" que bloquea el inventario más valioso para clientes que finalmente no se presentan.

## Licencia
Este proyecto está bajo la Licencia MIT. Esto significa que eres libre de usar, copiar, modificar y distribuir el código y el análisis siempre que se otorgue el crédito correspondiente a los autores originales.
