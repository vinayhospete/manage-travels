namespace manageTravel;

entity Travels {
  key ID: UUID;
  tripName: String(50) @assert.unique @mandatory;
  employee: String(50);
  status: String(20);
  tripStartDate: Date;
  tripEndDate: Date;
  priceUsd: Decimal;
  bookings: Association to many Bookings on bookings.travels = $self;
  notes: Association to Notes;
}

entity Bookings {
  key ID: UUID;
  employee: String(50);
  airlines: String(50);
  bookingDate: Date;
  flightDate: Date;
  priceUsd: Decimal;
  travels: Association to Travels;
}

entity Notes {
  key ID: UUID;
  comment: String(200) @assert.unique @mandatory;
}
