// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC20{
    constructor() ERC20("MyToken", "MTK"){
        _mint(msg.sender, 10000);
    }
}

contract MyNFT is ERC721 {
    constructor() ERC721("MyNFT", "MNFT"){
        _safeMint(msg.sender, 0);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://xxx.example.co";
    }
}