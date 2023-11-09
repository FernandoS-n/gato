
class ModeloGato {
    int? id;
    String nombre;
    int juegos;
    int ganados;
    int perdidos;
    int empatados;

    ModeloGato({
        this.id,
        required this.nombre,
        required this.juegos,
        required this.ganados,
        required this.perdidos,
        required this.empatados,
    });

    factory ModeloGato.fromJson(Map<String, dynamic> json) => ModeloGato(
        id        : json["id"],
        nombre    : json["nombre"],
        juegos    : json["juegos"],
        ganados   : json["ganados"],
        perdidos  : json["perdidos"],
        empatados : json["empatados"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "nombre"    : nombre,
        "juegos"    : juegos,
        "ganados"   : ganados,
        "perdidos"  : perdidos,
        "empatados" : empatados,
    };

    Map<String, dynamic> toMap() {
       return {
        "nombre"    : nombre,
        "juegos"    : juegos,
        "ganados"   : ganados,
        "perdidos"  : perdidos,
        "empatados" : empatados,
      };
    }

}
