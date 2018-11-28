echo "Setting up the network.."

echo "Creating channel genesis block.."

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=BankMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bank.tfbc.com/users/Admin@bank.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.bank.tfbc.com:7051" cli peer channel create -o orderer.tfbc.com:7050 -c tfbcchannel -f /etc/hyperledger/configtx/tfbcchannel.tx


sleep 5

echo "Channel genesis block created."

echo "peer0.bank.tfbc.com joining the channel..."
# Join peer0.bank.tfbc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=BankMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bank.tfbc.com/users/Admin@bank.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.bank.tfbc.com:7051" cli peer channel join -b tfbcchannel.block

echo "peer0.bank.tfbc.com joined the channel"

echo "peer0.buyer.tfbc.com joining the channel..."

# Join peer0.buyer.tfbc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=BuyerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.tfbc.com/users/Admin@buyer.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.buyer.tfbc.com:7051" cli peer channel join -b tfbcchannel.block

echo "peer0.buyer.tfbc.com joined the channel"

echo "peer0.seller.tfbc.com joining the channel..."
# Join peer0.seller.tfbc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=SellerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.tfbc.com/users/Admin@seller.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.seller.tfbc.com:7051" cli peer channel join -b tfbcchannel.block
sleep 5

echo "peer0.seller.tfbc.com joined the channel"

echo "Installing tfbc chaincode to peer0.bank.tfbc.com..."

# install chaincode
# Install code on bank peer
docker exec -e "CORE_PEER_LOCALMSPID=BankMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bank.tfbc.com/users/Admin@bank.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.bank.tfbc.com:7051" cli peer chaincode install -n tfbccc -v 1.0 -p github.com/tfbc/go -l golang

echo "Installed tfbc chaincode to peer0.bank.tfbc.com"

echo "Installing tfbc chaincode to peer0.buyer.tfbc.com...."

# Install code on buyer peer
docker exec -e "CORE_PEER_LOCALMSPID=BuyerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.tfbc.com/users/Admin@buyer.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.buyer.tfbc.com:7051" cli peer chaincode install -n tfbccc -v 1.0 -p github.com/tfbc/go -l golang

echo "Installed tfbc chaincode to peer0.buyer.tfbc.com"

echo "Installing tfbc chaincode to peer0.seller.tfbc.com..."
# Install code on seller peer
docker exec -e "CORE_PEER_LOCALMSPID=SellerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.tfbc.com/users/Admin@seller.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.seller.tfbc.com:7051" cli peer chaincode install -n tfbccc -v 1.0 -p github.com/tfbc/go -l golang

sleep 5

echo "Installed tfbc chaincode to peer0.buyer.tfbc.com"

echo "Instantiating tfbc chaincode.."

docker exec -e "CORE_PEER_LOCALMSPID=BankMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bank.tfbc.com/users/Admin@bank.tfbc.com/msp" -e "CORE_PEER_ADDRESS=peer0.bank.tfbc.com:7051" cli peer chaincode instantiate -o orderer.tfbc.com:7050 -C tfbcchannel -n tfbccc -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('BankMSP.member','BuyerMSP.member','SellerMSP.member')"

echo "Instantiated tfbc chaincode."

echo "Following is the docker network....."

docker ps