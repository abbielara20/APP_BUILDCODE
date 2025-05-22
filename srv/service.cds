using {appBuildCode as my} from '../db/schema.cds';

@path: '/service/appBuildCode'
service appBuildCodeService {
  function fnCrud(action : String) returns String;
  
  @odata.draft.enabled
  entity Books      as projection on my.Books;

  @odata.draft.enabled
  entity Categories as projection on my.Categories;

  @odata.draft.enabled
  entity Customers  as projection on my.Customers;

  @odata.draft.enabled
  entity Orders     as projection on my.Orders;

  @odata.draft.enabled
  entity Reviews    as projection on my.Reviews;
}
