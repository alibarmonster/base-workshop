// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;


import {AggregatorV3Interface} from "../chainlink-local/src/data-feeds/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getPrice() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x4aDC67696bA383F43DD60A9e78F2C97Fbbfc7cb1);
    (
        ,
        int256 answer,
        ,
        ,

    ) = priceFeed.latestRoundData();

    return uint256(answer * 10000000000);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }
}