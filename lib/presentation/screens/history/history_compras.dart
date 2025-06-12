import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/forms/custom_button.dart';
import '../HomeView.dart';

class HistorialComprasScreen extends StatelessWidget {
  const HistorialComprasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal
              const Text(
                'Historial\nde compras',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 24),

              // Lista de pedidos
              Expanded(
                child: ListView(
                  children: [
                    _buildPedidoCard(
                      pedidoNum: '#1002',
                      productos: ['Croissant de queso', 'Capuccino L'],
                      precio: 'S/16.80',
                      hora: '11:31',
                    ),
                    const SizedBox(height: 12),

                    _buildPedidoCard(
                      pedidoNum: '#1002',
                      productos: ['Gatambichiquesar', 'Bragonsauer'],
                      precio: 'S/22.90',
                      hora: '11:31',
                    ),
                    const SizedBox(height: 12),

                    _buildPedidoCard(
                      pedidoNum: '#1002',
                      productos: ['Savamesa muslino', 'CastañaU'],
                      precio: 'S/10.60',
                      hora: '10:40',
                    ),
                    const SizedBox(height: 12),

                    _buildPedidoCard(
                      pedidoNum: '#0999',
                      productos: ['Chicken de queso', 'Capuccino L'],
                      precio: 'S/10.70',
                      hora: '',
                    ),
                  ],
                ),
              ),

              // Botón volver a la tienda (reutilizado)
              const SizedBox(height: 24),
              CustomButton(
                text: 'Volver a mi perfil',
                onPressed:  () => Navigator.of(context).pop(),
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPedidoCard({
    required String pedidoNum,
    required List<String> productos,
    required String precio,
    required String hora,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EDE5), // Color beige más oscuro para las tarjetas
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Número de pedido
          Text(
            'Pedido $pedidoNum',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          // Productos y precio en la misma fila
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Productos
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: productos.map((producto) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          producto,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ).toList(),
                ),
              ),

              // Precio
              Text(
                precio,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Fila inferior con hora y botón
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Hora
              Text(
                hora,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              // Botón repetir pedido
              GestureDetector(
                onTap: () {
                  // Acción para repetir pedido
                  print('Repetir pedido $pedidoNum');
                },
                child: const Text(
                  'Repetir pedido',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF6B35), // Color naranja
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}