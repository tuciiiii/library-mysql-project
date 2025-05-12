# 📚 Library MySQL Project

## 📌 Overview

This project is a relational database system designed to manage and store data related to books, magazines, authors, publishers, genres and users. It supports tracking reading progress, storing user ratings and ensuring data consistency through stored procedures and triggers.

---

## ✨ Features

- Manage books, magazines, authors, genres and publishers.
- Record and track user reading progress by page count.
- Enable users to rate books and magazines.
- Automatic updates via triggers and stored procedures.
- Many-to-many relationships handled via junction tables.

---

## 🧩 Database Schema

### **Main Entities**
- `Books`
- `Magazines`
- `Authors`
- `Genres`
- `Publishers`
- `Users`

### **Relationships and Supporting Tables**

- `AuthorsBooks`: Links authors and books (many-to-many).
- `GenresBooks`: Links genres and books (many-to-many).
- `GenresMagazines`: Links genres and magazines (many-to-many).
- `UserReadings`: Tracks what users have read and how many pages.
- `Ratings`: Stores user ratings for books or magazines.
  
### **Table Descriptions**
- **Books**: Title, page count, publication year, author(s), publisher.
- **Magazines**: Title, volume, year and publisher.
- **Authors**: Linked to books through `AuthorsBooks`.
- **Genres**: Linked to books and magazines via `GenresBooks` and `GenresMagazines`.
- **Users**: Username, password, email, last activity.
- **Publishers**: Information about entities that publish books/magazines.

---

## 🛠️ Technologies Used

- **Database**: MySQL  
- **Language**: SQL (queries, triggers, stored procedures)  
- **Version Control**: GitHub

---

## 📊 ER Diagram

> The database structure is based on the Entity-Relationship (ER) model.

---

## 🚀 Getting Started

1. Clone this repository.
2. Import the SQL schema into your MySQL server.
3. Review and run the sample queries, triggers and procedures provided.

---


