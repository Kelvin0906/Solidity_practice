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
    // function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
    // function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
    // Approve
    function approve(address to, uint256 tokenId) external;
    function setApprovalForAll(address operator, bool _approved) external;
    function getApproved(uint tokenId) external view returns(address operator);
    function isApprovedForAll(address owner,address operator) external view returns(bool); 
    }

contract ERC721 is IERC721{

    mapping(address => uint256) _balances;
    mapping(uint256 => address) _owners;
    mapping(uint256 => address) _tokenApprovals;
    mapping(address => mapping(address => bool)) _operatorApprovals;

    function balanceOf(address owner) public  view returns (uint256){
        require(owner != address(0),"ERROR: Address(0) can't be owner.");
        return _balances[owner];
    }
    function ownerof(uint256 tokenId) public view returns (address){
        address owner = _owners[tokenId];
        require(owner != address(0),"ERROR: Owner can't be address(0)");
        return owner;
    }

    function approve(address to, uint256 tokenId) public {
        address owner = _owners[tokenId];
        require(owner != to,"ERROR: Target can't be owner.");
        require(owner == msg.sender || isApprovedForAll(owner, msg.sender));    // Sender has been approved by NFT owner.
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }
    function getApproved(uint tokenId) public view returns(address operator){
        require(_tokenApprovals[tokenId] != address(0),"ERROR:The token has either been burn or has not been minted.");
        return _tokenApprovals[tokenId];
    }
    function setApprovalForAll(address operator, bool _approved) public{ 
        require(msg.sender != operator, "ERROR: Operator can't be yourself.");
        _operatorApprovals[msg.sender][operator] = _approved;
        emit ApprovalForAll(msg.sender, operator, _approved);
    }

    function isApprovedForAll(address owner,address operator) public view returns(bool){
        return _operatorApprovals[owner][operator];
    }
    function transferFrom(address from, address to, uint256 tokenId) public{
        require(_owners[tokenId]==from, "ERROR: From isn't own this tokenId.");
        require(msg.sender == _owners[tokenId] || msg.sender == _tokenApprovals[tokenId] || isApprovedForAll(_owners[tokenId],msg.sender) ,"ERROR: You don't have the authority to do this.");
        emit Transfer(from, to, tokenId);
        _owners[tokenId] = to;
        delete _tokenApprovals[tokenId];
        _balances[from] -= 1;
        _balances[to] += 1;
    }


}