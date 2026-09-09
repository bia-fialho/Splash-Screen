import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LupTok',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 51, 12, 9),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '../assets/imagens/logo.png',
            width: 150,
            height: 150,
            color: const Color.fromARGB(255, 255, 252, 245),
          ),

          const SizedBox(height: 16),

        ],
      ),
    ),
  );
}
}

class AppInfo{
  final String nome;
  final String descricao;
  final IconData icone;

  const AppInfo({
    required this.nome,
    required this.descricao,
    required this.icone,
  });

}

final List<AppInfo> meusApps=[
 AppInfo(
  nome: 'Calculadora de Gasolina',
  descricao: 'Calcula litros e custo de uma viagem',
  icone: Icons.local_gas_station,
 ),
 AppInfo(
  nome:'Calculadora de Churrasco',
  descricao: 'Calcula carne, bebida e carvão',
  icone: Icons.outdoor_grill, 
 )
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LupTok"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'LupTok',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text ('Início'),
              onTap: () => Navigator.pop(context),
            ),
             ListTile(
              leading: const Icon(Icons.person),
              title: const Text ('Perfil'),
              onTap: () => Navigator.pop(context),
            ),
             ListTile(
              leading: const Icon(Icons.logout),
              title: const Text ('Sair'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        )
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95, 
          ),
          itemCount: meusApps.length,
          itemBuilder: (context, indice){
            final app = meusApps[indice];
            return Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      app.icone,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary
                    ),
                    SizedBox(height: 8,),
                    Text(
                      app.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      )
                    ),
                    SizedBox(height: 4,),
                    Text(
                      app.descricao,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}