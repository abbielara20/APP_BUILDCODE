namespace appBuildCode;
using { cuid, managed, Currency } from '@sap/cds/common';

@assert.unique: { isbn: [isbn] }
entity Books : cuid, managed {
  isbn: String(13) @mandatory;
  title: String(100);
  author: String(100);
  publishedDate: Date;
  price: Decimal(10,2);
  Currency: Currency;
  categories: Association to many Categories on categories.books1 = $self;
  categories1: Association to Categories;
  orders: Association to Orders;
}

@assert.unique: { categoriesID: [categoriesID] }
entity Categories : cuid, managed {
  categoriesID: Integer @mandatory;
  name: String(50);
  description: String(200);
  books: Association to many Books on books.categories1 = $self;
  books1: Association to Books;
}

@assert.unique: { customerId: [customerId] }
entity Customers : cuid, managed {
  customerId: Integer @mandatory;
  firstName: String(50);
  lastName: String(50);
  email: String(100);
  phone: String(15);
  orders: Association to many Orders on orders.customer = $self;
}

@assert.unique: { orderId: [orderId] }
entity Orders : cuid, managed {
  orderId: Integer @mandatory;
  orderDate: Date;
  totalAmount: Decimal(10,2);
  Currency: Currency;
  customer: Association to Customers;
  books: Association to many Books on books.orders = $self;
}

@assert.unique: { reviewId: [reviewId] }
entity Reviews : cuid, managed {
  reviewId: Integer @mandatory;
  reviewText: String(500);
  rating: Integer;
  book: Association to Books;
  customer: Association to Customers;
}

