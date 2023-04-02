class BookModel {
  String? bookId;
  String? uid;
  String? title;
  String? author;
  String? edition;
  String? price;
  String? imgUrl;

  BookModel(
      {this.uid,
      this.bookId,
      this.title,
      this.author,
      this.edition,
      this.price,
      this.imgUrl});

  @override
  String toString() {
    return 'BookModel{uid: $uid,bookId: $bookId,title: $title, author: $author, edition: $edition, price: $price, imgUrl: $imgUrl}';
  }

  BookModel.fromSnapshot(snapshot)
      :
        uid = snapshot.key??"",
        bookId = snapshot.value["bookId"],
        title = snapshot.value["title"],
        author = snapshot.value["author"],
        edition = snapshot.value["edition"],
        price = snapshot.value["price"],
        imgUrl = snapshot.value["imgUrl"];
}
