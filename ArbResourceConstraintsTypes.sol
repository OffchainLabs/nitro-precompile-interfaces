// Copyright 2025, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title ArbResourceConstraintsTypes
/// @notice Resource constraints type definitions used by ArbOwner and ArbOwnerPublic precompiles.
library ArbResourceConstraintsTypes {
    /// @notice A pair representing a resource kind and its weight in constraint calculations.
    struct ResourceWeight {
        uint8 resource;
        uint64 weight;
    }

    /// @notice A constraint describing limits for a set of weighted resources.
    struct ResourceConstraint {
        ResourceWeight[] resources;
        uint32 periodSecs;
        uint64 targetPerSec;
        uint64 backlog;
    }
}
