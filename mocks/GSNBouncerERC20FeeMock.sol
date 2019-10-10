pragma solidity ^0.5.0;

import "../GSN/GSNRecipient.sol";
import "../GSN/bouncers/GSNBouncerERC20Fee.sol";

contract GSNBouncerERC20FeeMock is GSNRecipient, GSNBouncerERC20Fee {
    constructor(string memory name, string memory symbol) public GSNBouncerERC20Fee(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    event MockFunctionCalled(uint256 senderBalance);

    function mockFunction() public {
        emit MockFunctionCalled(token().balanceOf(_msgSender()));
    }
}
