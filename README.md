# Trade finance on Hyperledger Fabric (*** Only Request, Issue and Accept Letter of Credit workflow implemented ***)
Trade finance application on Hyperledger Fabric

*** Use sudo prefix to commands if you get permission denied error while executing any command, assumption is you already have  required software to run Hyperledger fabric network and node SDK *** 

## Start the Hyperledger Fabric Network 

1. cd hlf-trade-finance
2. ./start.sh (with this you will start docker-compose.yml up -d )

## Setup the Hyperledger Fabric Network

1. cd hlf-trade-finance
2. ./setup.sh (With this you will create the channel genesis block, add the peer0 to the channel created and instantiate tfbc chaincode.) 

*** In this usecase CA's are already generated. 

We **do not have to run** the following again:

1. "generate --config=crypto-config.yaml"
2. "TFBCOrgOrdererGenesis -outputBlock ./config/genesis.block" 
3. "TFBCOrgChannel -outputCreateChannelTx ./config/tfbcchannel.tx -channelID tfbcchannel". 

These three statements are part of the "generate.sh" file here. 


## Setup API users 

1. cd hlf-trade-finance/tfbc-api
2. npm install
3. rm hfc-key-store/*
4. node enrollBankUser.js
5. node enrollBuyerUser.js
6. node enrollSellerUser.js

## Run Node APIs

1. cd hlf-trade-finance/tfbc-api
2. npm start

## Execute APIs on Swagger UI 
(Swagger allows you to describe the structure of your APIs so that machines can read them. The ability of APIs to describe their own structure is the root of all awesomeness in Swagger. Why is it so great? Well, by reading your API’s structure, we can automatically build beautiful and interactive API documentation. We can also automatically generate client libraries for your API in many languages and explore other possibilities like automated testing. Swagger does this by asking your API to return a YAML or JSON that contains a detailed description of your entire API.)

- To check this application specific swagger file go to:  hlf-trade-finance/tfbc-api/swagger.json 

http://localhost:3000/api-docs

## API definition if you want to run APIs using some rest client like Postman etc. 

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

## Stop the network

1. cd hlf-trade-finance
2. ./stop.sh


