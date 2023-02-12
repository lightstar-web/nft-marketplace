pragma ever-solidity >= 0.61.2;

interface ICallbackParamsStructure {

    struct CallbackParams {
        uint128 value;      // ever value will send to address
        TvmCell payload;    // custom payload will proxying to address
    }
}
