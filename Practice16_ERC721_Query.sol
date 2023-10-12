// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IERC721 {
    // Event
    // event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    // event Approval(address indexed owner, address indexed sender,uint256 indexed tokenId);
    // event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    // Query
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerof(uint256 tokenId) external view returns (address owner);
    // Transfer
    // function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
    // function safeTransferFrom(address from, address to, uint256 tokenId) external;
    // function transferFrom(address from, address to, uint256 tokenId) external;
    // Approve
    // function approve(address to, uint256 TokenId) external;
    // function setApprovalForAll(address operator, bool _approved) external;
    // function getApproved(uint tokenId) external view returns(address operator);
    // function isApprovedForAll(address owner,address operator) external view returns(bool); 
    }

contract ERC721 is IERC721{
    mapping(address => uint256) _balances;
    mapping(uint256 => address) _owners;

    function balanceOf(address owner) public  view returns (uint256){
        require(owner != address(0),"ERROR: Address(0) can't be owner.");
        return _balances[owner];
    }
    function ownerof(uint256 tokenId) public view returns (address){
        address owner = _owners[tokenId];
        require(owner != address(0),"ERROR: Owner can't be address(0)");
        return owner;
    }
}

// https://www.youtube.com/watch?v=7TwXDigV1BQ&list=PLHmOMPRfmOxQYDnXAc1hKY6ra4WDU8ZlM&index=23&ab_channel=Hung-YingTai