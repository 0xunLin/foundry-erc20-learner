// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

// First we try the manual implementation of an ERC20(fungible) token contract

// contract ManualToken {
//     mapping(address => uint256) private s_balances;

//     function name() public pure returns (string memory) {
//         return "Manual Token";
//     }
//     // Our name function could also be represented by a public declaration such as:
//     // string public name = "ManualToken";
//     // This is because Solidity creates public getter functions when compiled for any publicly accessible storage variables!

//     function totalSupply() public pure returns (uint256) {
//         return 100 ether; // 100000000000000000000
//     }

//     function decimals() public pure returns (uint8) {
//         return 18;
//     }

//     function balanceOf(address _owner) public view returns (uint256) {
//         return s_balances[_owner];
//     }

//     function transfer(address _to, uint256 _amount) public {
//         require(s_balances[msg.sender] >= _amount, "Not enough balance");

//         uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
//         s_balances[msg.sender] -= _amount;
//         s_balances[_to] += _amount;

//         require(balanceOf(msg.sender) + balanceOf(_to) == previousBalance);
//     }
// }

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }

    // The constructor is called only once when the contract is deployed.
    // It initializes the token with a name and symbol, and mints the initial supply to the address that deploys the contract.
    // The _mint function is provided by the ERC20 contract from OpenZeppelin, which handles the internal state updates and emits the Transfer event.
    // The initialSupply is expected to be in the smallest unit (wei for ether), so if you want to mint 100 tokens with 18 decimals, you would pass:
    // 100 * 10**18 as the initialSupply when deploying the contract.

    // For the purposes of simple examples like this, we can mint the initialSupply to the deployer/msg.sender, which is demonstrated above.

}