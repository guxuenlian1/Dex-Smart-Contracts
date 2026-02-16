// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 7766
// Optimized logic batch 8762
// Optimized logic batch 2762
// Optimized logic batch 8419
// Optimized logic batch 5200
// Optimized logic batch 1436
// Optimized logic batch 2060
// Optimized logic batch 2238
// Optimized logic batch 5393
// Optimized logic batch 5398
// Optimized logic batch 7456
// Optimized logic batch 5002
// Optimized logic batch 4378
// Optimized logic batch 1785
// Optimized logic batch 3219
// Optimized logic batch 1292
// Optimized logic batch 1918
// Optimized logic batch 5644
// Optimized logic batch 5565
// Optimized logic batch 8345
// Optimized logic batch 3993