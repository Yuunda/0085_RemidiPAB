import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> articleData;
  const DetailPage({super.key, required this.articleData});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() async {
    final doc = await FirebaseFirestore.instance
        .collection('favorites')
        .doc('${user!.uid}_${widget.articleData['id']}')
        .get();
    
    if (doc.exists) {
      setState(() => isFavorite = true);
    }
  }

  void _toggleFavorite() async {
    final docRef = FirebaseFirestore.instance
        .collection('favorites')
        .doc('${user!.uid}_${widget.articleData['id']}');

    if (isFavorite) {
      await docRef.delete();
    } else {
      await docRef.set({
        'userId': user!.uid,
        'articleId': widget.articleData['id'],
        'title': widget.articleData['title'],
        'newsSite': widget.articleData['news_site'],
        'imageUrl': widget.articleData['image_url']
      });
    }
    setState(() => isFavorite = !isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Artikel'),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, 
                       color: isFavorite ? Colors.red : null),
            onPressed: _toggleFavorite,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.articleData['image_url'], width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.articleData['news_site'], style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.articleData['title'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text(widget.articleData['summary'], style: const TextStyle(fontSize: 16, height: 1.5)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}