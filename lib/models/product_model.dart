import 'dart:convert';

class ProductModel {
    final String? codigo;
    final String? nombre;
    final String? descripcion;
    final String? tipoUnidad;
    final int? cantidadBodega;
    final int? precioUnitario;
    final String? observacion;
    final int? usuarioId;

    ProductModel({
        this.codigo,
        this.nombre,
        this.descripcion,
        this.tipoUnidad,
        this.cantidadBodega,
        this.precioUnitario,
        this.observacion,
        this.usuarioId,
    });

    ProductModel copyWith({
        String? codigo,
        String? nombre,
        String? descripcion,
        String? tipoUnidad,
        int? cantidadBodega,
        int? precioUnitario,
        String? observacion,
        int? usuarioId,
    }) => 
        ProductModel(
            codigo: codigo ?? this.codigo,
            nombre: nombre ?? this.nombre,
            descripcion: descripcion ?? this.descripcion,
            tipoUnidad: tipoUnidad ?? this.tipoUnidad,
            cantidadBodega: cantidadBodega ?? this.cantidadBodega,
            precioUnitario: precioUnitario ?? this.precioUnitario,
            observacion: observacion ?? this.observacion,
            usuarioId: usuarioId ?? this.usuarioId,
        );

    factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        codigo: json["codigo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        tipoUnidad: json["tipo_unidad"],
        cantidadBodega: json["cantidad_bodega"],
        precioUnitario: json["precio_unitario"],
        observacion: json["observacion"],
        usuarioId: json["usuario_id"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "descripcion": descripcion,
        "tipo_unidad": tipoUnidad,
        "cantidad_bodega": cantidadBodega,
        "precio_unitario": precioUnitario,
        "observacion": observacion,
        "usuario_id": usuarioId,
    };
}
