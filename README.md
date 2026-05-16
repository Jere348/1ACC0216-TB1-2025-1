<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/f/fc/UPC_logo_interiores.png" alt="Logo UPC" width="300"/>
</p>

# 1ACC0216 - Fundamentos de Data Science (TB1)

---

## Objetivo del trabajo
El propósito de este trabajo es realizar un Análisis Exploratorio de Datos (EDA) centrado en la industria hotelera. El objetivo principal consiste en aplicar técnicas de ciencia de datos utilizando el lenguaje de programación R para limpiar, inspeccionar y visualizar patrones de demanda reales de negocio que permitan optimizar la gestión de ingresos (Revenue Management) y la toma de decisiones operativas dentro del sector.

## Nombre de los alumnos participantes
* **Colonio Soto Rodrigo Aaron** - Código: u202323598
* **Donayre Salas Julio Gabriel** - Código: u20241a112
* **Flores Peralta Frank Alexander** - Código: u202410754
* **Yparraguirre Aquino Sebastián Alonso** - Código: u20241e121

## Breve descripción del dataset
El conjunto de datos utilizado es el **Hotel Booking Demand Dataset**, cuyas especificaciones técnicas son las siguientes:
* **Autores y origen:** Recopilado y descrito por Nuno Antonio, Ana de Almeida y Luis Nunes (2019). La información se extrajo directamente de las bases de datos SQL de los sistemas de gestión hotelera (PMS) de dos hoteles reales en Portugal: un hotel resort (H1 en la región de Algarve) y un hotel urbano (H2 en la ciudad de Lisboa).
* **Periodo de tiempo:** Comprende reservaciones con fecha de llegada entre el 1 de julio de 2015 y el 31 de agosto de 2017.
* **Volumen de datos:** El archivo original contiene 31 variables y un total de 119,390 observaciones. Tras el proceso de depuración y eliminación de datos redundantes (31,994 registros duplicados), el dataset final quedó conformado por **87,396 observaciones únicas**.
* **Variables analizadas:** Incluye información sobre tarifas diarias promedio (ADR), tiempos de anticipación (Lead Time), cancelaciones, composición de los huéspedes (adultos, niños, bebés), requerimientos de cocheras y canales de distribución.

🔗 **Enlace al documento de desarrollo:** [Google Docs - Informe Técnico TB1](https://docs.google.com/document/d/1xfArwKdYn05pGuvB7Y87A7z54tA7lxBxuzQoEhZj8qA/edit?tab=t.0#heading=h.3dsyvdf89vdd)

## Conclusiones
1. **Hegemonía del modelo de negocio urbano:** El mercado muestra una clara preferencia volumétrica hacia el hospedaje de ciudad (*City Hotel*), concentrando cerca de **53,428 reservas** frente a las **33,967** del formato vacacional (*Resort Hotel*), derivado de la captura de flujos corporativos y estancias cortas.
2. **Estacionalidad climatológica marcada:** La demanda hotelera en Portugal está fuertemente condicionada por el clima europeo. Se identificaron tres picos claros: Temporada Alta (julio y agosto), Temporada Media (primavera/otoño) y Temporada Baja (invierno, alcanzando mínimos en enero y febrero).
3. **Dependencia de la infraestructura logística vehicular:** La necesidad de proveer plazas de estacionamiento está estrictamente condicionada a la ubicación geográfica de la propiedad. Mientras que en el hotel urbano representa un requerimiento marginal (~3.5%), en el *Resort Hotel* se eleva significativamente hasta abarcar el **15.9% de las reservas**.
4. **Los canales digitales como motores de incertidumbre:** El canal de agencias de viajes en línea (*Online TA*) lidera el índice de riesgo con un **35.3% de cancelaciones**, un comportamiento impulsado por la especulación comercial que permiten las políticas de "cancelación gratuita".
5. **El dilema del horizonte temporal (Lead Time vs. ADR):** Se demostró estadísticamente que a mayor anticipación en la reserva (*Lead Time*), el riesgo de cancelación aumenta drásticamente. Lo crítico es que estas reservas caídas registran las tarifas nominales más altas (*ADR*), generando un escenario adverso de "falsos ingresos esperados" que bloquea habitaciones valiosas.

## Licencia
Este proyecto está bajo la Licencia MIT. Esto significa que eres libre de usar, copiar, modificar y distribuir el código y el análisis siempre que se otorgue el crédito correspondiente a los autores originales.
