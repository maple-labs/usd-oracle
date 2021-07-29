// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;
pragma experimental ABIEncoderV2;

import { DSTest } from "../../modules/ds-test/src/test.sol";
import { UsdOracle } from "../UsdOracle.sol";

contract UsdOracleTest is DSTest {

    function test_usdOracle() public {
        UsdOracle usd = new UsdOracle();

        assertEq(usd.getLatestPrice(), 1 * 10 ** 8, "Incorrect oracle price");
    }

}
