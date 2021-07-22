pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./UsdOracle.sol";

contract UsdOracleTest is DSTest {
    UsdOracle oracle;

    function setUp() public {
        oracle = new UsdOracle();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
