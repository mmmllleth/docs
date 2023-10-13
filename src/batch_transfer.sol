// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);

    // don't need to define other functions, only using `transfer()` in this case
}

contract BAT {
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable{}

    function batch_transfer(
        address _token,
        address[] memory to,
        uint256 amount
    ) public onlyOwner {
        IERC20 token = IERC20(_token);
        for (uint256 i = 0; i < to.length; i++) {
            require(token.transfer(to[i], amount), "aa");
        }
    }

    function batch_transfer2(
        address _token,
        address[] memory to,
        uint256[] memory amount
    ) public onlyOwner {
        IERC20 token = IERC20(_token);
        for (uint256 i = 0; i < to.length; i++) {
            require(token.transfer(to[i], amount[i]), "aa");
        }
    }
}
