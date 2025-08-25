using { manageTravelSrv } from '../../srv/service.cds';

annotate manageTravelSrv.Travels with {
  notes @Common.ValueList: {
    CollectionPath: 'Notes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: notes_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'comment'
      },
    ],
  }
};
annotate manageTravelSrv.Travels with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate manageTravelSrv.Travels with @UI.DataPoint #priceUsd: {
  Value: priceUsd,
  Title: 'Price Usd',
};
annotate manageTravelSrv.Travels with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#priceUsd', ID: 'PriceUsd' }
];
annotate manageTravelSrv.Travels with @UI.HeaderInfo: {
  TypeName: 'Travel',
  TypeNamePlural: 'Travels',
  Title: { Value: tripName }
};
annotate manageTravelSrv.Travels with {
  ID @UI.Hidden
};
annotate manageTravelSrv.Travels with @UI.Identification: [{ Value: tripName }];
annotate manageTravelSrv.Travels with {
  tripName @Common.Label: 'Trip Name';
  employee @Common.Label: 'Employee';
  status @Common.Label: 'Status';
  tripStartDate @Common.Label: 'Trip Start Date';
  tripEndDate @Common.Label: 'Trip End Date';
  priceUsd @Common.Label: 'Price Usd';
  bookings @Common.Label: 'Bookings';
  notes @Common.Label: 'Note'
};
annotate manageTravelSrv.Travels with {
  ID @Common.Text: { $value: tripName, ![@UI.TextArrangement]: #TextOnly };
  notes @Common.Text: { $value: notes.comment, ![@UI.TextArrangement]: #TextOnly };
};
annotate manageTravelSrv.Travels with @UI.SelectionFields : [
 tripName,
 status,
 priceUsd
];
annotate manageTravelSrv.Travels with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: tripName },
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: tripStartDate },
    { $Type: 'UI.DataField', Value: tripEndDate },
    { $Type: 'UI.DataField', Value: priceUsd },
    { $Type: 'UI.DataField', Label: 'Note', Value: notes_ID }
];
annotate manageTravelSrv.Travels with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: tripName },
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: tripStartDate },
    { $Type: 'UI.DataField', Value: tripEndDate },
    { $Type: 'UI.DataField', Value: priceUsd },
    { $Type: 'UI.DataField', Label: 'Note', Value: notes_ID }
]};
annotate manageTravelSrv.Bookings with @UI.LineItem #Travels_bookings: [
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: airlines },
    { $Type: 'UI.DataField', Value: bookingDate },
    { $Type: 'UI.DataField', Value: flightDate },
    { $Type: 'UI.DataField', Value: priceUsd }
];
annotate manageTravelSrv.Travels with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'bookings', Label: 'Bookings', Target: 'bookings/@UI.LineItem#Travels_bookings' }
];
annotate manageTravelSrv.Bookings with {
  travels @Common.ValueList: {
    CollectionPath: 'Travels',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: travels_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'tripName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'employee'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'tripStartDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'tripEndDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priceUsd'
      },
    ],
  }
};
annotate manageTravelSrv.Bookings with @UI.DataPoint #priceUsd: {
  Value: priceUsd,
  Title: 'Price Usd',
};
annotate manageTravelSrv.Bookings with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#priceUsd', ID: 'PriceUsd' }
];
annotate manageTravelSrv.Bookings with @UI.HeaderInfo: {
  TypeName: 'Booking',
  TypeNamePlural: 'Bookings'
};
annotate manageTravelSrv.Bookings with {
  employee @Common.Label: 'Employee';
  airlines @Common.Label: 'Airlines';
  bookingDate @Common.Label: 'Booking Date';
  flightDate @Common.Label: 'Flight Date';
  priceUsd @Common.Label: 'Price Usd';
  travels @Common.Label: 'Travel'
};
annotate manageTravelSrv.Bookings with {
  travels @Common.Text: { $value: travels.tripName, ![@UI.TextArrangement]: #TextOnly };
};
annotate manageTravelSrv.Bookings with @UI.SelectionFields: [
  travels_ID
];
annotate manageTravelSrv.Bookings with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: airlines },
    { $Type: 'UI.DataField', Value: bookingDate },
    { $Type: 'UI.DataField', Value: flightDate },
    { $Type: 'UI.DataField', Value: priceUsd },
    { $Type: 'UI.DataField', Label: 'Travel', Value: travels_ID }
];
annotate manageTravelSrv.Bookings with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: airlines },
    { $Type: 'UI.DataField', Value: bookingDate },
    { $Type: 'UI.DataField', Value: flightDate },
    { $Type: 'UI.DataField', Value: priceUsd },
    { $Type: 'UI.DataField', Label: 'Travel', Value: travels_ID }
]};
annotate manageTravelSrv.Bookings with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate manageTravelSrv.Notes with @UI.HeaderInfo: {
  TypeName: 'Note',
  TypeNamePlural: 'Notes',
  Title: { Value: comment }
};
annotate manageTravelSrv.Notes with {
  ID @UI.Hidden
};
annotate manageTravelSrv.Notes with @UI.Identification: [{ Value: comment }];
annotate manageTravelSrv.Notes with {
  comment @Common.Label: 'Comment'
};
annotate manageTravelSrv.Notes with {
  ID @Common.Text: { $value: comment, ![@UI.TextArrangement]: #TextOnly };
};
annotate manageTravelSrv.Notes with @UI.SelectionFields: [
  comment
];
annotate manageTravelSrv.Notes with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: comment }
];
annotate manageTravelSrv.Notes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: comment }
]};
annotate manageTravelSrv.Notes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];