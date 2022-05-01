// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Auction{
    
   address payable public auctioneer;
   uint public stblock;//start time block
   uint public etblock;// end time block

   enum Auc_State {Started,Running,Ended,Cancelled}
   Auc_State public auctionState;

   uint public highestBid;
   uint public highestPayableBid;
   uint bidInc;

   address payable public  highestBidder;

   mapping(address=> uint)public bids;
    
    constructor(){
        auctioneer=payable(msg.sender);
        auctionState=Auc_State.Running;
        stblock=block.number;
        etblock=stblock+240;
        bidInc=1 ether;
    }

   modifier notOwner(){
       require(msg.sender!=auctioneer,"Owner cannot bid");
       _;
   }
    modifier Owner(){
       require(msg.sender==auctioneer,"not a owner");
       _;
   }
    modifier Started(){
       require(block.number>stblock);
       _;
   }
    modifier beforeEnding(){
       require(block.number<etblock);
       _;
   }

   function cancelAuc() public Owner{
     auctionState=Auc_State.Cancelled;
   }

   function bid() payable public notOwner Started beforeEnding{
        require(auctionState==Auc_State.Running);
        require(msg.value>1 ether);
   }
}
