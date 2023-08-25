# Prerequisites

To follow this course, installing recent versions of Zeek and Spicy is
required, see e.g., the different Zeek installation methods in the [Zeek
documentation](https://docs.zeek.org/en/master/install.html).

In addition we require:

- a text editor to write Spicy code
- a C++ compiler to compile Spicy code and Zeek plugins
- CMake for developing Zeek plugins with Spicy
- development headers for `libpcap` to compile Zeek plugins

## Zeek playground

A simplified approach for experimentation is to use the [Zeek playground
repository](https://github.com/bbannier/zeek-playground) which offers an
environment integrated with [Visual Studio
Code](https://code.visualstudio.com). Either clone to project and open it in
Visual Studio Code and install the recommended plugins, or open it directly in
a Github Codespace.

To install Spicy development dependencies execute the following commands:

```console
apt-get update
apt-get install -y g++ cmake libpcap-dev
```
