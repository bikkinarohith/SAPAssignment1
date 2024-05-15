using {my.bookshop as my} from '../db/data-model';

service CatalogService {
    entity Books                              as projection on my.Books;
    entity Authors                            as projection on my.Authors;
    entity Banks                              as projection on my.Banks;
    entity Loans                              as projection on my.Loans;
    entity Customers                          as projection on my.Customers;


    // @readonly
    // entity ReadEmployeeSrv                    as projection on my.employees;
    // entity InsertEmployeeSrv                  as projection on my.employees;
    // entity UpdateEmployeeSrv                  as projection on my.employees;
    // entity DeleteEmployeeSrv                  as projection on my.employees;

}