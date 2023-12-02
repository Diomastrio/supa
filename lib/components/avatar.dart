import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supa/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    required this.onUpload,
  });
  final String? imageUrl;
  final void Function(String imageUrl) onUpload;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: imageUrl != null
              ? Image.network(imageUrl!, fit: BoxFit.cover)
              : Container(
                  color: Colors.teal[300],
                  child: const Center(
                    child: Text('No hay imagen'),
                  ),
                ),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
// Pick an image.
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image == null) {
              return;
            }
            final imageExtension = image.path.split('.').last.toLowerCase();
            final imageBytes = await image.readAsBytes();
            final userId = supabase.auth.currentUser!.id;
            final imagePath = '/$userId/profile';
            await supabase.storage.from('profiles').uploadBinary(
                  imagePath,
                  imageBytes,
                  fileOptions: FileOptions(
                    upsert: true,
                    contentType: 'image/$imageExtension',
                  ),
                );
            String imageUrl =
                supabase.storage.from('profiles').getPublicUrl(imagePath);
            imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
              't': DateTime.now().millisecondsSinceEpoch.toString()
            }).toString();
            onUpload(imageUrl);
          },
          child: const Text('subir'),
        ),
      ],
    );
  }
}
