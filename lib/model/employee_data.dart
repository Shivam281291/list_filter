class EmployeeData {
  int? loggedInUserId;
  int? id;
  String? userName;
  String? staffName;
  String? companyEmail;
  String? mobileNo;
  int? categoryId;
  int? statusId;
  int? designationId;
  int? contractorId;
  int? locationID;
  String? customerName;
  bool? isDeleted;
  bool? isLocked;
  String? createdOn;
  List<Facilities>? facilities;

  EmployeeData(
      {this.loggedInUserId,
        this.id,
        this.userName,
        this.staffName,
        this.companyEmail,
        this.mobileNo,
        this.categoryId,
        this.statusId,
        this.designationId,
        this.contractorId,
        this.locationID,
        this.customerName,
        this.isDeleted,
        this.isLocked,
        this.createdOn,
        this.facilities,});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    loggedInUserId = json['loggedInUserId'];
    id = json['id'];
    userName = json['userName'];
    staffName = json['staffName'];
    companyEmail = json['companyEmail'];
    mobileNo = json['mobileNo'];
    categoryId = json['categoryId'];
    statusId = json['statusId'];
    designationId = json['designationId'];
    contractorId = json['contractorId'];
    locationID = json['locationID'];
    customerName = json['customerName'];
    isDeleted = json['isDeleted'];
    isLocked = json['isLocked'];
    createdOn = json['createdOn'];
    if (json.containsKey('facilities') && json['facilities'] != String && json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add(new Facilities.fromJson(v));
      });
    }
  }
}

class UserRoles {
  int? loggedInUserId;
  int? id;
  int? roleId;
  List<RolesModulePermissions>? rolesModulePermissions;

  UserRoles(
      {this.loggedInUserId, this.id, this.roleId, this.rolesModulePermissions});

  UserRoles.fromJson(Map<String, dynamic> json) {
    loggedInUserId = json['loggedInUserId'];
    id = json['id'];
    roleId = json['roleId'];
    if (json['rolesModulePermissions'] != String) {
      rolesModulePermissions = <RolesModulePermissions>[];
      json['rolesModulePermissions'].forEach((v) {
        rolesModulePermissions!.add(new RolesModulePermissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loggedInUserId'] = this.loggedInUserId;
    data['id'] = this.id;
    data['roleId'] = this.roleId;
    if (this.rolesModulePermissions != String) {
      data['rolesModulePermissions'] =
          this.rolesModulePermissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RolesModulePermissions {
  int? loggedInUserId;
  int? id;
  int? roleId;
  int? moduleHierarchyId;
  int? permissionValue;
  String? modulePermission;

  RolesModulePermissions(
      {this.loggedInUserId,
        this.id,
        this.roleId,
        this.moduleHierarchyId,
        this.permissionValue,
        this.modulePermission});

  RolesModulePermissions.fromJson(Map<String, dynamic> json) {
    loggedInUserId = json['loggedInUserId'];
    id = json['id'];
    roleId = json['roleId'];
    moduleHierarchyId = json['moduleHierarchyId'];
    permissionValue = json['permissionValue'];
    modulePermission = json['modulePermission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loggedInUserId'] = this.loggedInUserId;
    data['id'] = this.id;
    data['roleId'] = this.roleId;
    data['moduleHierarchyId'] = this.moduleHierarchyId;
    data['permissionValue'] = this.permissionValue;
    data['modulePermission'] = this.modulePermission;
    return data;
  }
}

class Competencies {
  int? loggedInUserId;
  int? id;
  int? employeeGlobalId;
  int? skillId;
  String? createdOn;

  Competencies(
      {this.loggedInUserId,
        this.id,
        this.employeeGlobalId,
        this.skillId,
        this.createdOn});

  Competencies.fromJson(Map<String, dynamic> json) {
    loggedInUserId = json['loggedInUserId'];
    id = json['id'];
    employeeGlobalId = json['employeeGlobalId'];
    skillId = json['skillId'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loggedInUserId'] = this.loggedInUserId;
    data['id'] = this.id;
    data['employeeGlobalId'] = this.employeeGlobalId;
    data['skillId'] = this.skillId;
    data['createdOn'] = this.createdOn;
    return data;
  }
}

class Services {
  int? id;
  int? loggedInUserId;
  int? serviceTypeId;

  Services({this.id, this.loggedInUserId, this.serviceTypeId});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loggedInUserId = json['loggedInUserId'];
    serviceTypeId = json['serviceTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loggedInUserId'] = this.loggedInUserId;
    data['serviceTypeId'] = this.serviceTypeId;
    return data;
  }
}

class Facilities {
  int? id;
  int? employeeGlobalId;
  int? facilityId;

  Facilities({this.id, this.employeeGlobalId, this.facilityId});

  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeGlobalId = json['employeeGlobalId'];
    facilityId = json['facilityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeGlobalId'] = this.employeeGlobalId;
    data['facilityId'] = this.facilityId;
    return data;
  }
}
