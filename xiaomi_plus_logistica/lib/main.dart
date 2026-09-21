import 'package:flutter/material.dart';

void main() => runApp(const XiaomiPlusLogisticaApp());

class XP {
  static const orange = Color(0xFFFF5A00);
  static const black = Color(0xFF0B0B0D);
  static const panel = Color(0xFF17171A);
  static const panel2 = Color(0xFF232327);
  static const soft = Color(0xFFA6A6AD);
  static const success = Color(0xFF3CCB7F);
}

enum DeliveryStatus { awaitingPickup, pickedUp, onRoute, delivered }

String statusLabel(DeliveryStatus status) {
  switch (status) {
    case DeliveryStatus.awaitingPickup:
      return 'Aguardando coleta';
    case DeliveryStatus.pickedUp:
      return 'Coletado';
    case DeliveryStatus.onRoute:
      return 'Em rota';
    case DeliveryStatus.delivered:
      return 'Entregue';
  }
}

class Delivery {
  Delivery({
    required this.id,
    required this.customer,
    required this.phone,
    required this.product,
    required this.variant,
    required this.imei,
    required this.serial,
    required this.address,
    required this.neighborhood,
    required this.distance,
    required this.eta,
    required this.status,
  });

  final String id;
  final String customer;
  final String phone;
  final String product;
  final String variant;
  final String imei;
  final String serial;
  final String address;
  final String neighborhood;
  final String distance;
  final String eta;
  DeliveryStatus status;
}

final deliveries = <Delivery>[
  Delivery(
    id: 'XP78421',
    customer: 'Carlos A. Silva',
    phone: '(21) 98877-6655',
    product: 'iPhone 17 Pro Max',
    variant: '256 GB • Titânio Preto',
    imei: '358742360987412',
    serial: 'DX4N2F0LJ7',
    address: 'Rua Visconde de Pirajá, 550',
    neighborhood: 'Ipanema',
    distance: '3,4 km',
    eta: '18 min',
    status: DeliveryStatus.awaitingPickup,
  ),
  Delivery(
    id: 'XP78420',
    customer: 'Mariana Souza',
    phone: '(21) 97712-3301',
    product: 'Xiaomi 14T',
    variant: '512 GB • Preto',
    imei: '860221049554910',
    serial: 'XM14T93A1',
    address: 'Rua Conde de Bonfim, 411',
    neighborhood: 'Tijuca',
    distance: '21 km',
    eta: '42 min',
    status: DeliveryStatus.delivered,
  ),
  Delivery(
    id: 'XP78419',
    customer: 'João P. Nascimento',
    phone: '(21) 96681-1920',
    product: 'Redmi Note 13',
    variant: '256 GB • Azul',
    imei: '868001047338210',
    serial: 'RN13AZ298',
    address: 'Rua Dias da Cruz, 278',
    neighborhood: 'Méier',
    distance: '28 km',
    eta: '55 min',
    status: DeliveryStatus.onRoute,
  ),
  Delivery(
    id: 'XP78418',
    customer: 'Beatriz Lima',
    phone: '(21) 95543-7021',
    product: 'Realme GT 7',
    variant: '512 GB • Laranja',
    imei: '867094031234987',
    serial: 'RMGT7X114',
    address: 'Av. das Américas, 4666',
    neighborhood: 'Barra da Tijuca',
    distance: '25 km',
    eta: '48 min',
    status: DeliveryStatus.pickedUp,
  ),
];

class XiaomiPlusLogisticaApp extends StatelessWidget {
  const XiaomiPlusLogisticaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xiaomi Plus Logística',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: XP.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: XP.orange,
          brightness: Brightness.dark,
        ).copyWith(primary: XP.orange, secondary: XP.orange, surface: XP.panel),
        appBarTheme: const AppBarTheme(
          backgroundColor: XP.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: XP.panel,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: XP.orange),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: XP.orange,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(54),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFF111114),
          indicatorColor: XP.orange.withOpacity(.16),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 84});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: XP.orange,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [BoxShadow(color: XP.orange.withOpacity(.28), blurRadius: 24)],
      ),
      child: Text(
        'XP',
        style: TextStyle(
          color: Colors.white,
          fontSize: size * .34,
          fontWeight: FontWeight.w900,
          letterSpacing: -2,
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
          children: [
            const Center(child: BrandLogo(size: 96)),
            const SizedBox(height: 22),
            const Text(
              'XIAOMI PLUS',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, letterSpacing: 1.8),
            ),
            const Text(
              'LOGÍSTICA',
              textAlign: TextAlign.center,
              style: TextStyle(color: XP.orange, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 2),
            ),
            const SizedBox(height: 8),
            const Text('Tecnologia em movimento.',
                textAlign: TextAlign.center, style: TextStyle(color: XP.soft)),
            const SizedBox(height: 40),
            const TextField(
              decoration: InputDecoration(
                labelText: 'E-mail ou matrícula',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              obscureText: hide,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => hide = !hide),
                  icon: Icon(hide ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                ),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ShellScreen()),
              ),
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 34),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Color(0xFF35180A), Color(0xFF111114)],
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.local_shipping_outlined, color: XP.orange, size: 38),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Do nosso estoque até as suas mãos, com rastreio e segurança.',
                      style: TextStyle(fontWeight: FontWeight.w700, height: 1.35),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const DeliveriesScreen(),
      const OperationsMapScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), label: 'Entregas'),
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Mapa'),
          NavigationDestination(icon: Icon(Icons.person_outline_rounded), label: 'Perfil'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget metric(String value, String label, IconData icon, {bool accent = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: accent ? XP.orange : XP.panel,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: accent ? Colors.white : XP.soft, size: 20),
            const SizedBox(height: 10),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
            Text(label, style: TextStyle(color: accent ? Colors.white : XP.soft, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final route = deliveries.where((e) => e.status == DeliveryStatus.onRoute).length;
    final waiting = deliveries.where((e) => e.status == DeliveryStatus.awaitingPickup).length;
    final done = deliveries.where((e) => e.status == DeliveryStatus.delivered).length;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, operação 👋', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            Text('Vamos entregar tecnologia hoje?', style: TextStyle(fontSize: 12, color: XP.soft)),
          ],
        ),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.notifications_none_rounded))],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Row(
            children: [
              metric(deliveries.length.toString(), 'Entregas hoje', Icons.local_shipping_outlined, accent: true),
              const SizedBox(width: 10),
              metric(route.toString(), 'Em rota', Icons.route_outlined),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              metric(waiting.toString(), 'Aguardando coleta', Icons.inventory_2_outlined),
              const SizedBox(width: 10),
              metric(done.toString(), 'Concluídas', Icons.verified_outlined),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(colors: [Color(0xFF3A1A0A), Color(0xFF151518)]),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cada entrega faz parte de algo maior.',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                      SizedBox(height: 6),
                      Text('Produtos de alto valor com controle de ponta a ponta.',
                          style: TextStyle(color: XP.soft, fontSize: 12)),
                    ],
                  ),
                ),
                Icon(Icons.smartphone_rounded, color: XP.orange, size: 54),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('Últimas entregas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          ...deliveries.map((delivery) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DeliveryCard(
                  delivery: delivery,
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DeliveryDetailScreen(delivery: delivery)),
                    );
                    setState(() {});
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key, required this.delivery, required this.onTap});
  final Delivery delivery;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: XP.panel, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 60,
              decoration: BoxDecoration(color: XP.panel2, borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.smartphone_rounded, size: 31),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(delivery.customer, style: const TextStyle(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 3),
                  Text(delivery.product, style: const TextStyle(color: XP.soft, fontSize: 12)),
                  Text(delivery.neighborhood + ' • ' + delivery.distance,
                      style: const TextStyle(color: XP.soft, fontSize: 12)),
                ],
              ),
            ),
            StatusPill(status: delivery.status),
          ],
        ),
      ),
    );
  }
}

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.status});
  final DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    final color = status == DeliveryStatus.delivered
        ? XP.success
        : status == DeliveryStatus.onRoute
            ? XP.orange
            : status == DeliveryStatus.pickedUp
                ? Colors.blueAccent
                : Colors.amber;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(color: color.withOpacity(.14), borderRadius: BorderRadius.circular(999)),
      child: Text(statusLabel(status),
          style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 10)),
    );
  }
}

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  DeliveryStatus? filter;

  @override
  Widget build(BuildContext context) {
    final items = filter == null ? deliveries : deliveries.where((e) => e.status == filter).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Entregas', style: TextStyle(fontWeight: FontWeight.w900))),
      body: Column(
        children: [
          SizedBox(
            height: 46,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                filterChip('Todas', null),
                filterChip('Aguardando', DeliveryStatus.awaitingPickup),
                filterChip('Coletadas', DeliveryStatus.pickedUp),
                filterChip('Em rota', DeliveryStatus.onRoute),
                filterChip('Entregues', DeliveryStatus.delivered),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) => DeliveryCard(
                delivery: items[i],
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DeliveryDetailScreen(delivery: items[i])),
                  );
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterChip(String label, DeliveryStatus? value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: filter == value,
        selectedColor: XP.orange,
        backgroundColor: XP.panel,
        onSelected: (_) => setState(() => filter = value),
      ),
    );
  }
}

class DeliveryDetailScreen extends StatefulWidget {
  const DeliveryDetailScreen({super.key, required this.delivery});
  final Delivery delivery;

  @override
  State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final d = widget.delivery;
    return Scaffold(
      appBar: AppBar(title: Text('Entrega #' + d.id, style: const TextStyle(fontWeight: FontWeight.w900))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Detalhes da entrega', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              StatusPill(status: d.status),
            ],
          ),
          const SizedBox(height: 16),
          box(Column(
            children: [
              info(Icons.person_outline_rounded, d.customer, d.phone),
              const Divider(height: 26),
              info(Icons.smartphone_rounded, d.product, d.variant),
              const Divider(height: 26),
              info(Icons.qr_code_2_rounded, 'IMEI ' + d.imei, 'SN: ' + d.serial),
            ],
          )),
          const SizedBox(height: 12),
          box(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Endereço de entrega', style: TextStyle(color: XP.soft, fontSize: 12)),
              const SizedBox(height: 7),
              Text(d.address, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              Text(d.neighborhood + ' • Rio de Janeiro - RJ', style: const TextStyle(color: XP.soft)),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.navigation_outlined),
                label: const Text('Abrir no Maps'),
              ),
            ],
          )),
          const SizedBox(height: 12),
          box(const Row(
            children: [
              Icon(Icons.shield_outlined, color: XP.orange),
              SizedBox(width: 12),
              Expanded(
                child: Text('Pedido protegido • conferência por IMEI/serial',
                    style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ],
          )),
          const SizedBox(height: 12),
          box(Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Código da encomenda', style: TextStyle(color: XP.soft, fontSize: 12)),
                    Text('#' + d.id, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                    const Text('Escaneie no momento da coleta.',
                        style: TextStyle(color: XP.soft, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.qr_code_2_rounded, size: 80),
            ],
          )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (d.status == DeliveryStatus.awaitingPickup) {
                setState(() => d.status = DeliveryStatus.pickedUp);
                return;
              }
              if (d.status == DeliveryStatus.pickedUp) {
                setState(() => d.status = DeliveryStatus.onRoute);
              }
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => TrackingScreen(delivery: d)),
              );
              setState(() {});
            },
            child: Text(
              d.status == DeliveryStatus.awaitingPickup
                  ? 'Confirmar coleta'
                  : d.status == DeliveryStatus.pickedUp
                      ? 'Iniciar rota'
                      : d.status == DeliveryStatus.onRoute
                          ? 'Acompanhar entrega'
                          : 'Ver comprovante',
            ),
          ),
        ],
      ),
    );
  }

  Widget box(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: XP.panel, borderRadius: BorderRadius.circular(20)),
        child: child,
      );

  Widget info(IconData icon, String title, String subtitle) => Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: XP.panel2, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: XP.orange),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                Text(subtitle, style: const TextStyle(color: XP.soft, fontSize: 12)),
              ],
            ),
          ),
        ],
      );
}

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key, required this.delivery});
  final Delivery delivery;

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    final d = widget.delivery;
    return Scaffold(
      appBar: AppBar(title: const Text('Entrega em andamento', style: TextStyle(fontWeight: FontWeight.w900))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(colors: [Color(0xFF1F2933), Color(0xFF0E1218)]),
            ),
            child: CustomPaint(
              painter: RoutePainter(),
              child: Stack(
                children: [
                  const Positioned(left: 28, top: 28, child: MapTag(text: 'Santa Cruz')),
                  Positioned(right: 28, top: 70, child: MapTag(text: d.neighborhood)),
                  const Positioned(
                    left: 90,
                    bottom: 40,
                    child: CircleAvatar(
                      backgroundColor: XP.orange,
                      child: Icon(Icons.delivery_dining_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          box(const Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: XP.orange,
                child: Icon(Icons.person_rounded, color: Colors.white),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rafael Oliveira', style: TextStyle(fontWeight: FontWeight.w900)),
                    Text('Entregador • Moto', style: TextStyle(color: XP.soft, fontSize: 12)),
                  ],
                ),
              ),
              Icon(Icons.phone_outlined),
            ],
          )),
          const SizedBox(height: 12),
          box(Row(
            children: [
              const Icon(Icons.schedule_rounded, color: XP.orange, size: 32),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Chegada estimada', style: TextStyle(color: XP.soft, fontSize: 12)),
                  Text(d.eta, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                  Text(d.distance + ' de distância', style: const TextStyle(color: XP.soft, fontSize: 12)),
                ],
              ),
            ],
          )),
          const SizedBox(height: 16),
          step('Pedido separado', true),
          step('Coletado na loja', true),
          step('Em rota para entrega', true),
          step('Entregue ao cliente', d.status == DeliveryStatus.delivered),
          step('Código do recebedor validado', d.status == DeliveryStatus.delivered),
          const SizedBox(height: 18),
          if (d.status != DeliveryStatus.delivered)
            ElevatedButton.icon(
              onPressed: () => setState(() => d.status = DeliveryStatus.delivered),
              icon: const Icon(Icons.verified_outlined),
              label: const Text('Confirmar entrega'),
            )
          else
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: XP.success.withOpacity(.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(Icons.verified_rounded, color: XP.success),
                  SizedBox(width: 10),
                  Text('Entrega concluída e registrada.',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget box(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: XP.panel, borderRadius: BorderRadius.circular(20)),
        child: child,
      );

  Widget step(String text, bool done) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            Icon(
              done ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: done ? XP.orange : XP.soft,
            ),
            const SizedBox(width: 10),
            Text(text, style: TextStyle(color: done ? Colors.white : XP.soft)),
          ],
        ),
      );
}

class MapTag extends StatelessWidget {
  const MapTag({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.75),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded, size: 16, color: XP.orange),
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
    );
  }
}

class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 36) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += 36) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final route = Paint()
      ..color = XP.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(size.width * .2, size.height * .82)
      ..cubicTo(size.width * .28, size.height * .55, size.width * .55, size.height * .7,
          size.width * .54, size.height * .45)
      ..cubicTo(size.width * .53, size.height * .25, size.width * .72, size.height * .34,
          size.width * .8, size.height * .18);
    canvas.drawPath(path, route);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OperationsMapScreen extends StatelessWidget {
  const OperationsMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa operacional', style: TextStyle(fontWeight: FontWeight.w900))),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF17212A), Color(0xFF090C10)]),
              ),
              child: CustomPaint(painter: RoutePainter()),
            ),
          ),
          const Positioned(left: 42, top: 95, child: MapTag(text: 'Santa Cruz')),
          const Positioned(right: 40, top: 190, child: MapTag(text: 'Tijuca')),
          const Positioned(left: 85, top: 330, child: MapTag(text: 'Méier')),
          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: XP.panel, borderRadius: BorderRadius.circular(22)),
              child: const Text(
                'Mapa demonstrativo. Próxima etapa: Google Maps ou Mapbox com GPS em tempo real.',
                style: TextStyle(color: XP.soft, height: 1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil', style: TextStyle(fontWeight: FontWeight.w900))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: XP.panel, borderRadius: BorderRadius.circular(24)),
            child: const Row(
              children: [
                BrandLogo(size: 62),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Xiaomi Plus', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                      Text('Operação logística • Rio de Janeiro',
                          style: TextStyle(color: XP.soft, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          profileTile(Icons.person_outline_rounded, 'Dados da conta', 'Nome, e-mail e matrícula'),
          profileTile(Icons.notifications_outlined, 'Notificações', 'Alertas de novas entregas'),
          profileTile(Icons.shield_outlined, 'Segurança', 'Biometria e acesso'),
          profileTile(Icons.palette_outlined, 'Aparência', 'Tema Xiaomi Plus'),
          profileTile(Icons.help_outline_rounded, 'Ajuda', 'Suporte e treinamento'),
        ],
      ),
    );
  }

  Widget profileTile(IconData icon, String title, String subtitle) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: XP.panel, borderRadius: BorderRadius.circular(18)),
        child: ListTile(
          leading: Icon(icon, color: XP.orange),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text(subtitle, style: const TextStyle(color: XP.soft, fontSize: 12)),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),
      );
}
