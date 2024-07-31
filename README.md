# Nixvim Issue #1946 MRE

This config is built on an aarch64-linux system, cross-targeting an x86_64-linux system

The following command is used to build the configuration:

```sh
nixos-rebuild --target-host katie@<HOST> build --use-remote-sudo --flake .#default
```
