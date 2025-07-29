// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides non-owners with info about the current chain owners.
/// @notice Precompiled contract that exists in every Arbitrum chain at 0x000000000000000000000000000000000000006b.
interface ArbOwnerPublic {
    /// @notice See if the user is a chain owner
    function isChainOwner(
        address addr
    ) external view returns (bool);

    /// @notice Rectify the list of chain owners
    /// @notice If successful, emits ChainOwnerRectified event
    /// @notice Available in ArbOS version 11 and above
    function rectifyChainOwner(
        address ownerToRectify
    ) external;

    /// @notice Retrieves the list of chain owners
    function getAllChainOwners() external view returns (address[] memory);

    /// @notice See if the user is a native token owner
    /// @notice Available in ArbOS version 41 and above
    function isNativeTokenOwner(
        address addr
    ) external view returns (bool);

    /// @notice Retrieves the list of native token owners
    /// @notice Available in ArbOS version 41 and above
    function getAllNativeTokenOwners() external view returns (address[] memory);

    /// @notice Gets the network fee collector
    function getNetworkFeeAccount() external view returns (address);

    /// @notice Get the infrastructure fee collector
    function getInfraFeeAccount() external view returns (address);

    /// @notice Get the Brotli compression level used for fast compression
    /// @notice Available in ArbOS version 20 and above
    function getBrotliCompressionLevel() external view returns (uint64);

    /// @notice Get the next scheduled ArbOS version upgrade and its activation timestamp.
    /// @notice Returns (0, 0) if no ArbOS upgrade is scheduled.
    /// @notice Available in ArbOS version 20 and above
    function getScheduledUpgrade()
        external
        view
        returns (uint64 arbosVersion, uint64 scheduledForTimestamp);

    /// @notice Checks if the increased calldata price feature (EIP-7623) is enabled
    /// @notice Available in ArbOS version 40 with default as false
    function isCalldataPriceIncreaseEnabled() external view returns (bool);

    event ChainOwnerRectified(address rectifiedOwner);
}
