import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Services',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ServiceButton(
              title: 'Visa Renewal',
              subtitle: 'Renew your visa online',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisaApplicationForm()),
                );
              },
            ),
            ServiceButton(
              title: 'Passport',
              subtitle: 'Apply for passport',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PassportForm()),
                );
              },
            ),
             ServiceButton(
              title: 'Air Ticket',
              subtitle: 'Apply for air tickets',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingForm()),
                );
              },
            ),
           ServiceButton(
              title: 'License',
              subtitle: 'Apply for license',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LicenseForm()),
                );
              },
            ), 
            ServiceButton(
              title: 'Aadhaar Card',
              subtitle: ' Aadhaar Register',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationForm()),
                );
              },
            ),
            // Add more ServiceButton widgets for other services
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your main content here
          ],
        ),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ServiceButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(Icons.description),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class VisaApplicationForm extends StatefulWidget {
  @override
  _VisaApplicationFormState createState() => _VisaApplicationFormState();
}

class _VisaApplicationFormState extends State<VisaApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _fullName;
  String? _gender;
  DateTime? _dateOfBirth;
  String? _placeOfBirth;
  String? _nationality;
  String? _passportNumber;
  DateTime? _passportIssuanceDate;
  DateTime? _passportExpiryDate;
  String? _address;
  String? _city;
  String? _country;
  String? _emailAddress;
  String? _phoneNumber;
  DateTime? _intendedDateOfArrival;
  DateTime? _intendedDateOfDeparture;
  String? _purposeOfVisit;
  String? _durationOfStay;
  List<String>? _countriesPreviouslyVisited;
  String? _travelHistory;
  String? _currentOccupation;
  String? _employerNameAndAddress;
  String? _monthlyIncome;
  String? _bankStatements;
  String? _maritalStatus;
  String? _spousesName;
  List<String>? _childrenNamesAndAges;
  String? _preExistingMedicalConditions;
  String? _healthInsuranceDetails;
  bool? _visaDeniedBefore;
  bool? _convictedOfCrime; 
  String? _additionalInformation;
  String? _passportScan;
  String? _passportSizePhotograph;
  String? _otherRequiredDocuments;
  String? _applicantSignature;
  DateTime? _dateOfSubmission;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visa Application Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Personal Information', [
                _buildFullNameField(),
                _buildGenderDropdown(),
                _buildDateOfBirthField(),
                _buildPlaceOfBirthField(),
                _buildNationalityField(),
                _buildPassportNumberField(),
                _buildPassportIssuanceDateField(),
                _buildPassportExpiryDateField(),
              ]),
              _buildSection('Contact Information', [
                _buildAddressField(),
                _buildCityField(),
                _buildCountryField(),
                _buildEmailAddressField(),
                _buildPhoneNumberField(),
              ]),
              _buildSection('Travel Information', [
                _buildIntendedDateOfArrivalField(),
                _buildIntendedDateOfDepartureField(),
                _buildPurposeOfVisitField(),
                _buildDurationOfStayField(),
              ]),
              _buildSection('Employment/Financial Information', [
                _buildCurrentOccupationField(),
                _buildEmployerNameAndAddressField(),
                _buildMonthlyIncomeField(),
              ]),
              _buildSection('Family Information', [
                _buildMaritalStatusField(),
                _buildSpousesNameField(),
              ]),
              _buildSection('Health Information', [
                _buildPreExistingMedicalConditionsField(),
                _buildHealthInsuranceDetailsField(),
              ]),
              _buildSection('Additional Information', [
                _buildVisaDeniedBeforeField(),
                _buildConvictedOfCrimeField(),
                _buildAdditionalInformationField(),
              ]),
              _buildSection('Document Upload', [
                _buildPassportScanField(),
                _buildPassportSizePhotographField(),
                _buildOtherRequiredDocumentsField(),
              ]),
              _buildSection('Declaration and Signature', [
                _buildApplicantSignatureField(),
                _buildDateOfSubmissionField(),
              ]),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Submit form data to API or perform necessary actions
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> fields) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          ...fields,
        ],
      ),
    );
  }

  Widget _buildFullNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Full Name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        return null;
      },
      onSaved: (value) {
        _fullName = value;
      },
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: 'Gender'),
      items: ['Male', 'Female', 'Other']
          .map((gender) => DropdownMenuItem<String>(
                child: Text(gender),
                value: gender,
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select your gender';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _gender = value;
        });
      },
    );
  }

  Widget _buildDateOfBirthField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Date of Birth'),
    validator: (value) {
      // Implement validation for date of birth if needed
      return null;
    },
    onSaved: (value) {
      // Parse and assign the date of birth value
    },
  );
}

Widget _buildPlaceOfBirthField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Place of Birth'),
    onSaved: (value) {
      _placeOfBirth = value;
    },
  );
}

Widget _buildNationalityField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Nationality'),
    onSaved: (value) {
      _nationality = value;
    },
  );
}

Widget _buildPassportNumberField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Passport Number'),
    onSaved: (value) {
      _passportNumber = value;
    },
  );
}

Widget _buildPassportIssuanceDateField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Passport Issuance Date'),
    validator: (value) {
      // Implement validation for issuance date if needed
      return null;
    },
    onSaved: (value) {
      // Parse and assign the issuance date value
    },
  );
}

Widget _buildPassportExpiryDateField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Passport Expiry Date'),
    validator: (value) {
      // Implement validation for expiry date if needed
      return null;
    },
    onSaved: (value) {
      // Parse and assign the expiry date value
    },
  );
}

Widget _buildAddressField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Address'),
    onSaved: (value) {
      _address = value;
    },
  );
}

Widget _buildCityField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'City'),
    onSaved: (value) {
      _city = value;
    },
  );
}

Widget _buildCountryField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Country'),
    onSaved: (value) {
      _country = value;
    },
  );
}

Widget _buildEmailAddressField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Email Address'),
    onSaved: (value) {
      _emailAddress = value;
    },
  );
}

Widget _buildPhoneNumberField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Phone Number'),
    onSaved: (value) {
      _phoneNumber = value;
    },
  );
}

Widget _buildIntendedDateOfArrivalField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Intended Date of Arrival'),
    onSaved: (value) {
      // Parse and assign the intended date of arrival value
    },
  );
}

Widget _buildIntendedDateOfDepartureField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Intended Date of Departure'),
    onSaved: (value) {
      // Parse and assign the intended date of departure value
    },
  );
}

Widget _buildPurposeOfVisitField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Purpose of Visit'),
    onSaved: (value) {
      _purposeOfVisit = value;
    },
  );
}

Widget _buildDurationOfStayField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Duration of Stay'),
    onSaved: (value) {
      _durationOfStay = value;
    },
  );
}

Widget _buildMaritalStatusField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Marital Status'),
    onSaved: (value) {
      _maritalStatus = value;
    },
  );
}

Widget _buildSpousesNameField() {
  return TextFormField(
    decoration: InputDecoration(labelText: "Spouse's Name"),
    onSaved: (value) {
      _spousesName = value;
    },
  );
}

Widget _buildPreExistingMedicalConditionsField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Pre-existing Medical Conditions'),
    onSaved: (value) {
      _preExistingMedicalConditions = value;
    },
  );
}

Widget _buildHealthInsuranceDetailsField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Health Insurance Details'),
    onSaved: (value) {
      _healthInsuranceDetails = value;
    },
  );
}

Widget _buildVisaDeniedBeforeField() {
  return CheckboxListTile(
    title: Text('Have you ever been denied a visa to this country or any other country?'),
    value: _visaDeniedBefore ?? false,
    onChanged: (value) {
      setState(() {
        _visaDeniedBefore = value;
      });
    },
  );
}

Widget _buildConvictedOfCrimeField() {
  return CheckboxListTile(
    title: Text('Have you ever been convicted of a crime?'),
    value: _convictedOfCrime ?? false,
    onChanged: (value) {
      setState(() {
        _convictedOfCrime = value;
      });
    },
  );
}

Widget _buildAdditionalInformationField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Additional Information'),
    onSaved: (value) {
      _additionalInformation = value;
    },
  );
}

Widget _buildPassportScanField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Passport Scan'),
    onSaved: (value) {
      _passportScan = value;
    },
  );
}

Widget _buildPassportSizePhotographField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Passport-size Photograph'),
    onSaved: (value) {
      _passportSizePhotograph = value;
    },
  );
}

Widget _buildOtherRequiredDocumentsField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Other Required Documents'),
    onSaved: (value) {
      _otherRequiredDocuments = value;
    },
  );
}

Widget _buildApplicantSignatureField() {
  return TextFormField(
    decoration: InputDecoration(labelText: "Applicant's Signature"),
    onSaved: (value) {
      _applicantSignature = value;
    },
  );
}

Widget _buildDateOfSubmissionField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Date of Submission'),
    validator: (value) {
      // Implement validation for date of submission if needed
      return null;
    },
    onSaved: (value) {
      // Parse and assign the date of submission value
    },
  );
}
Widget _buildCurrentOccupationField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Current Occupation'),
    onSaved: (value) {
      _currentOccupation = value;
    },
  );
}

Widget _buildEmployerNameAndAddressField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Employer Name and Address'),
    onSaved: (value) {
      _employerNameAndAddress = value;
    },
  );
}

Widget _buildMonthlyIncomeField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Monthly Income'),
    onSaved: (value) {
      _monthlyIncome = value;
    },
  );
}

}

class PassportApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passport Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PassportForm(),
    );
  }
}

class PassportForm extends StatefulWidget {
  @override
  _PassportFormState createState() => _PassportFormState();
}

class _PassportFormState extends State<PassportForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullName;
  String? dateOfBirth;
  String? placeOfBirth;
  String? gender;
  String? nationality;
  String? passportNumber;
  String? passportIssuanceDate;
  String? passportExpiryDate;
  String? address;
  String? city;
  String? country;
  String? emailAddress;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passport Application Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildTextFormField('Full Name', (value) => fullName = value),
              buildTextFormField('Date of Birth', (value) => dateOfBirth = value),
              buildTextFormField('Place of Birth', (value) => placeOfBirth = value),
              buildTextFormField('Gender', (value) => gender = value),
              buildTextFormField('Nationality', (value) => nationality = value),
              buildTextFormField('Passport Number', (value) => passportNumber = value),
              buildTextFormField('Passport Issuance Date', (value) => passportIssuanceDate = value),
              buildTextFormField('Passport Expiry Date', (value) => passportExpiryDate = value),
              buildTextFormField('Address', (value) => address = value),
              buildTextFormField('City', (value) => city = value),
              buildTextFormField('Country', (value) => country = value),
              buildTextFormField('Email Address', (value) => emailAddress = value),
              buildTextFormField('Phone Number', (value) => phoneNumber = value),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    // Implement saving data to database or backend
                    // Here you can use the variables like fullName, dateOfBirth, etc.
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String labelText, Function(String?) onSaved) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
        onSaved: onSaved as void Function(String?)?,
      ),
    );
  }
}

class AirTicketBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Ticket Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookingForm(),
    );
  }
}

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  String? origin;
  String? destination;
  DateTime? departureDate;
  DateTime? returnDate;
  int numberOfAdults = 1;
  int numberOfChildren = 0;
  int numberOfInfants = 0;
  String? travelClass;
  String? fullName;
  DateTime? dateOfBirth;
  String? gender;
  String? passportNumber;
  DateTime? passportExpiryDate;
  String? emailAddress;
  String? phoneNumber;
  String? specialRequests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Ticket Booking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Origin'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the origin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    origin = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
               // padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Destination'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the destination';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    destination = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              // Date pickers for departure and return dates
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      //padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: ' Departure Date'),
                        onTap: () {
                          // Implement date picker for departure date
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      //padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: ' Return Date'),
                        onTap: () {
                          // Implement date picker for return date
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Dropdown for travel class
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //padding: EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: ' Travel Class'),
                  value: travelClass,
                  items: ['Economy', 'Premium Economy', 'Business', 'First Class']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      travelClass = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              // Input fields for passenger details
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Full Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    fullName = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              // Implement date picker for date of birth
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Date of Birth'),
                  onTap: () {
                    // Implement date picker for date of birth
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Gender'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    gender = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
               // padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Passport Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your passport number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passportNumber = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              // Implement date picker for passport expiry date
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
               // padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Passport Expiry Date'),
                  onTap: () {
                    // Implement date picker for passport expiry date
                  },
                ),
              ),
              SizedBox(height: 10),
              // Input fields for contact details
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
               // padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Email Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailAddress = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
               // padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Special Requests'),
                  onSaved: (value) {
                    specialRequests = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    // Implement booking logic here
                  }
                },
                child: Text(' Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class LicenseApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'License Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LicenseForm(),
    );
  }
}

class LicenseForm extends StatefulWidget {
  @override
  _LicenseFormState createState() => _LicenseFormState();
}

class _LicenseFormState extends State<LicenseForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? nationality;
  String? residentialAddress;
  String? emailAddress;
  String? phoneNumber;
  String? governmentID;
  String? socialSecurityNumber;
  String? educationLevel;
  String? employmentHistory;
  String? criminalHistory;
  String? additionalInformation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('License Application Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Full Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    fullName = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Date of Birth'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    dateOfBirth = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Gender'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    gender = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Nationality'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your nationality';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nationality = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Residential Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your residential address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    residentialAddress = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Email Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailAddress = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Government ID'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your government ID';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    governmentID = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Social Security Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your social security number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    socialSecurityNumber = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Education Level'),
                  onSaved: (value) {
                    educationLevel = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Employment History'),
                  onSaved: (value) {
                    employmentHistory = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Criminal History'),
                  onSaved: (value) {
                    criminalHistory = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Additional Information'),
                  onSaved: (value) {
                    additionalInformation = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    // Implement saving data to database or backend
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class AadhaarRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aadhaar Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? address;
  String? proofOfIdentity;
  String? proofOfAddress;
  String? mobileNumber;
  String? photograph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aadhaar Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Full Name'), 
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    fullName = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Date of Birth'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    dateOfBirth = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Gender'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    gender = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
               // padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Proof of Identity'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide proof of identity';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    proofOfIdentity = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Proof of Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide proof of address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    proofOfAddress = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Mobile Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mobileNumber = value;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                //padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Photograph'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a photograph';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    photograph = value;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    // Process the form data (e.g., submit to server)
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}