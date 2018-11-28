# Trade finance on Hyperledger Fabric 
Trade finance application on Hyperledger Fabric

## Start the Hyperledger Fabric Network 

1. cd hlf-trade-finance
2. ./start.sh

## Setup the Hyperledger Fabric Network

1. ./setup.sh

## Setup API users 

1. cd tfbc-api
2. npm install
3. rm hfc-key-store/*
4. node enrollBankUser.js
5. node enrollBuyerUser.js
6. node enrollSellerUser.js

## Run Node APIs

1. npm start

## Execute APIs on Swagger UI 

http://localhost:3000/api-docs

## API Docs 

### Request LC (Letter of Credit)
  1. URL -> http://localhost:3000/tfbc/requestLC
  2. Http Method -> Post
  3. content-type: application/json
  4. Input->
  {
	"lcId": "LC001",
	"expiryDate": "31-Dec-2018",
	"buyer": "buyerUser",
	"bank": "bankUser",
	"seller": "sellerUser",
	"amount": "100000"
  }
  5. Output-> 
  {
    "code": "200",
    "message": "LC requested successsfully."
  }
### Issue LC (Letter of Credit)

 1. URL -> http://localhost:3000/tfbc/issueLC
 2. Http Method -> Post
 3. content-type: application/json
 4. Input->
  {
	"lcId": "LC001"
  }
 5. Output-> 
  {
    "code": "200",
    "message": "LC issued successsfully."
  }
### Accept LC (Letter of Credit)
 1. URL -> http://localhost:3000/tfbc/acceptLC
 2. Http Method -> Post
 3. content-type: application/json
 4. Input->
  {
	"lcId": "LC001"
  }
 5. Output-> 
  {
    "code": "200",
    "message": "LC accepted successsfully."
  }
### Get LC Details 
 1. URL -> http://localhost:3000/tfbc/getLC
 2. Http Method -> Post
 3. content-type: application/json
 4. Input->
 {
	"lcId": "LC001"
  }
 5. Output-> 
  {
	"lcId": "LC001",
	"expiryDate": "31-Dec-2018",
	"buyer": "buyerUser",
	"bank": "bankUser",
	"seller": "sellerUser",
	"amount": "100000"
  }
### Get LC History 
 1. URL -> http://localhost:3000/tfbc/getLCHistory
 2. Http Method -> Post
 3. content-type: application/json
 4. Input->
  {
	"lcId": "LC001"
  }
 5. Output-> 
  {
    "code": "200",
    "data": [
        {
            "TxId": "f05b3c1cf24da09f657434c7aff7c3a449565421d409a6b3328975858137b826",
            "Value": {
                "lcId": "LC001",
                "expiryDate": "31-Dec-2018",
                "buyer": "buyerUser",
                "bank": "bankUser",
                "seller": "sellerUser",
                "amount": 100000,
                "status": "Requested"
            },
            "Timestamp": "2018-11-28 13:59:59.79 +0000 UTC",
            "IsDelete": "false"
        },
        {
            "TxId": "9b7d25533de4d1cb1d3fff1f65d6f1bcaf3821ebedf4a8ffbf7c85fd7e2ff49f",
            "Value": {
                "lcId": "LC001",
                "expiryDate": "31-Dec-2018",
                "buyer": "buyerUser",
                "bank": "bankUser",
                "seller": "sellerUser",
                "amount": 100000,
                "status": "Issued"
            },
            "Timestamp": "2018-11-28 14:00:36.362 +0000 UTC",
            "IsDelete": "false"
        },
        {
            "TxId": "0e6ccb1e1fbbd47937979ad981c7865c7f170b0487480322d172ebfaf25f4575",
            "Value": {
                "lcId": "LC001",
                "expiryDate": "31-Dec-2018",
                "buyer": "buyerUser",
                "bank": "bankUser",
                "seller": "sellerUser",
                "amount": 100000,
                "status": "Accepted"
            },
            "Timestamp": "2018-11-28 14:00:50.469 +0000 UTC",
            "IsDelete": "false"
        }
    ]
}




