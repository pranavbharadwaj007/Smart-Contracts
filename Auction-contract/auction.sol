// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Auction{
    
   address payable public auctioneer;
   uint public stblock;//start time block
   uint public etblock;// end time block

   enum Auc_State {Started,Running,Ended,Cancelled};
   Auc_State public auctionState;

   uint public highestBid;
   uint public highestPayableBid;
   uint bid_inc;

   address public payable highestBidder;
}
