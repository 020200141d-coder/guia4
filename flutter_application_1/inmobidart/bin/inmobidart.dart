// Definimos los tipos de propiedades de forma sellada
sealed class Inmueble {}

class Casa extends Inmueble {
  final int habitaciones;
  final double metrosCuadrados;
  Casa(this.habitaciones, this.metrosCuadrados);
}

class Apartamento extends Inmueble {
  final int piso;
  final bool tieneAscensor;
  Apartamento(this.piso, this.tieneAscensor);
}

// Un Record para representar la ubicación y el precio base
// (Latitud, Longitud, Zona, Precio)
typedef InfoFinanciera = (double lat, double lng, {String zona, double precio});

void procesarCatalogo(List<(Inmueble, InfoFinanciera)> catalogo) {
  print('--- REPORTE DE PROPIEDADES INMODART ---\n');

  for (var (inmueble, info) in catalogo) {
    // 1. Destructuring del Record 'info'
    var (lat, lng, zona: zonaNombrada, precio: precioBase) = info;

    // 2. Pattern Matching con Switch Expression para determinar categoría
    String categoria = switch (inmueble) {
      Casa(habitaciones: > 4) => 'Mansión Familiar',
      Casa() => 'Casa Estándar',
      Apartamento(piso: > 10, tieneAscensor: true) => 'Penthouse / Ático',
      Apartamento(tieneAscensor: false) => 'Dep. Acceso por Escala',
      _ => 'Propiedad General',
    };

    // 3. Aplicar bonificación usando Relational Patterns
    double precioFinal = switch (precioBase) {
      < 50000 => precioBase * 0.95,
      >= 50000 && <= 150000 => precioBase,
      > 150000 => precioBase * 1.10,
      _ => precioBase // 👈 CASO NECESARIO PARA QUE SEA EXHAUSTIVO
    };

    print('Tipo: $categoria');
    print('Ubicación: [$lat, $lng] en Zona: $zonaNombrada');
    print('Precio Final: \$${precioFinal.toStringAsFixed(2)}\n');
  }
}

void main() {
  // Lista de tuplas (Inmueble, InfoFinanciera)
  var listaPropiedades = [
    (
      Casa(5, 250.0),
      (-12.04, -77.03, zona: 'Miraflores', precio: 180000.0)
    ),
    (
      Apartamento(12, true),
      (-12.08, -76.99, zona: 'San Isidro', precio: 120000.0)
    ),
    (
      Apartamento(2, false),
      (-12.12, -77.01, zona: 'Surquillo', precio: 45000.0)
    ),
  ];

  procesarCatalogo(listaPropiedades);
}