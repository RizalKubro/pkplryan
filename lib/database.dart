import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:pet_shope/auth_appwrite.dart';
import 'package:pet_shope/client_appwrite.dart';
import 'package:pet_shope/todomodels.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;

  static Databases? databases;

  // Initialize the Appwrite database
  init() {
    databases = Databases(client);
  }

  // Create a new todo document in the database
  Future<bool> createTodo({
    required String title,
    required String description,
  }) async {
    databases ?? init(); // Initialize if not already
    try {
      // Retrieve userId from AuthHelper
      String? userId = await AuthHelper.instance.getUserId();

      // Check if userId is null
      if (userId == null) {
        throw Exception('User ID is null. Please log in.');
      }

      // Create a new todo document in the database
      await databases!.createDocument(
        databaseId: "66f43125001abc7c113b", // Replace with your actual databaseId
        collectionId: "66f4313a003b5f9b91f3", // Replace with your actual collectionId
        documentId: ID.unique(),
        data: {
          "title": title,
          "description": description,
          "isDone": false,
          "createdAt": DateTime.now().toIso8601String(),
          "userId": userId, // Store userId in the todo document
        },
      );
      return true;
    } catch (e) {
      rethrow; // Rethrow error to be handled elsewhere
    }
  }

  // Retrieve all todos for the current user
  Future<List<TodoModel>> getTodos() async {
    databases ?? init(); // Initialize if not already
    try {
      // Retrieve userId from AuthHelper
      String? userId = await AuthHelper.instance.getUserId();

      // Check if userId is null
      if (userId == null) {
        throw Exception('User ID is null. Please log in.');
      }

      // Fetch todos associated with the userId
      DocumentList response = await databases!.listDocuments(
        databaseId: "66f43125001abc7c113b", // Replace with your actual databaseId
        collectionId: "66f4313a003b5f9b91f3", // Replace with your actual collectionId
        queries: [
          Query.equal("userId", userId), // Query for todos that belong to the user
        ],
      );

      // Convert documents into a list of TodoModel
      return response.documents
          .map(
            (e) => TodoModel.fromJson(e.data, e.$id),
          )
          .toList();
    } catch (e) {
      rethrow; // Rethrow error to be handled elsewhere
    }
  }

  // Update an existing todo document in the database
  Future<void> updateTodo(TodoModel todo) async {
    databases ?? init(); // Initialize if not already
    try {
      // Update the document with the new data
      await databases!.updateDocument(
        databaseId: "66f43125001abc7c113b", // Replace with your actual databaseId
        collectionId: "66f4313a003b5f9b91f3", // Replace with your actual collectionId
        documentId: todo.id,
        data: {
          "title": todo.title,
          "description": todo.description,
          "isDone": todo.isDone,
          "createdAt": todo.createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(), // Handle nullable createdAt
          "userId": todo.userId,
        },
      );
    } catch (e) {
      rethrow; // Rethrow error to be handled elsewhere
    }
  }

  // Delete a todo document from the database
  Future<void> deleteTodo(String id) async {
    databases ?? init(); // Initialize if not already
    try {
      // Delete the document by its ID
      await databases!.deleteDocument(
        databaseId: "66f43125001abc7c113b", // Replace with your actual databaseId
        collectionId: "66f4313a003b5f9b91f3", // Replace with your actual collectionId
        documentId: id,
      );
    } catch (e) {
      rethrow; // Rethrow error to be handled elsewhere
    }
  }
}
