using {
  Currency,
  managed,
  sap,
  cuid
} from '@sap/cds/common';

// namespace my.bookshop;


type stringX     : String(32);
type PhoneNumber : String(30) @assert.format: '^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$';
type Email       : String(255) @assert.format: '^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';

type Gender      : String(1) enum {
  male         = 'M';
  female       = 'F';
  nonBinary    = 'N';
  noDisclosure = 'D';
  selfDescribe = 'S';
};


type AmountT     : Decimal(15, 2) @(
  Semantics.amount.currencyCode: 'CURRENCY_CODE',
  sap.unit                     : 'CURRENCY_CODE'
);


context my.bookshop{
    entity Books : managed {
      key ID            : Integer; // Primary Key
          title         : localized String(111) @mandatory;
          descr         : localized String(1111);
          author_ID     : String;
          author_name   : Association to Authors;
          stock         : Integer;
          price         : Decimal;
          currency_code : String;
          genre_ID      : Integer;
    }


    entity Authors : managed {
      key ID           : Integer;
          name         : String(111) @mandatory;
          dateOfBirth  : Date;
          placeOfBirth : String;
          dateOfDeath  : Date;
          placeOfDeath : String;
          books        : Association to many Books on books.author_ID = $self.ID;
          
    }


    entity Banker {
      key Name            : String;
          Number_of_Books : Integer;
    }


    entity Customers : cuid {
      ID            : String(111);
      nameFirst     : String(40);
      nameMiddle    : String(40);
      nameLast      : String(40);
      nameInitials  : String(40);
      sex           : Gender;
      language      : String(1);
      phoneNumber   : PhoneNumber;
      email         : Email;
      loginName     : String(12);
      currency_code : String;
      salaryAmount  : AmountT;
      accountNumber : String(16);
      bankId        : String(20);
      bankName      : String(64);
    }


    entity Loans {  // my_bookshop_loans
      Serial_ID    : String;
      Type         : String;
      Banker       : String;
      CustomerName : String;
      Book_Name    : String;
      books      : Association to Books on books.title = $self.Book_Name;
    }
}
// @cds.persistence.exists
// entity CV_BOOKS {
//   key ID : String(111);
//   Text : String(111);
// }


@cds.persistence.exists 
Entity CV_BOOKS_N {
        ID: Integer not null  @title: 'ID' ; 
        TITLE: String(111)  @title: 'TITLE' ; 
}