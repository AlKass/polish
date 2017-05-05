[![Build Status](https://travis-ci.org/AlKass/polish.svg?branch=master)](https://travis-ci.org/AlKass/polish)
[![Crates Package Status](https://img.shields.io/crates/v/polish.svg)](https://crates.io/crates/polish)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/AlKass/polish/blob/master/License.md)

<div align="center">
  <img src="logo.png" />
</div>

# Polish
`Polish` is a test frammework designed to allow the construction of test-driven development processes written in `Rust`.

## Getting Started

### Installing the Package
The `crates.io` package is kept up-to-date with all the major changes which means you can use it by simply including the following in your `Cargo.toml` under your `dependencies` section:

```yaml
polish = "*"
```

But if you'd like to use nightly (most recent) releases, you can include the `GitHub` package repo instead:

```yaml
polish = { git = "https://github.com/alkass/polish", branch = "master" }
```

### Writing Test Cases
The simplest test case can take the following form:

```rust
extern crate polish;

use polish::test_case::{TestRunner, TestCaseStatus, TestCase};
use polish::logger::Logger;

fn my_test_case(logger: &mut Logger) -> TestCaseStatus {
    // TODO: Your test case code goes here
    TestCaseStatus::PASSED
}

fn main() {
    let test_case = TestCase::new("Test Case Title", "Test Case Criteria", Box::new(my_test_case));
    TestRunner::new(0).run_test(test_case);
}
```

## Author
[Fadi Hanna Al-Kass](https://github.com/alkass)
