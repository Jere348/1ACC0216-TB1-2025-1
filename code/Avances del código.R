# ==== 3.1 Cargar el dataset desde un archivo .csv ====
hotel_data <- read.csv("data/hotel_bookings.csv", header = TRUE, stringsAsFactors = FALSE)

# ==== 3.2 Inspeccionar la estructura de las variables ====
str(hotel_data)

# Contar filas duplicadas
sum(duplicated(hotel_data))

# Tratamiento de registros duplicados
hotel_data <- hotel_data[!duplicated(hotel_data), ]

# Verificar que los duplicados se hayan reducido a 0
sum(duplicated(hotel_data))

# Definición de variables que deben ser categóricas (factores)
variables_a_factor <- c("hotel", "is_canceled", "arrival_date_month", "meal", 
                        "country", "market_segment", "distribution_channel", 
                        "is_repeated_guest", "reserved_room_type", "assigned_room_type", 
                        "deposit_type", "customer_type", "reservation_status")

# Aplicar la conversión masiva en un bucle
for (columna in variables_a_factor) {
  hotel_data[[columna]] <- as.factor(hotel_data[[columna]])
}

# Transformación del campo de texto a formato Fecha (date)
hotel_data$reservation_status_date <- as.Date(hotel_data$reservation_status_date, format = "%Y-%m-%d")

# Inspección de la nueva data corregida
str(hotel_data)

# Resumen descriptivo del dataset
summary(hotel_data)

# Identificación formal de NA
colSums(is.na(hotel_data))

# Imputación de los 4 NA en la variable children usando la mediana
mediana_children <- median(hotel_data$children, na.rm = TRUE)
hotel_data$children[is.na(hotel_data$children)] <- mediana_children

# Comprobación del control
colSums(is.na(hotel_data))


# ==== 3.3.3. Detección y tratamiento de valores atípicos (Outliers) =====

# Visualizar outliers originales en la variable financiera ADR
boxplot(hotel_data$adr, 
        main = "Distribución original de la variable ADR", 
        ylab = "Average Daily Rate (ADR)", 
        col = "#A6CEE3", 
        border = "#1F78B4",
        horizontal = FALSE)

# Corrección del error operativo (eliminar tarifas negativas)
hotel_data <- hotel_data[hotel_data$adr >= 0, ]

# Cálculo de los límites de corte basados en percentiles (Winsorización)
limites_recorte <- quantile(hotel_data$adr, probs = c(0.01, 0.99), na.rm = TRUE)
valor_p01 <- limites_recorte[1]
valor_p99 <- limites_recorte[2]

# Aplicación del reemplazo de valores extremos en la cola inferior y superior
hotel_data$adr[hotel_data$adr < valor_p01] <- valor_p01
hotel_data$adr[hotel_data$adr > valor_p99] <- valor_p99

# Gráfico de caja luego de tratar los Outliers
boxplot(hotel_data$adr, 
        main = "Distribución de ADR tras Winsorización", 
        ylab = "Average Daily Rate (ADR)", 
        col = "#B2DF8A", 
        border = "#33A02C",
        horizontal = FALSE)

# Imprimir resumen de control para validar límites resultantes
summary(hotel_data$adr)

write.csv(hotel_data, "data/hotel_bookings_clean.csv", row.names = FALSE)

 #3.4.1  Análisis de Reservas por tipo de hotel


#1

hotel_data$periodo <- paste(hotel_data$arrival_date_year, 
                             sprintf("%02d", match(hotel_data$arrival_date_month, month.name)), 
                             sep="-")

city <- table(hotel_data$periodo[hotel_data$hotel == "City Hotel"])
resort <- table(hotel_data$periodo[hotel_data$hotel == "Resort Hotel"])

plot(1:length(city), as.numeric(city), type = "l", col = "#4472C4", lwd = 2,
     main = "Reservas por Hotel 2015-2017",
     xlab = "", ylab = "# de Reservas", xaxt = "n",
     ylim = c(0, max(city, resort) + 300))

lines(1:length(resort), as.numeric(resort), col = "#ED7D31", lwd = 2)

axis(1, at = 1:length(city), labels = names(city), las = 2, cex.axis = 0.6)

legend("topleft", legend = c("City Hotel", "Resort Hotel"),
       col = c("#4472C4", "#ED7D31"), lwd = 2)

#2
reservas_hotel <- table(hotel_data$hotel)

barplot(reservas_hotel,main = "Reservas por Tipo de Hotel (Julio 2015 - Agosto 2017)", xlab = "Tipo de Hotel",ylab = "# de Reservas", col = c("#4472C4", "#ED7D31"), ylim = c(0, 80000))
#3.4.2. Análisis de demanda y estacionalidad

#1
reservas_anio <- table(hotel_data$arrival_date_year)
barplot(reservas_anio, main = "Reservas por Año",xlab = "Año",ylab = "# de Reservas",col = c("#4472C4", "#ED7D31", "#70AD47"),ylim = c(0, 60000))


#2
meses_orden <- c("January","February","March","April","May","June","July","August","September","October","November","December")
hotel_data$arrival_date_month <- factor(hotel_data$arrival_date_month, levels = meses_orden)

reservas_mes <- table(hotel_data$arrival_date_month)

barplot(reservas_mes,main = "Reservas por Mes",xlab = "Mes",ylab = "# de Reservas",col = "#4472C4",las = 2,ylim = c(0, 15000))
#3

par(mar = c(6, 5, 4, 8))

hotel_data$periodo <- paste(hotel_data$arrival_date_year, 
                             sprintf("%02d", match(hotel_data$arrival_date_month, month.name)), 
                             sep="-")

reservas_periodo <- table(hotel_data$periodo)
n <- length(reservas_periodo)

plot(1:n, as.numeric(reservas_periodo), type = "o", 
     col = "#4472C4", lwd = 3, pch = 16,
     main = "Reservas por Mes (Jul 2015 - Ago 2017)",
     xlab = "", ylab = "# de Reservas",
     xaxt = "n", ylim = c(0, max(reservas_periodo) + 1000))


pos_meses <- c(1, 3, 6, 9, 12, 15, 18, 21, 24, 26)
nombres_meses <- c("Jul 2015","Sep 2015","Dic 2015","Mar 2016","Jun 2016","Sep 2016","Dic 2016","Mar 2017","Jun 2017","Ago 2017")
axis(1, at = pos_meses, labels = nombres_meses, las = 2, cex.axis = 0.8)


totales <- c(sum(reservas_periodo[1:6]), sum(reservas_periodo[7:18]), sum(reservas_periodo[19:26]))
legend("topright", inset = c(-0.25, 0),
       legend = c(paste("2015:", totales[1]), paste("2016:", totales[2]), paste("2017:", totales[3])),
       title = "Total por año", bty = "o", xpd = TRUE, cex = 0.9)


#3.4.3
#1
# Calcular la duración total de la estancia y el promedio por hotel
hotel_data$total_nights <- hotel_data$stays_in_weekend_nights + hotel_data$stays_in_week_nights

df_estancias <- aggregate(total_nights ~ hotel, data = hotel_data, FUN = mean, na.rm = TRUE)

# Generación del gráfico de barras
colors <- c("City Hotel" = "#4E79A7", "Resort Hotel" = "#F28E2B")
bar_positions <- barplot(
  df_estancias$total_nights,
  names.arg = df_estancias$hotel,
  col = colors[df_estancias$hotel],
  width = 0.5,
  ylim = c(0, max(df_estancias$total_nights) * 1.15),
  main = "Duración Promedio de Estancia por Tipo de Hotel",
  xlab = "Tipo de Hotel",
  ylab = "Promedio de Noches"
)
text(bar_positions, df_estancias$total_nights, labels = round(df_estancias$total_nights, 2), pos = 3, cex = 0.9)


#2 
# Crear la variable categórica comercial
hotel_data$tiene_menores <- ifelse(hotel_data$children > 0 | hotel_data$babies > 0, "Con Niños/Bebés", "Solo Adultos")

# Calcular frecuencias como Data Frame
df_menores <- as.data.frame(table(hotel_data$tiene_menores))
colnames(df_menores) <- c("Composicion", "Frecuencia")

# Generación del gráfico de barras
colores_menores <- c("Con Niños/Bebés" = "#ED7D31", "Solo Adultos" = "#4E79A7")
bar_positions_2 <- barplot(
  df_menores$Frecuencia,
  names.arg = df_menores$Composicion,
  col = colores_menores[df_menores$Composicion],
  width = 0.5,
  ylim = c(0, max(df_menores$Frecuencia) * 1.15),
  main = "Reservas que incluyen Niños y/o Bebés",
  xlab = "Composición de la Reserva",
  ylab = "Cantidad de Reservas"
)
text(bar_positions_2, df_menores$Frecuencia, labels = df_menores$Frecuencia, pos = 3, cex = 0.9)



# ===== 3.4.4. ANÁLISIS DE LA IMPORTANCIA DEL ESTACIONAMIENTO =====

if (!exists("hotel_data")) {
  stop("No existe 'hotel_data'. Ejecuta primero la celda de carga/limpieza.")
}
if (!("required_car_parking_spaces" %in% names(hotel_data))) {
  stop("No existe la columna 'required_car_parking_spaces' en hotel_data.")
}

parking_df <- hotel_data
parking_df$required_car_parking_spaces[is.na(parking_df$required_car_parking_spaces)] <- 0
parking_df$required_car_parking_spaces[parking_df$required_car_parking_spaces < 0] <- 0
parking_df$hotel[is.na(parking_df$hotel)] <- "Unknown"
parking_df <- parking_df[parking_df$hotel != "Unknown", ]

# Agrupar en niveles interpretables
parking_df$parking_nivel <- ifelse(
  parking_df$required_car_parking_spaces >= 2,
  "2+",
  as.character(parking_df$required_car_parking_spaces)
)
parking_df$parking_nivel[!(parking_df$parking_nivel %in% c("0", "1", "2+"))] <- "2+"
parking_df$parking_nivel <- factor(parking_df$parking_nivel, levels = c("0", "1", "2+"))

colores <- c("0" = "#4E79A7", "1" = "#F28E2B", "2+" = "#E15759")

# Tablas base
conteo_global <- table(parking_df$parking_nivel)
conteo_hotel <- table(parking_df$hotel, parking_df$parking_nivel)
prop_hotel <- prop.table(conteo_hotel, 1)
prop_global <- prop.table(conteo_global)
diferencia_demanda <- sweep(prop_hotel, 2, prop_global, "/")

# --- GRAFICA 1: Distribucion global ---
barplot(
  conteo_global,
  col = colores[names(conteo_global)],
  main = "Distribucion global de espacios requeridos",
  xlab = "Espacios requeridos",
  ylab = "Reservas"
)

# --- GRAFICA 2: Demanda por tipo de hotel (composicion) ---
barplot(
  t(prop_hotel),
  beside = FALSE,
  col = colores[colnames(prop_hotel)],
  main = "Demanda de espacios por tipo de hotel",
  xlab = "Tipo de hotel",
  ylab = "Proporcion"w
)
legend(
  "topright",
  legend = c("0 espacios", "1 espacio", "2+ espacios"),
  fill = colores[c("0", "1", "2+")],
  bty = "n",
  cex = 0.9
)

# --- GRAFICA 3: Diferencia de demanda ---
barplot(
  t(diferencia_demanda),
  beside = TRUE,
  col = colores[colnames(diferencia_demanda)],
  ylim = c(0, max(1.4, max(diferencia_demanda) * 1.15)),
  main = "Diferencia de demanda",
  xlab = "Tipo de hotel",
  ylab = "Diferencia"
)
abline(h = 1, lty = 2, lwd = 2)


# ===== 3.4.5. ANÁLISIS DE LA TASA DE CANCELACIONES MENSUALES =====

# --- PREPARACIÓN Y LIMPIEZA DE DATOS ---
# Cargar los datos
lineas <- readLines("hotel_bookings_clean.csv")
lineas <- sub('^"', '', lineas)
lineas <- sub('"$', '', lineas)
lineas <- gsub('""', '"', lineas, fixed = TRUE)
hotel_data <- read.csv(text = lineas, header = TRUE, stringsAsFactors = FALSE)

# Reemplazar NA y valores vacíos en columnas clave
hotel_data$arrival_date_year[is.na(hotel_data$arrival_date_year)] <- 0
hotel_data$arrival_date_month[is.na(hotel_data$arrival_date_month)] <- "Unknown"
hotel_data$hotel[is.na(hotel_data$hotel)] <- "Unknown"
hotel_data$market_segment[is.na(hotel_data$market_segment)] <- "Unknown"
hotel_data$is_canceled[is.na(hotel_data$is_canceled)] <- 0

# Eliminar filas sin año o mes válido
hotel_data <- hotel_data[hotel_data$arrival_date_year > 0 & hotel_data$arrival_date_month != "Unknown", ]

# --- CREAR FECHA ---
meses <- c("January","February","March","April","May","June","July","August","September","October","November","December")
hotel_data$mes_num <- match(hotel_data$arrival_date_month, meses)
hotel_data <- hotel_data[!is.na(hotel_data$mes_num), ]
hotel_data$fecha <- as.Date(paste(hotel_data$arrival_date_year, sprintf("%02d", hotel_data$mes_num), "01", sep = "-"))

# --- 1. Volumen global de reservas canceladas por mes y año ---
canceladas <- subset(hotel_data, is_canceled == 1)
tabla_canceladas <- as.data.frame(table(canceladas$fecha))
colnames(tabla_canceladas) <- c("fecha", "cancelaciones")
tabla_canceladas$fecha <- as.Date(tabla_canceladas$fecha)
tabla_canceladas <- tabla_canceladas[order(tabla_canceladas$fecha), ]
plot(tabla_canceladas$fecha, tabla_canceladas$cancelaciones, type = "l",
     main = "Volumen global de reservas canceladas por mes",
     xlab = "Fecha", ylab = "Reservas canceladas")

# --- 2. Tasa relativa de cancelación mensual según tipo de hotel ---
# Filtrar hoteles válidos
hotel_data <- hotel_data[hotel_data$hotel != "Unknown", ]
canceladas <- canceladas[canceladas$hotel != "Unknown", ]

tabla_total <- as.data.frame(table(hotel_data$fecha, hotel_data$hotel))
colnames(tabla_total) <- c("fecha", "hotel", "total")
tabla_total$fecha <- as.Date(tabla_total$fecha)

tabla_canceladas_hotel <- as.data.frame(table(canceladas$fecha, canceladas$hotel))
colnames(tabla_canceladas_hotel) <- c("fecha", "hotel", "canceladas")
tabla_canceladas_hotel$fecha <- as.Date(tabla_canceladas_hotel$fecha)

tabla_merged <- merge(tabla_total, tabla_canceladas_hotel, by = c("fecha", "hotel"), all.x = TRUE)
tabla_merged$canceladas[is.na(tabla_merged$canceladas)] <- 0
tabla_merged$tasa_cancelacion <- ifelse(tabla_merged$total > 0, tabla_merged$canceladas / tabla_merged$total, NA)
tabla_merged <- tabla_merged[order(tabla_merged$fecha), ]

# Eje X en formato fecha legible
tipos <- unique(tabla_merged$hotel)
colors <- c("blue", "orange", "green", "red", "purple")
plot(
  x = range(tabla_merged$fecha),
  y = c(0, 1),
  type = "n",
  xaxt = "n",
  xlab = "Fecha",
  ylab = "Tasa de cancelación",
  main = "Tasa de cancelación mensual por tipo de hotel"
)
axis.Date(1, at = seq(min(tabla_merged$fecha), max(tabla_merged$fecha), by = "3 months"), format = "%Y-%m")
for (i in seq_along(tipos)) {
  datos <- tabla_merged[tabla_merged$hotel == tipos[i], ]
  lines(datos$fecha, datos$tasa_cancelacion, col = colors[i], lwd = 2)
}
legend("topright", legend = tipos, col = colors[1:length(tipos)], lty = 1, lwd = 2)

# --- 3. Tasa de cancelación de reservas según segmento de mercado ---
hotel_data <- hotel_data[hotel_data$market_segment != "Unknown", ]
canceladas <- canceladas[canceladas$market_segment != "Unknown", ]
tabla_total_seg <- as.data.frame(table(hotel_data$market_segment))
colnames(tabla_total_seg) <- c("segmento", "total")
tabla_canceladas_seg <- as.data.frame(table(canceladas$market_segment))
colnames(tabla_canceladas_seg) <- c("segmento", "canceladas")
tabla_merged_seg <- merge(tabla_total_seg, tabla_canceladas_seg, by = "segmento", all.x = TRUE)
tabla_merged_seg$canceladas[is.na(tabla_merged_seg$canceladas)] <- 0
tabla_merged_seg$tasa_cancelacion <- ifelse(tabla_merged_seg$total > 0, tabla_merged_seg$canceladas / tabla_merged_seg$total, NA)
barplot(tabla_merged_seg$tasa_cancelacion, names.arg=tabla_merged_seg$segmento, las=2,
        main="Tasa de cancelación por segmento de mercado", ylab="Tasa de cancelación")
