# Cube Physics Engine (CPE)

[![CPE build](https://github.com/nuttyinc578/CPE-OPEN-source/actions/workflows/build.yml/badge.svg)](https://github.com/nuttyinc578/CPE-OPEN-source/actions/workflows/build.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

CPE is the open-source physics and particle engine used by The Cube Beta. Python, Pymunk, and Pygame provide the simulation and rendering. A Node.js bridge accepts typed commands, a Go service caches the latest state, Java can submit commands, and .NET Aspire can launch the complete stack.

The Integrated Particle Engine (IPE) is included in CPE.

## Download the latest Windows build

After the first successful `main` build, this permanent nightly.link URL downloads the newest `CPE-Windows` artifact:

(https://github.com/nuttyinc578/CPE-OPEN-source/releases)

The repository must remain public for anonymous nightly.link downloads. The optional nightly.link GitHub App only gives the repository its own API allowance; it is not required to upload artifacts.

## Run from source

Requirements: Python 3.10 or newer, Pygame, and Pymunk.

```powershell
py -3.10 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
python CPE.py --offline
```

Controls:

- Left click: create a random shape
- `B`: particle burst
- `C`: clear the scene
- `P`: pause or resume
- `Esc`: exit

Run the headless engine for five seconds:

```powershell
python CPE.py --offline --headless --duration 5
```

## Run the complete CPE stack

Install Python 3.10+, Node.js, Go, Java 21+, and the .NET 8 SDK, then run:

```powershell
.\Run CPE Aspire.cmd
```

Aspire launches:

- Node.js command bridge: `http://127.0.0.1:4310`
- Go state cache: `http://127.0.0.1:4311`
- Python CPE/IPE engine

Send a Java command after the stack starts:

```powershell
.\Run CPE Java Client.cmd spawn
```

## Architecture

```text
Java or JSON client
        |
        v
Node bridge :4310
        |
        v
bounded numeric CPE/1 commands
        |
        v
Python + Pymunk + Pygame + IPE
        |
        v
Go state cache :4311
```

CPE converts supported commands into a bounded numeric protocol. It does not execute or transpile arbitrary Java, JavaScript, or Python source code. See [the protocol reference](docs/PROTOCOL.md).

## Development checks

```powershell
python -m unittest discover -s cpe\tests -v
node --test cpe\node-bridge\test\server.test.js
go test ./...
dotnet build cpe\CPE.AppHost\CPE.AppHost.csproj -c Release
```

Run the Go command from `cpe\go-cache`.

## License

CPE source code is released under the [MIT License](LICENSE). Third-party packages keep their own licenses; see [third-party notices](THIRD_PARTY_NOTICES.md).

## special thanks
@codex
