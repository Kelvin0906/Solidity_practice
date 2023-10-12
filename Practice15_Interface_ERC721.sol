// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IERC721 {
    // Event
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed sender,uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    // Query
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerof(uint256 tokenId) external view returns (address owner);
    // Transfer
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
    // Approve
    function approve(address to, uint256 TokenId) external;
    function setApprovalForAll(address operator, bool _approved) external;
    function getApproved(uint tokenId) external view returns(address operator);
    function isApprovedForAll(address owner,address operator) external view returns(bool); 
    }

// https://www.youtube.com/watch?v=7TwXDigV1BQ&list=PLHmOMPRfmOxQYDnXAc1hKY6ra4WDU8ZlM&index=23&ab_channel=Hung-YingTai