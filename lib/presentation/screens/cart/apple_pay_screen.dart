import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ApplePayScreen extends StatefulWidget {
  const ApplePayScreen({Key? key}) : super(key: key);

  @override
  State<ApplePayScreen> createState() => _ApplePayScreenState();
}

class _ApplePayScreenState extends State<ApplePayScreen>
    with TickerProviderStateMixin {
  late AnimationController _faceIdController;
  late AnimationController _pulseController;
  late Animation<double> _faceIdAnimation;
  late Animation<double> _pulseAnimation;

  bool _showFaceId = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();

    _faceIdController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _faceIdAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _faceIdController,
      curve: Curves.elasticOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _faceIdController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _handleApplePayPress() {
    setState(() {
      _showFaceId = true;
    });

    _faceIdController.forward();

    // Iniciar animación de pulso
    _pulseController.repeat(reverse: true);

    // Simular proceso de autenticación
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isProcessing = true;
        });

        _pulseController.stop();

        // Simular éxito y navegar
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            context.push('/order-confirmation');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar igual que el Home
          SliverAppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            expandedHeight: 85,
            floating: true,
            snap: true,
            pinned: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.all(AppSizes.paddingXS),
                child: Row(
                  children: [
                    // Botón de volver
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.paddingS,
                          vertical: AppSizes.paddingXS,
                        ),
                        child:  Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Volver',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Logo
                    Image.asset(
                      'assets/images/listo_logo_home.png',
                      height: 35,
                    ),
                    const Spacer( flex: 2),
                    const SizedBox(width: AppSizes.iconM),
                  ],
                ),
              ),
            ),
          ),

          // Contenido principal
          SliverFillRemaining(
            child: !_showFaceId ? _buildOrderSummary() : _buildFaceIdView(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Resumen de pedido',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                // Items del pedido
                _buildOrderItem(
                  'Café',
                  '1 x S/.5.00',
                  'assets/images/food_cafe_latte.png',
                ),

                const SizedBox(height: 16),

                _buildOrderItem(
                  'Sándwich de pavo',
                  '1 x S/.15.50',
                  'assets/images/food_sanwich.png',
                ),

                const SizedBox(height: 32),

                // Total
                const Divider(),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'S/. 20.50',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Botón Apple Pay
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _handleApplePayPress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    FontAwesomeIcons.apple,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem(String name, String price, String iconPath) {
    return Row(
      children: [
        // Contenedor para la imagen del producto
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              iconPath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  name.contains('Café') ? Icons.coffee : Icons.lunch_dining,
                  color: Colors.orange.shade600,
                  size: 30,
                );
              },
            ),
          ),
        ),


        const SizedBox(width: 16),

        // Información del producto
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFaceIdView() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animación Face ID
                AnimatedBuilder(
                  animation: _faceIdAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _faceIdAnimation.value,
                      child: AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _isProcessing ? 1.0 : _pulseAnimation.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: _isProcessing
                                    ? Colors.orange.shade100
                                    : Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _isProcessing
                                      ? AppColors.primary
                                      : Colors.blue,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                _isProcessing
                                    ? Icons.check_circle_outline
                                    : Icons.face,
                                size: 60,
                                color: _isProcessing
                                    ? AppColors.primary
                                    : Colors.blue,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),

                Text(
                  _isProcessing ? 'Procesando...' : 'Confirm with Face ID',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),

                if (!_isProcessing) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Mira tu dispositivo para autenticarte',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),

        // Botón cancelar (solo visible durante autenticación)
        if (_showFaceId && !_isProcessing)
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _showFaceId = false;
                });
                _faceIdController.reset();
                _pulseController.stop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}