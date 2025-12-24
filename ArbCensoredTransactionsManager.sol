// Copyright 2025, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/**
 * @title Enables ability to censor transactions by authorized callers.
 * @notice Authorized callers are added/removed through ArbOwner precompile.
 *         Available in ArbOS version 60 and above
 */
interface ArbCensoredTransactionsManager {
    /// @notice Marks the given transaction hash as censored
    /// @param txHash The transaction hash to censor
    function addCensoredTransaction(
        bytes32 txHash
    ) external;

    /// @notice Removes censorship mark for the given transaction hash
    /// @param txHash The transaction hash to uncensor
    function deleteCensoredTransaction(
        bytes32 txHash
    ) external;

    /// @notice Checks whether the given transaction hash is censored
    /// @param txHash The transaction hash to check
    /// @return True if censored, false otherwise
    function isTransactionCensored(
        bytes32 txHash
    ) external view returns (bool);
}
