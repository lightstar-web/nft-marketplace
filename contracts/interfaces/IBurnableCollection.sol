pragma ever-solidity >= 0.61.2;

interface IBurnableCollection {

    function acceptNftBurn(
        uint256 _id,
        address _owner,
        address _manager,
        address _sendGasTo,
        address _callbackTo,
        TvmCell _callbackPayload
    ) external;

}
