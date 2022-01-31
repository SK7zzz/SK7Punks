// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";


contract SK7Punks is ERC721, ERC721Enumerable, PaymentSplitter {
    using Counters for Counters.Counter;

    Counters.Counter private _idCounter;
    uint public maxSupply;

    constructor(address[] memory _payees, uint256[] memory _shares, uint256 _maxSupply) ERC721("SK7Punks", "SK7") PaymentSplitter(_payees, _shares) payable{
        maxSupply = _maxSupply;
    }

    function mint() public payable {
        uint current = _idCounter.current();
        require(msg.value >= 50000000000000000, "You need 0.05 ETH to mint SK7Punks, A PAGAAAAAR");
        require(current < maxSupply, "No calipos left, only masibon");

        _safeMint(msg.sender, current);
        _idCounter.increment();
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}