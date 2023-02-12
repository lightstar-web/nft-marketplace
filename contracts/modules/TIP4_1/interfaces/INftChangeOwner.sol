pragma ever-solidity >= 0.61.2;

interface INftChangeOwner {
    /// @notice change owner callback processing
    /// @param id Unique NFT id
    /// @param manager Address of NFT manager
    /// @param oldOwner Address of NFT owner before owner changed
    /// @param newOwner Address of new NFT owner
    /// @param collection Address of collection smart contract, that mint the NFT
    /// @param sendGasTo Address to send remaining gas
    /// @param payload Custom payload
    function onNftChangeOwner(
        uint256 id,
        address manager,
        address oldOwner,
        address newOwner,
        address collection,
        address sendGasTo,
        TvmCell payload
    ) external;
}
