pragma solidity ^0.5.17;
contract Shirts {
    struct order {
        int orderno;
        int quant;
        int price;
        string status;
        string payment;
    }
    
    address beach = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address threads = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    mapping(int => order) public orderList;
    int public orderCount;
    
    function placeOrder(int quantity) public returns(int){
        if(msg.sender == beach){
        int price = 250 * quantity;
        orderCount++;
        orderList[orderCount-1] = order(orderCount,quantity,price,"Status Pending","Payment Pending");
        return price;
        }
    }
    function checkOwner() public view returns(address){
        address owner = msg.sender;
        return owner;
    }
    function acceptOrder(int ordernumber) public returns(string memory){
        if(msg.sender==threads){
            orderList[ordernumber].status="Order Accepted";
            return orderList[ordernumber].status;
        }
    }
    function confirmPayment(int ordernumber) public returns(string memory){
        if(msg.sender==beach){
            orderList[ordernumber].payment="Payment Done";
            return orderList[ordernumber].payment;
        }
    }
    function orderStatus(int ordernumber) public view returns(string memory, string memory){
        return (orderList[ordernumber].status, orderList[ordernumber].payment);
    }
}

