# hlf-trade-finance
Trade finance application on Hyperledger Fabric

# Start the Hyperledger Fabric Network 

cd hlf-trade-finance
./start.sh

# Setup the Hyperledger Fabric Network

./setup.sh

# Setup API users 

cd tfbc-api
npm install
rm hfc-key-store/*
node enrollBankUser.js
node enrollBuyerUser.js
node enrollSellerUser.js

# Run Node APIs

npm start

# Execute APIs on Swagger UI 

http://localhost:3000/api-docs

# API Docs 

(1) Request LC (Letter of Credit)
  URL -> http://localhost:3000/tfbc/requestLC
  Http Method -> Post
  content-type: application/json
  Input->
  {
	"lcId": "LC001",
	"expiryDate": "31-Dec-2018",
	"buyer": "buyerUser",
	"bank": "bankUser",
	"seller": "sellerUser",
	"amount": "100000"
  }
  Output-> 
  {
    "code": "200",
    "message": "LC requested successsfully."
  }
(2) Issue LC (Letter of Credit)

 URL -> http://localhost:3000/tfbc/issueLC
  Http Method -> Post
  content-type: application/json
  Input->
  {
	"lcId": "LC001"
  }
  Output-> 
  {
    "code": "200",
    "message": "LC issued successsfully."
  }
(3) Accept LC (Letter of Credit)
 URL -> http://localhost:3000/tfbc/acceptLC
  Http Method -> Post
  content-type: application/json
  Input->
  {
	"lcId": "LC001"
  }
  Output-> 
  {
    "code": "200",
    "message": "LC accepted successsfully."
  }
(4) Get LC Details 
 URL -> http://localhost:3000/tfbc/getLC
  Http Method -> Post
  content-type: application/json
  Input->
  {
	"lcId": "LC001"
  }
  Output-> 
  {
	"lcId": "LC001",
	"expiryDate": "31-Dec-2018",
	"buyer": "buyerUser",
	"bank": "bankUser",
	"seller": "sellerUser",
	"amount": "100000"
  }
(5) Get LC History 
 URL -> http://localhost:3000/tfbc/getLCHistory
  Http Method -> Post
  content-type: application/json
  Input->
  {
	"lcId": "LC001"
  }
  Output-> 
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




