import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class Book {
  final int id;
  final String name;
  final String bookCode;
  final String creator;

  Book({required this.id, required this.name, required this.bookCode, required this.creator});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: int.parse(json['id']),
      name: json['nama_buku'],
      bookCode: json['kode_buku'],
      creator: json['pembuat'],
    );
  }
}

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/read.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> createBook(Book book) async {
    await http.post(Uri.parse('$baseUrl/create.php'), body: {
      'nama_buku': book.name,
      'kode_buku': book.bookCode,
      'pembuat': book.creator,
    });
  }

  Future<void> updateBook(Book book) async {
    await http.post(Uri.parse('$baseUrl/update.php'), body: {
      'id': book.id.toString(),
      'nama_buku': book.name,
      'kode_buku': book.bookCode,
      'pembuat': book.creator,
    });
  }

  Future<void> deleteBook(int bookId) async {
    await http.post(Uri.parse('$baseUrl/delete.php'), body: {'id': bookId.toString()});
  }
}


class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final ApiService apiService = ApiService(baseUrl: 'http://192.168.1.7/crudAPI');

  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    refreshBooks();
  }

  Future<void> refreshBooks() async {
    setState(() {
      books = apiService.fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1450A3),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Immobile',
          style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff191D88),
        ),
      body: FutureBuilder(
        future: books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Book> bookList = snapshot.data as List<Book>;
            return ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookList[index].name),
                  subtitle: Text(bookList[index].bookCode),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await apiService.deleteBook(bookList[index].id);
                      refreshBooks();
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBookPage(apiService: apiService, refreshBooks: refreshBooks)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddBookPage extends StatefulWidget {
  final ApiService apiService;
  final Function refreshBooks;

  AddBookPage({required this.apiService, required this.refreshBooks});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bookCodeController = TextEditingController();
  final TextEditingController creatorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama Buku'),
            ),
            TextField(
              controller: bookCodeController,
              decoration: InputDecoration(labelText: 'Kode Buku'),
            ),
            TextField(
              controller: creatorController,
              decoration: InputDecoration(labelText: 'Pembuat'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Book newBook = Book(
                  id: 0, // ID akan diberikan oleh server setelah penyimpanan
                  name: nameController.text,
                  bookCode: bookCodeController.text,
                  creator: creatorController.text,
                );
                await widget.apiService.createBook(newBook);
                widget.refreshBooks();
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
