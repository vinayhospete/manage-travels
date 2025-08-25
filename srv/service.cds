using { manageTravel } from '../db/schema.cds';

service manageTravelSrv {
  @odata.draft.enabled
  entity Travels as projection on manageTravel.Travels;
  entity Bookings as projection on manageTravel.Bookings;
  entity Notes as projection on manageTravel.Notes;
}