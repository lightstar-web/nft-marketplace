pragma ever-solidity >= 0.61.2;
import '../errors/BaseErrors.sol';
import '../errors/OffersBaseErrors.sol';

import "../libraries/Gas.sol";
import "../abstract/BaseRoot.sol";
import "../abstract/BaseOffer.sol";
import "../interfaces/IUpgradableByRequest.sol";

abstract contract OffersUpgradableRoot is BaseRoot{

    function setCodeOffer(TvmCell _newCode) public onlyOwner reserve{
//        _reserve();
        _setOfferCode(_newCode);
        msg.sender.transfer(0, false, 128 + 2);
    }

    function _buildOfferStateInit(
        address _owner,
        address _paymentToken,
        address _nft,
        uint64 _nonce,
        address _markerRootAddress
    ) internal virtual view returns (TvmCell) {
        return tvm.buildStateInit({
                    contr: BaseOffer,
                    varInit: {
                        markerRootAddress_: _markerRootAddress,
                        owner_: _owner,
                        paymentToken_: _paymentToken,
                        nftAddress_: _nft,
                        nonce_: _nonce
                    },
                    code: _getOfferCode()
                });
    }

    function _expectedOfferAddress(
        address _owner,
        address _paymentToken,
        address _nft,
        uint64 _timeTx,
        address _markerRootAddress
    ) internal view returns (address) {
        return address(
            tvm.hash(_buildOfferStateInit(_owner, _paymentToken, _nft, _timeTx, _markerRootAddress))
        );
    }

    function requestUpgradeOffer(
        address _owner,
        address _paymentToken,
        address _nft,
        uint64 _timeTx,
        address _markerRootAddress,
        address _remainingGasTo
    ) external view onlyOwner reserve {
        require(msg.value >= Gas.UPGRADE_DIRECT_BUY_MIN_VALUE, BaseErrors.low_gas);
//        _reserve();

        IUpgradableByRequest(
            _expectedOfferAddress(_owner, _paymentToken, _nft, _timeTx, _markerRootAddress)
        ).upgrade{
            value: 0,
            flag: 128
        }(
            _getOfferCode(),
            _getCurrentVersionOffer(),
            _remainingGasTo
        );
    }

}