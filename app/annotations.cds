using { appBuildCodeSrv } from '../srv/service.cds';

annotate appBuildCodeSrv.Books with @UI.HeaderInfo: { TypeName: 'Book', TypeNamePlural: 'Books', Title: { Value: isbn } };
annotate appBuildCodeSrv.Books with {
  ID @UI.Hidden @Common.Text: { $value: isbn, ![@UI.TextArrangement]: #TextOnly }
};
annotate appBuildCodeSrv.Books with @UI.Identification: [{ Value: isbn }];
annotate appBuildCodeSrv.Books with {
  categories1 @Common.ValueList: {
    CollectionPath: 'Categories',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: categories1_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'categoriesID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate appBuildCodeSrv.Books with {
  orders @Common.ValueList: {
    CollectionPath: 'Orders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: orders_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalAmount'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate appBuildCodeSrv.Books with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate appBuildCodeSrv.Books with @UI.DataPoint #author: {
  Value: author,
  Title: 'Author',
};
annotate appBuildCodeSrv.Books with {
  isbn @title: 'ISBN';
  title @title: 'Title';
  author @title: 'Author';
  publishedDate @title: 'Published Date';
  price @title: 'Price';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate appBuildCodeSrv.Books with {
  price @Measures.ISOCurrency: Currency_code
};

annotate appBuildCodeSrv.Books with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: isbn },
 { $Type: 'UI.DataField', Value: title },
 { $Type: 'UI.DataField', Value: author },
 { $Type: 'UI.DataField', Value: publishedDate },
 { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Category', Value: categories1_ID },
    { $Type: 'UI.DataField', Label: 'Order', Value: orders_ID }
];

annotate appBuildCodeSrv.Books with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: isbn },
 { $Type: 'UI.DataField', Value: title },
 { $Type: 'UI.DataField', Value: author },
 { $Type: 'UI.DataField', Value: publishedDate },
 { $Type: 'UI.DataField', Value: price },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Category', Value: categories1_ID },
    { $Type: 'UI.DataField', Label: 'Order', Value: orders_ID }
  ]
};

annotate appBuildCodeSrv.Books with {
  categories1 @Common.Text: { $value: categories1.categoriesID, ![@UI.TextArrangement]: #TextOnly };
  orders @Common.Text: { $value: orders.orderId, ![@UI.TextArrangement]: #TextOnly }
};

annotate appBuildCodeSrv.Books with {
  categories @Common.Label: 'Categories';
  categories1 @Common.Label: 'Category';
  orders @Common.Label: 'Order'
};

annotate appBuildCodeSrv.Books with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#author' }
];

annotate appBuildCodeSrv.Books with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appBuildCodeSrv.Books with @UI.SelectionFields: [
  categories1_ID,
  orders_ID
];

annotate appBuildCodeSrv.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: categoriesID } };
annotate appBuildCodeSrv.Categories with {
  ID @UI.Hidden @Common.Text: { $value: categoriesID, ![@UI.TextArrangement]: #TextOnly }
};
annotate appBuildCodeSrv.Categories with @UI.Identification: [{ Value: categoriesID }];
annotate appBuildCodeSrv.Categories with {
  books1 @Common.ValueList: {
    CollectionPath: 'Books',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: books1_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'isbn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'author'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'publishedDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate appBuildCodeSrv.Categories with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate appBuildCodeSrv.Categories with {
  categoriesID @title: 'ID';
  name @title: 'Name';
  description @title: 'Description';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate appBuildCodeSrv.Categories with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: categoriesID },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Label: 'Book', Value: books1_ID }
];

annotate appBuildCodeSrv.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: categoriesID },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Book', Value: books1_ID }
  ]
};

annotate appBuildCodeSrv.Categories with {
  books1 @Common.Text: { $value: books1.isbn, ![@UI.TextArrangement]: #TextOnly }
};

annotate appBuildCodeSrv.Categories with {
  books @Common.Label: 'Books';
  books1 @Common.Label: 'Book'
};

annotate appBuildCodeSrv.Categories with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate appBuildCodeSrv.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appBuildCodeSrv.Categories with @UI.SelectionFields: [
  books1_ID
];

annotate appBuildCodeSrv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: customerId } };
annotate appBuildCodeSrv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: customerId, ![@UI.TextArrangement]: #TextOnly }
};
annotate appBuildCodeSrv.Customers with @UI.Identification: [{ Value: customerId }];
annotate appBuildCodeSrv.Customers with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate appBuildCodeSrv.Customers with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate appBuildCodeSrv.Customers with {
  customerId @title: 'Customer ID';
  firstName @title: 'First Name';
  lastName @title: 'Last Name';
  email @title: 'Email';
  phone @title: 'Phone';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate appBuildCodeSrv.Customers with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: firstName },
 { $Type: 'UI.DataField', Value: lastName },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: phone }
];

annotate appBuildCodeSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: firstName },
 { $Type: 'UI.DataField', Value: lastName },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: phone },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate appBuildCodeSrv.Customers with {
  orders @Common.Label: 'Orders'
};

annotate appBuildCodeSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName' }
];

annotate appBuildCodeSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appBuildCodeSrv.Customers with @UI.SelectionFields: [
  customerId
];

annotate appBuildCodeSrv.Orders with @UI.HeaderInfo: { TypeName: 'Order', TypeNamePlural: 'Orders', Title: { Value: orderId } };
annotate appBuildCodeSrv.Orders with {
  ID @UI.Hidden @Common.Text: { $value: orderId, ![@UI.TextArrangement]: #TextOnly }
};
annotate appBuildCodeSrv.Orders with @UI.Identification: [{ Value: orderId }];
annotate appBuildCodeSrv.Orders with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate appBuildCodeSrv.Orders with @UI.DataPoint #orderDate: {
  Value: orderDate,
  Title: 'Order Date',
};
annotate appBuildCodeSrv.Orders with {
  orderId @title: 'Order ID';
  orderDate @title: 'Order Date';
  totalAmount @title: 'Total Amount';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate appBuildCodeSrv.Orders with {
  totalAmount @Measures.ISOCurrency: Currency_code
};

annotate appBuildCodeSrv.Orders with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: orderId },
 { $Type: 'UI.DataField', Value: orderDate },
 { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate appBuildCodeSrv.Orders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: orderId },
 { $Type: 'UI.DataField', Value: orderDate },
 { $Type: 'UI.DataField', Value: totalAmount },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate appBuildCodeSrv.Orders with {
  customer @Common.Text: { $value: customer.customerId, ![@UI.TextArrangement]: #TextOnly }
};

annotate appBuildCodeSrv.Orders with {
  customer @Common.Label: 'Customer';
  books @Common.Label: 'Books'
};

annotate appBuildCodeSrv.Orders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderDate' }
];

annotate appBuildCodeSrv.Orders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appBuildCodeSrv.Orders with @UI.SelectionFields: [
  customer_ID
];

annotate appBuildCodeSrv.Reviews with @UI.HeaderInfo: { TypeName: 'Review', TypeNamePlural: 'Reviews', Title: { Value: reviewId } };
annotate appBuildCodeSrv.Reviews with {
  ID @UI.Hidden @Common.Text: { $value: reviewId, ![@UI.TextArrangement]: #TextOnly }
};
annotate appBuildCodeSrv.Reviews with @UI.Identification: [{ Value: reviewId }];
annotate appBuildCodeSrv.Reviews with {
  book @Common.ValueList: {
    CollectionPath: 'Books',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: book_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'isbn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'author'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'publishedDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate appBuildCodeSrv.Reviews with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate appBuildCodeSrv.Reviews with @UI.DataPoint #rating: {
  Value: rating,
  Title: 'Rating',
};
annotate appBuildCodeSrv.Reviews with {
  reviewId @title: 'Review ID';
  reviewText @title: 'Review Text';
  rating @title: 'Rating';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate appBuildCodeSrv.Reviews with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: reviewId },
 { $Type: 'UI.DataField', Value: reviewText },
 { $Type: 'UI.DataField', Value: rating },
    { $Type: 'UI.DataField', Label: 'Book', Value: book_ID },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate appBuildCodeSrv.Reviews with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: reviewId },
 { $Type: 'UI.DataField', Value: reviewText },
 { $Type: 'UI.DataField', Value: rating },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Book', Value: book_ID },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate appBuildCodeSrv.Reviews with {
  book @Common.Text: { $value: book.isbn, ![@UI.TextArrangement]: #TextOnly };
  customer @Common.Text: { $value: customer.customerId, ![@UI.TextArrangement]: #TextOnly }
};

annotate appBuildCodeSrv.Reviews with {
  book @Common.Label: 'Book';
  customer @Common.Label: 'Customer'
};

annotate appBuildCodeSrv.Reviews with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#rating' }
];

annotate appBuildCodeSrv.Reviews with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appBuildCodeSrv.Reviews with @UI.SelectionFields: [
  book_ID,
  customer_ID
];

