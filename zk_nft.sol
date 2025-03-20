// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZKPNFT {
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(address => bool) private _verifiedUsers;
    uint256 private _tokenIdCounter;

    function verifyUser(address user) public {
        _verifiedUsers[user] = true;
    }

    function mintVerifiedNFT() public {
        require(_verifiedUsers[msg.sender], "User not verified");

        uint256 tokenId = _tokenIdCounter;
        _owners[tokenId] = msg.sender;
        _balances[msg.sender] += 1;
        _tokenIdCounter++;
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function isVerified(address user) public view returns (bool) {
        return _verifiedUsers[user];
    }
}
