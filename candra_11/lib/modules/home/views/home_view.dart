import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    final orientation = mq.orientation;

    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum: Responsive UI')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1. MediaQuery — Informasi layar',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Lebar layar: ${width.toStringAsFixed(0)} px'),
                    Text('Tinggi layar: ${height.toStringAsFixed(0)} px'),
                    Text('Orientasi: ${orientation.name}'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Get.snackbar('Info', 'Lebar: ${width.toStringAsFixed(0)} px',
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: const Text('Tampilkan ringkasan'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxW = constraints.maxWidth;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('2. LayoutBuilder — Responsif lokal',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Lebar area sekarang: ${maxW.toStringAsFixed(0)} px'),
                        const SizedBox(height: 8),
                        if (maxW > 600)
                          Row(
                            children: [
                              Expanded(child: Container(height: 80, color: Colors.blue[100], child: const Center(child: Text('Panel A')))),
                              const SizedBox(width: 8),
                              Expanded(child: Container(height: 80, color: Colors.green[100], child: const Center(child: Text('Panel B')))),
                            ],
                          )
                        else
                          Column(
                            children: [
                              Container(height: 60, color: Colors.blue[100], child: const Center(child: Text('Panel A'))),
                              const SizedBox(height: 8),
                              Container(height: 60, color: Colors.green[100], child: const Center(child: Text('Panel B'))),
                            ],
                          )
                      ],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('3. Flexible vs Expanded', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Baris contoh:'),
                    const SizedBox(height: 8),
                    Container(
                      height: 100,
                      color: Colors.grey[200],
                      child: Row(
                        children: [

                          Container(width: 80, color: Colors.red[300], child: const Center(child: Text('Fixed\n80px', textAlign: TextAlign.center))),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              color: Colors.blue[300],
                              child: const Center(child: Text('Flexible\nflex:2\n(FlexFit.loose)', textAlign: TextAlign.center)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              color: Colors.green[400],
                              child: const Center(child: Text('Expanded\nflex:1\n(Fill rest)', textAlign: TextAlign.center)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Catatan: Flexible dengan FlexFit.loose memberi child kebebasan, Expanded memaksa ukuran.')
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('4. FittedBox — skalakan konten agar muat', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Contoh: area kecil yang harus menampung teks panjang atau ikon'),
                    const SizedBox(height: 8),
                    Container(
                      height: 80,
                      color: Colors.grey[100],
                      child: Row(
                        children: [

                          Container(
                            width: 140,
                            margin: const EdgeInsets.all(8),
                            color: Colors.orange[100],
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Ini teks sangat panjang yang dipaksa agar muat di kotak sempit',
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ),

                          Container(
                            width: 140,
                            margin: const EdgeInsets.all(8),
                            color: Colors.orange[50],
                            child: const Center(child: Text('Tanpa FittedBox', textAlign: TextAlign.center)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('5. Wrap — flow layout untuk chips/button', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Wrap akan membungkus item ke baris berikutnya bila ruang habis:'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: List.generate(12, (i) {
                        return Chip(label: Text('Tag ${i + 1}'));
                      }),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () => controller.increment(),
                child: Obx(() => Text('Counter: ${controller.counter.value}')),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
