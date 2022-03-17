// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
import "./IERC20.sol";
contract ClaimToken{
    IERC20 Token;
       
    bytes32 merkleRoot;
    function claimForAddress(bytes32[] calldata, uint256 itemid, uint256 _amount)
 
    mapping(address => bool) claimed,
    
    event TokenClaim(uint256 itemId, uint256 amount),
    

    constructor(address _tokenAddress, bytes32 _merkleRoot){
        token = IERC20(_tokenAddress);
        merkleRoot = _merkleRoot;
    }

    modifier notClaimed(){
        require(claimed[msg.sender] == false, "Already Claimed");
        _;
    }

        function claimForAddress(
        uint256 _itemId,
        uint256 _amount,
        bytes32[] calldata _merkleProof,
        bytes calldata _data
    ) external onlyUnclaimedAddress(msg.sender) {
        AddressAirdrop storage drop = s.addressAirdrops[_airdropId];
        require(drop.maxUsers > 0, "Airdrop is not created yet");
        // Verify the merkle proof.
        bytes32 node = keccak256(abi.encodePacked(msg.sender, _itemId, _amount));
        bytes32 merkleRoot = drop.merkleRoot;
        address token = drop.tokenAddress;
        

        // Mark it claimed and send the token.
        setAddressClaimed(msg.sender);
        IERC20(Token).safeTransferFrom(address(this), msg.sender, _itemId, _amount, _data);
        drop.claims++;
        //only emit when successful
        emit AddressClaim(_airdropId, msg.sender, _itemId, _amount);
        require(transferred, "Token Transfer Failed");
        emit rewards(msg.sender, _amount * 10 ** 18);
        return true;

         bool transferred = _token.transfer(msg.sender,_amount * 10 ** 18);
        require(transferred, "Token Transfer Failed");
        emit rewards(msg.sender, _amount * 10 ** 18);
        return true;
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    


}
