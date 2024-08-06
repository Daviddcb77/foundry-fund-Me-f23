//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        //Before startBroadcast -> not a real tx
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkconfig();

        vm.startBroadcast();
        //Mock
        FundMe fundMe = new FundMe(ethUsdPriceFeed); //Hemos añadido la direccion para interectuar con sepolia
        vm.stopBroadcast();
        return fundMe;
    }
}
