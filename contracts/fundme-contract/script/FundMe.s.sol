// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import "../src/FundMe.sol";

contract FundMeScript is Script {
    FundMe public fm;

    function setUp() public {}

    function run() public {
        console.log(
            "Starting Fund Me deployment to Base Testnet..."
        );
        console.log("");
        // Load deployer's private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);

        console.log("Deployment Details:");
        console.log("Deployer address:", deployer);

        // Check balance
        uint256 balance = deployer.balance;
        console.log("Deployer balance:", balance / 1e18, "ETH");

        if (balance < 0.01 ether) {
            console.log(
                "Warning: Low balance. Make sure you have enough ETH for deployment."
            );
        }

        // Get network info
        console.log("Network: Base Testnet");
        console.log("Chain ID: 84532");
        console.log("RPC URL: https://sepolia.base.org");
        console.log("");

        vm.startBroadcast(deployerPrivateKey);
        console.log("Deploying FundMe contract...");
        fm = new FundMe();

        vm.stopBroadcast();

        console.log(" Fund Me deployed at:", address(fm));
        console.log("Deployer:", deployer);
    }
}