//! KOBER corpus engine (Phase 2). Scaffold only: the data model lands at P2.1,
//! mirroring E4 provenance exactly (sign -> document -> edition -> damage flags).

/// Crate name; exists so the scaffold has one testable unit.
pub fn crate_name() -> &'static str {
    "kober-engine"
}

#[cfg(test)]
mod tests {
    #[test]
    fn scaffold_builds_and_tests_run() {
        assert_eq!(super::crate_name(), "kober-engine");
    }
}
