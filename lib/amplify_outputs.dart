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
    "url": "https://tzuedot2vbcyzpfkrrw62dozqa.appsync-api.ap-south-1.amazonaws.com/graphql",
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
                    "provider": "userPools",
                    "ownerField": "owner",
                    "allow": "owner",
                    "identityClaim": "cognito:username",
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
        }
      }
    }
  },
  "version": "1.1"
}''';