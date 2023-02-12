pragma ever-solidity >= 0.61.2;

interface INftTransfer {
    /// @notice change owner callback processing
    /// @param id Unique NFT id
    /// @param oldOwner Address of NFT owner before transfer
    /// @param newOwner Address of new NFT owner
    /// @param oldManager Address of NFT manager before transfer
    /// @param newManager Address of new NFT manager
    /// @param collection Address of collection smart contract that mint the NFT
    /// @param gasReceiver Address to send remaining gas
    /// @param payload Custom payload
    function onNftTransfer(
        uint256 id,
        address oldOwner,
        address newOwner,
        address oldManager,
        address newManager,
        address collection,
        address gasReceiver,
        TvmCell payload
    ) external;
}
