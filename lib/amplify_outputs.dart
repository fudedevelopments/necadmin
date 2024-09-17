const amplifyConfig = '''{
  "auth": {
    "user_pool_id": "ap-south-1_S0SpC5ift",
    "aws_region": "ap-south-1",
    "user_pool_client_id": "132rkksj7bebq4e8p9pmttdtqj",
    "identity_pool_id": "ap-south-1:ccf57090-0b3d-4fa0-b89e-10abdd0b3846",
    "mfa_methods": [],
    "standard_required_attributes": [
      "email"
    ],
    "username_attributes": [
      "email"
    ],
    "user_verification_types": [
      "email"
    ],
    "mfa_configuration": "NONE",
    "password_policy": {
      "min_length": 8,
      "require_lowercase": true,
      "require_numbers": true,
      "require_symbols": true,
      "require_uppercase": true
    },
    "unauthenticated_identities_enabled": true
  },
  "data": {
    "url": "https://4mu2welep5cwpj5acizv6m6ciu.appsync-api.ap-south-1.amazonaws.com/graphql",
    "aws_region": "ap-south-1",
    "default_authorization_type": "AMAZON_COGNITO_USER_POOLS",
    "authorization_types": [
      "AWS_IAM"
    ],
    "model_introspection": {
      "version": 1,
      "models": {
        "EventDetatils": {
          "name": "EventDetatils",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "images": {
              "name": "images",
              "isArray": true,
              "type": "String",
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true
            },
            "eventname": {
              "name": "eventname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "eventdetails": {
              "name": "eventdetails",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "date": {
              "name": "date",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "location": {
              "name": "location",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "registerurl": {
              "name": "registerurl",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "ondutyrequest": {
              "name": "ondutyrequest",
              "isArray": true,
              "type": {
                "model": "Ondutyrequest"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "eventid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "EventDetatils",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "operations": [
                      "read"
                    ],
                    "groups": [
                      "STUDENTS"
                    ]
                  },
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        },
        "ClassRoom": {
          "name": "ClassRoom",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "classRoomname": {
              "name": "classRoomname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "hod": {
              "name": "hod",
              "isArray": true,
              "type": {
                "model": "Hod"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "classRoomid"
                ]
              }
            },
            "ac": {
              "name": "ac",
              "isArray": true,
              "type": {
                "model": "Ac"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "classRoomid"
                ]
              }
            },
            "proctors": {
              "name": "proctors",
              "isArray": true,
              "type": {
                "model": "Proctor"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "classRoomid"
                ]
              }
            },
            "students": {
              "name": "students",
              "isArray": true,
              "type": {
                "model": "Student"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "classRoomid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "ClassRooms",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        },
        "Hod": {
          "name": "Hod",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "hodname": {
              "name": "hodname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": false,
              "attributes": []
            },
            "classRoomid": {
              "name": "classRoomid",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "classRoom": {
              "name": "classRoom",
              "isArray": false,
              "type": {
                "model": "ClassRoom"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "classRoomid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Hods",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        },
        "Ac": {
          "name": "Ac",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "acname": {
              "name": "acname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": false,
              "attributes": []
            },
            "classRoomid": {
              "name": "classRoomid",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "classRoom": {
              "name": "classRoom",
              "isArray": false,
              "type": {
                "model": "ClassRoom"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "classRoomid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Acs",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        },
        "Proctor": {
          "name": "Proctor",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "proctorname": {
              "name": "proctorname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": false,
              "attributes": []
            },
            "classRoomid": {
              "name": "classRoomid",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "classRoom": {
              "name": "classRoom",
              "isArray": false,
              "type": {
                "model": "ClassRoom"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "classRoomid"
                ]
              }
            },
            "students": {
              "name": "students",
              "isArray": true,
              "type": {
                "model": "Student"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "proctorid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Proctors",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        },
        "Student": {
          "name": "Student",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "studentname": {
              "name": "studentname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": false,
              "attributes": []
            },
            "classRoomid": {
              "name": "classRoomid",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "classRoom": {
              "name": "classRoom",
              "isArray": false,
              "type": {
                "model": "ClassRoom"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "classRoomid"
                ]
              }
            },
            "proctorid": {
              "name": "proctorid",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "proctor": {
              "name": "proctor",
              "isArray": false,
              "type": {
                "model": "Proctor"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "proctorid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Students",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        },
        "Ondutyrequest": {
          "name": "Ondutyrequest",
          "fields": {
            "id": {
              "name": "id",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "ondutyname": {
              "name": "ondutyname",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": false,
              "attributes": []
            },
            "eventid": {
              "name": "eventid",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "events": {
              "name": "events",
              "isArray": false,
              "type": {
                "model": "EventDetatils"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "eventid"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Ondutyrequests",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "groupClaim": "cognito:groups",
                    "provider": "userPools",
                    "allow": "groups",
                    "groups": [
                      "ADMINS",
                      "STAFF"
                    ],
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": false,
            "primaryKeyFieldName": "id",
            "sortKeyFieldNames": []
          }
        }
      },
      "enums": {},
      "nonModels": {},
      "queries": {
        "listUsersInGroup": {
          "name": "listUsersInGroup",
          "isArray": false,
          "type": "AWSJSON",
          "isRequired": false,
          "arguments": {
            "groupName": {
              "name": "groupName",
              "isArray": false,
              "type": "String",
              "isRequired": true
            }
          }
        },
        "listUsers": {
          "name": "listUsers",
          "isArray": false,
          "type": "AWSJSON",
          "isRequired": false
        }
      },
      "mutations": {
        "addUserToGroup": {
          "name": "addUserToGroup",
          "isArray": false,
          "type": "AWSJSON",
          "isRequired": false,
          "arguments": {
            "userId": {
              "name": "userId",
              "isArray": false,
              "type": "String",
              "isRequired": true
            },
            "groupName": {
              "name": "groupName",
              "isArray": false,
              "type": "String",
              "isRequired": true
            }
          }
        },
        "createUser": {
          "name": "createUser",
          "isArray": false,
          "type": "AWSJSON",
          "isRequired": false,
          "arguments": {
            "username": {
              "name": "username",
              "isArray": false,
              "type": "String",
              "isRequired": true
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": true
            },
            "password": {
              "name": "password",
              "isArray": false,
              "type": "String",
              "isRequired": true
            }
          }
        },
        "createGroup": {
          "name": "createGroup",
          "isArray": false,
          "type": "AWSJSON",
          "isRequired": false,
          "arguments": {
            "groupName": {
              "name": "groupName",
              "isArray": false,
              "type": "String",
              "isRequired": true
            }
          }
        }
      }
    }
  },
  "storage": {
    "aws_region": "ap-south-1",
    "bucket_name": "amplify-necbakend-prave-sa-appimagesbucket9e700c22-2th8sysmet9k",
    "buckets": [
      {
        "name": "Appimages",
        "bucket_name": "amplify-necbakend-prave-sa-appimagesbucket9e700c22-2th8sysmet9k",
        "aws_region": "ap-south-1"
      }
    ]
  },
  "version": "1.1"
}''';