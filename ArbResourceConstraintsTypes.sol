// Copyright 2025, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title ArbResourceConstraintsTypes
/// @notice Resource constraints type definitions used by ArbOwner and ArbOwnerPublic precompiles.
library ArbResourceConstraintsTypes {
    /// @notice Enumerates the distinct resource kinds used for multi-dimensional gas accounting.
    /// @dev The numeric values of this enum must remain consistent with the corresponding
    /// @dev The values defined here must stay synchronized with `go-ethereum/arbitrum/multigas/resources.go`.
    enum ResourceKind {
        Unknown,
        Computation,
        HistoryGrowth,
        StorageAccess,
        StorageGrowth,
        L1Calldata,
        L2Calldata,
        WasmComputation
    }

    /// @notice A pair representing a resource kind and its weight in constraint calculations.
    struct ResourceWeight {
        ResourceKind resource;
        uint64 weight;
    }

    /// @notice A constraint describing limits for a set of weighted resources.
    struct ResourceConstraint {
        ResourceWeight[] resources;
        uint32 periodSecs;
        uint64 targetPerSec;
    }
}
