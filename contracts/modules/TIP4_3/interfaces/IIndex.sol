pragma ever-solidity >= 0.61.2;

interface IIndex {
    
    function getInfo() external view responsible returns (
        address collection,
        address owner,
        address nft
    );
    
    function destruct(address gasReceiver) external;

}