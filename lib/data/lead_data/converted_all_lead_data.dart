class Lead {
  final String leadIdentifier;
  final String organisationName;
  final String email;
  final String orgContactNo;
  final dynamic noOfEmployees;
  final String sector;
  final String leadStatus;
  final String salesManager;
  final DateTime updatedOn;

  Lead({
    required this.leadIdentifier,
    required this.organisationName,
    required this.email,
    required this.orgContactNo,
    required this.noOfEmployees,
    required this.sector,
    required this.leadStatus,
    required this.salesManager,
    required this.updatedOn,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      leadIdentifier: json["leadIdentifier"],
      organisationName: json["organisationName"],
      email: json["email"],
      orgContactNo: json["orgContactNo"],
      noOfEmployees: json["noOfEmployees"],
      sector: json["sector"],
      leadStatus: json["leadStatus"],
      salesManager: json["salesManager"],
      updatedOn: DateTime.parse(json["updatedOn"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "leadIdentifier": leadIdentifier,
      "organisationName": organisationName,
      "email": email,
      "orgContactNo": orgContactNo,
      "noOfEmployees": noOfEmployees,
      "sector": sector,
      "leadStatus": leadStatus,
      "salesManager": salesManager,
      "updatedOn": updatedOn.toIso8601String(),
    };
  }
}

class LeadData {
  final Map<String, Lead> leads;

  LeadData({required this.leads});

  factory LeadData.fromJson(List<Map<String, dynamic>> jsonList) {
    Map<String, Lead> leadsMap = {
      for (var lead in jsonList) lead["leadIdentifier"]: Lead.fromJson(lead)
    };
    return LeadData(leads: leadsMap);
  }

  List<Map<String, dynamic>> toJson() {
    return leads.values.map((lead) => lead.toJson()).toList();
  }
}


/**
 * How to use this:
 * 1. Import the all lead data file in the lead file.
 * 2. use the following code:
 *      LeadData allLeadData = LeadData.fromJson(allLeadData);
 * 3. now allLeadData is a list of all leads.
 * 4. To convert the allLeadData back to the original format use the following code:
 *      allLeadData.toJson();
 * */
