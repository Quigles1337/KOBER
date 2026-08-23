#!/usr/bin/env bash
# KOBER local gate (E9): the default branch must pass this clean.
# CI stand-in until a remote exists (ADR-0002). Run from anywhere.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo "== lake build (lean/) =="
# cd so the elan shim resolves the toolchain from lean/lean-toolchain (E7: the pin,
# never a machine default — CI has no default and fails loudly otherwise).
( cd "$ROOT/lean" && lean --version && lake build )
echo "== cargo test =="
cargo test --manifest-path "$ROOT/Cargo.toml" --workspace
echo "== cargo clippy (deny warnings) =="
cargo clippy --manifest-path "$ROOT/Cargo.toml" --workspace --all-targets -- -D warnings
echo "ALL GREEN"
