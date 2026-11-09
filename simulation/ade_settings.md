# Normal inverter simulation settings

I used `perf/invertor/schematic` for the DC test. It contains PM0, NM0, supply source V1 and input source V0. The separate `perf/invertor_core` cell was used for layout and LVS.

| Field | Recorded value |
|---|---|
| Simulator | Spectre 25.1.0.367.isr9 |
| Analysis | DC |
| V1 source type | vdc |
| V1 DC voltage property | Vdd |
| Vdd design variable | 1 V |
| V0 source type | vdc |
| V0 DC voltage property | Vin |
| Vin initial design variable | 0 V |
| Swept design variable | Vin |
| Sweep start / stop / step | 0 V / 1 V / 0.01 V |
| Temperature | 27 °C |
| Model file | models/spectre/gpdk045.scs, under the PDK root |
| Model section in saved netlist | mc |
| Output to plot | Vout against Vin |
| W / L, both devices | 120 nm / 45 nm |
| Number of samples | 101 |
| Netlist save settings | save Vout; save=allpub |
| Spectre tolerances | reltol=1e-3, vabstol=1e-6 V, iabstol=1e-12 A |

The archived result is a single DC sweep using the model section named `mc`.

To set this up in ADE Explorer, assign `Vdd` to the DC property of V1 and `Vin` to the DC property of V0. Add both design variables. Choose DC analysis, sweep the design variable Vin from 0 to 1 with a linear step of 0.01, set 27 °C, select Vout for plotting and run.

The CSV contains the recorded DC measurements. The Spectre template includes the transistor parameters and DC settings used for this circuit.

To use `invertor_dc_template.scs` directly, replace the `{{MODEL_FILE}}` placeholder in its include statement with the absolute path to your installed `models/spectre/gpdk045.scs` file. The model file must be supplied from your own PDK installation.
