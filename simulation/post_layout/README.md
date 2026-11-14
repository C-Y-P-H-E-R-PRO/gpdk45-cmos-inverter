# Run the final comparison manually

Requires your installed Spectre and GPDK045 models. Run from this directory. No PDK model files are included in the repository.

```bash
cd /home/apal/Documents/Codex/github/gpdk045-cmos-inverter/simulation/post_layout
export GPDK_MODEL_FILE=/home/apal/Documents/new_PDK/gpdk045_v_6_0/models/spectre/gpdk045.scs
python3 - <<'PYCODE'
from pathlib import Path
import os
model = Path(os.environ['GPDK_MODEL_FILE'])
assert model.is_file(), model
for name in ('schematic', 'extracted'):
    source = Path(name + '.scs').read_text()
    Path(name + '.local.scs').write_text(source.replace('{{MODEL_FILE}}', str(model)))
    Path('runs', name).mkdir(parents=True, exist_ok=True)
PYCODE
/home/apal/cadence/SPECTRE25.10/bin/spectre schematic.local.scs -format psfascii -raw runs/schematic/psf +log runs/schematic/spectre.log
/home/apal/cadence/SPECTRE25.10/bin/spectre extracted.local.scs -format psfascii -raw runs/extracted/psf +log runs/extracted/spectre.log
```

Check the end of both logs:

```bash
tail -n 6 runs/schematic/spectre.log
tail -n 6 runs/extracted/spectre.log
```

Both should report `spectre completes with 0 errors, 0 warnings`. A successful command exit alone is not the measurement comparison. Plot DC `vout` versus `VIN`, and transient `vin`/`vout` versus time. Measurement definitions and verified values are in [the results](../../docs/post_layout_results.md).

The published CSV files are the complete saved samples from the final validated runs, with seconds, volts and amperes in the column units. `VSUP:p` is current entering the supply source positive terminal; delivered supply power uses the negative of this current times 1 V.
