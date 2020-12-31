# Language-specific tools

## Installation

- Rust

`$ <packages/rustup.txt xargs -I {} rustup component add {}`

`$ <packages/cargo.txt xargs -I {} cargo install {}`

- Python

`$ PIP_REQUIRE_VIRTUALENV="" pip install -r packages/pip.txt`

`$ <packages/pipx.txt pipx install {}`

- Golang

`go generate packages/get.go`