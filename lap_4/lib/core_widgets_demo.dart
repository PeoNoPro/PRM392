import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CoreWidgetsDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets: Text, Image, Icon, Card, ListTile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://cdn2.tuoitre.vn/thumb_w/1200/471584752817336320/2026/5/20/doraemon-vn-1779285074240374070444-47-0-675-1200-crop-177928537170533679659.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace){
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Text('Không thể tải ảnh'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.amber,),
                title: Text('Doraemon'),
                subtitle: Text('Xem phim: Doraemon và 40 tên cướp.'),

              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
'https://aeonmall-review-rikkei.cdn.vccloud.vn/public/wp/16/events/rQPpOix3ttkVzuygfC1Nv0Os8Gd3blrCFSyhTabo.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace){
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Text('Không thể tải ảnh'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.amber,),
                title: Text('Conan'),
                subtitle: Text('Xem phim: Conan và 40 tên cướp.'),

              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://iv1cdn.vnecdn.net/giaitri/images/web/2025/08/28/crayon-shin-chan-1756375939.png?w=680&h=0&q=100&dpr=2&fit=crop&s=57pLDOB8RxiL7lBDcD74AA',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace){
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Text('Không thể tải ảnh'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.amber,),
                title: Text('Shin'),
                subtitle: Text('Xem phim: Shin và 40 tên cướp.'),

              ),
            ),
          ],
        ),
      ),
    );
  }


}