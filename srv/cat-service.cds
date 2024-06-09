using {my.bookshop as my} from '../db/data-model';
using { CV_BOOKS_N } from '../db/data-model';


service CatalogService {
    entity Books                              as projection on my.Books;
    entity Authors                            as projection on my.Authors;
    entity Banker                             as projection on my.Banker;
    entity Loans                              as projection on my.Loans;
    entity Customers                          as projection on my.Customers;
    entity Dropdown_CV_BOOKS                  as projection on CV_BOOKS_N;

    action getBooksByAuthor(authorName: String) returns array of String;
}

