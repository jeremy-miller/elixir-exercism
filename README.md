[![MIT Licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jeremy-miller/exercism/blob/master/LICENSE)
[![Elixir Version](https://img.shields.io/badge/Elixir-1.4-blue.svg)]()
[![Erlang/OTP Version](https://img.shields.io/badge/Erlang%2FOTP-19.3-blue.svg)]()

# Exercism
My solutions to Elixir [Exercism](http://exercism.io/languages/elixir/exercises) problems.

## Table of Contents
- [Motivation](#motivation)
- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Build](#build)
  - [Code Formatting](#code-formatting)
  - [Dependencies](#dependencies)
  - [Elixir Static Code Analysis](#elixir-static-code-analysis)
  - [Test](#test)
- [License](#license)

## Motivation
I created this repo to get more practice with Elixir.

## Usage
This implementation uses a Docker container to isolate the execution environment.

### Prerequisites
- [Docker](https://docs.docker.com/engine/installation/)

### Build
Before interacting with the Exercism exercises, the Docker container must be built:
```docker build -t jeremymiller/exercism .```

*NOTE: This may take a long time since it creates the Persistent Lookup Table (PLT) for Dialyzer
(see [here](https://github.com/jeremyjh/dialyxir#plt) for more information).*

### Code Formatting
To run the [exfmt](https://github.com/lpil/exfmt) code formatter, execute the following command (substituting a file path):
```docker run -it --rm jeremymiller/exercism mix exfmt <path to file>```

### Dependencies
To check for outdated dependencies, execute the following command:
```docker run -it --rm jeremymiller/exercism mix hex.outdated```

### Static Code Analysis
To run the [Credo](https://github.com/rrrene/credo) static code analyzer, execute the following command:
```docker run -it --rm jeremymiller/exercism mix credo```

To run the [Dialyzer](http://erlang.org/doc/man/dialyzer.html) static code analyzer, execute the following command:
```docker run -it --rm jeremymiller/exercism mix dialyzer```

### Test
To run the Exercism tests, execute the following command:
```docker run -it --rm jeremymiller/exercism mix test```

To run the Life tests automatically on save during local development, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app/ jeremymiller/exercism mix test.watch```

## License
[MIT](https://github.com/jeremy-miller/exercism/blob/master/LICENSE)
