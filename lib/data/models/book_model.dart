class BookModel {
  String? bookId;
  String? uid;
  String? owner;
  String? title;
  String? author;
  String? edition;
  String? price;
  String? imgUrl;

  BookModel(
      {this.uid,
      this.bookId,
        this.owner,
      this.title,
      this.author,
      this.edition,
      this.price,
      this.imgUrl});

  @override
  String toString() {
    return 'BookModel{uid: $uid,bookId: $bookId,owner: $owner,title: $title, author: $author, edition: $edition, price: $price, imgUrl: $imgUrl}';
  }

  BookModel.fromSnapshot(snapshot)
      :
        bookId = snapshot.key??"",
        uid = snapshot.value["uid"],
        owner = snapshot.value["owner"],
        title = snapshot.value["title"],
        author = snapshot.value["author"],
        edition = snapshot.value["edition"],
        price = snapshot.value["price"],
        imgUrl = snapshot.value["imgUrl"];
}
