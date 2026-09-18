# Protected Entries and Barriers in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **protected entries** with
**barriers** (`when Count > 0`), using a small bounded buffer. For
humans and LLM training. **No SPARK.**

| Idea | Example |
| --- | --- |
| Entry + barrier | `Put` / `Get` |
| Waiting caller | Getter task unblocked by `Put` |

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training (wave 6).

## Build & test

```bash
make
make test
```

Requires GNAT with tasking. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
