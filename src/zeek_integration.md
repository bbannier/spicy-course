# Zeek integration

[Zeek](https://zeek.org/) supports writing packet, protocol or file analyzers
with Spicy. In addition to allowing inclusion of unmodified Spicy grammars among
other the following is provided:

- [automatic
  generation](https://docs.zeek.org/en/master/devel/spicy/reference.html#interface-definitions-evt-files)
  of Zeek analyzers from Spicy parsers
- ability to trigger [Zeek
  events](https://docs.zeek.org/en/master/scripting/basics.html) from
  [Spicy](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#unit-hooks)
  [unit
  hooks](https://docs.zeek.org/en/master/devel/spicy/reference.html#event-definitions),
- (automatic) [exporting of
  types](https://docs.zeek.org/en/master/devel/spicy/reference.html#exporting-types)
  defined in Spicy as [Zeek record
  types](https://docs.zeek.org/en/master/scripting/basics.html#record-data-type),
- [a Spicy module to control Zeek](https://docs.zeek.org/en/master/devel/spicy/reference.html#controlling-zeek-from-spicy) from Spicy code.

## Getting started

The recommended approach to integrate a Spicy parser with Zeek is to use the
[default Zeek package manager template](https://github.com/zeek/package-template/).

We can create Zeek packet, protocol or file analyzers by selecting the appropriate template feature, e.g., to create a new Zeek package for a protocol analyzer,

```console
zkg create --packagedir my_analyzer --features spicy-protocol-analyzer
```

```admonish info
`zkg` uses Git to track package information. When running in a VM, this can
cause issues if the package is in a mounted directory. If you run into this
trying creating the package in directory which is not mounted from the host.
```

Use `zkg template info` to show the available features.

```console
$ zkg template info
API version: 1.0.0
features: github-ci, license, plugin, spicy-file-analyzer, spicy-packet-analyzer, spicy-protocol-analyzer
origin: https://github.com/zeek/package-template
provides package: true
user vars:
    name: the name of the package, e.g. "FooBar" or "spicy-http", no default, used by package, spicy-protocol-analyzer, spicy-file-analyzer, spicy-packet-analyzer
    namespace: a namespace for the package, e.g. "MyOrg", no default, used by plugin
    analyzer: name of the Spicy analyzer, which typically corresponds to the protocol/format being parsed (e.g. "HTTP", "PNG"), no default, used by spicy-protocol-analyzer, spicy-file-analyzer, spicy-packet-analyzer
    protocol: transport protocol for the analyzer to use: TCP or UDP, no default, used by spicy-protocol-analyzer
    unit: name of the top-level Spicy parsing unit for the file/packet format (e.g. "File" or "Packet"), no default, used by spicy-file-analyzer, spicy-packet-analyzer
    unit_orig: name of the top-level Spicy parsing unit for the originator side of the connection (e.g. "Request"), no default, used by spicy-protocol-analyzer
    unit_resp: name of the top-level Spicy parsing unit for the responder side of the connection (e.g. "Reply"); may be the same as originator side, no default, used by spicy-protocol-analyzer
    author: your name and email address, Benjamin Bannier <benjamin.bannier@corelight.com>, used by license
    license: one of apache, bsd-2, bsd-3, mit, mpl-2, no default, used by license
versions: v0.99.0, v1.0.0, v2.0.0, v3.0.0, v3.0.1, v3.0.2
```
