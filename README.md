# CMOS inverter: schematic to post-layout verification

<!-- Attribution mark ◇ INVERTER-dfc6918a86b640769fed8c8d60504693 -->

**Practice project completed — 14 November 2026.**

I designed a GPDK045 CMOS inverter in Virtuoso, verified its layout with Pegasus, extracted its parasitics with Quantus, and compared schematic and post-layout behavior in Spectre.

[Post-layout results](docs/post_layout_results.md) · [Run the final simulations](simulation/post_layout/README.md)

## Final schematic versus extracted comparison

| Measurement | Schematic | Extracted |
|---|---:|---:|
| Switching voltage (V) | 0.495219 | 0.495220 |
| Low noise margin (V) | 0.4195 | 0.4195 |
| High noise margin (V) | 0.4290 | 0.4290 |
| High-to-low delay (ps) | 29.27 | 31.69 |
| Low-to-high delay (ps) | 33.98 | 37.19 |
| Average propagation delay (ps) | 31.62 | 34.44 |
| Output rise time (10–90%) (ps) | 37.53 | 43.25 |
| Output fall time (90–10%) (ps) | 28.19 | 32.30 |
| Average supply power (µW) | 0.599 | 0.692 |

At 1 V, 25 °C and a 1 fF load, average delay increased by **8.90%** after extraction. Both final simulations completed with zero errors and zero warnings.

![Post-layout transient comparison](assets/post_layout_transient.svg)

Quantus generated 11 resistors and 12 capacitors and successfully created the extracted view. See the comparison notes for measurement conditions, convergence and device-property handling.


[Request report access](docs/report_access.md) · [Simulation settings](simulation/ade_settings.md) · [Verification record](docs/verification_scope.md)

![Inverter layout in Cadence Virtuoso](assets/layout.png)

## Full report

The original full report is kept in a private archive. The new post-layout completion results are documented in the public comparison linked above. [Request a copy](docs/report_access.md); the owner reviews each request before sharing the report.

## Results

| Check or measurement | Recorded result |
|---|---|
| DRC | 562 selected checks completed with 0 violations |
| LVS | MATCH for 1 PMOS, 1 NMOS and all 4 pins |
| LVS parameters | 0 mismatches and 0 blackboxed cells |
| Contact soft checks | 0 findings for psubstrate, nwell_conn and Nburied |
| DC sweep | 101 samples from 0 to 1 V at VDD = 1 V and 27 °C |
| Estimated switching point | About 0.495 V, using the Vin = Vout crossing |

The physical verification results refer to the exported `invertor_core` GDS. DRC and LVS were recorded on 8 November 2026. The schematic DC run was recorded on 2 November 2026.

## Inverter circuit

The core cell is `perf/invertor_core`. It contains one PMOS and one NMOS, each with W = 120 nm and L = 45 nm. Both gates connect to Vin, and both drains join at Vout. The PMOS source and body connect to VDD. The NMOS source and body connect to VSS.

![Inverter core schematic](assets/schematic.png)

## Testbench and DC simulation

I used the separate `perf/invertor` testbench for the DC sweep. It contains the same transistor models and dimensions as the core, with V1 supplying VDD and V0 setting Vin.

![Inverter testbench with the two DC sources](assets/normal_testbench.png)

| ADE Explorer setting | Value |
|---|---|
| Supply variable Vdd | 1 V |
| Input variable Vin | Swept from 0 to 1 V |
| Input step | 0.01 V |
| Temperature | 27 °C |
| Output | Vout against Vin |
| Model file | models/spectre/gpdk045.scs under the PDK root |
| Model section used in the recorded DC run | mc |

![DC transfer characteristic in Cadence ViVA](assets/dc_transfer.png)

The output is close to 1 V for a low input and close to 0 V for a high input. I estimated the switching point at about 0.495 V by interpolating between the recorded samples. The measurements are in [simulation/dc_transfer.csv](simulation/dc_transfer.csv).

## Layout and verification

I placed the PMOS above the NMOS, joined the gates for Vin, and routed the drains to Vout. Metal1 carries the main connections. The N-well contact connects the PMOS body to VDD, and the substrate contact connects the NMOS body to VSS.

DRC helped me work through width, spacing and enclosure errors. LVS then checked the devices and connections in the exported layout against the reference schematic. The final comparison reported MATCH.

The [verification record](docs/verification_scope.md) describes the recorded runs. Concise report excerpts and the original report hashes are included in `reports/`.

## Project files

- `docs/` contains the verification record and report access instructions.
- `assets/` contains four actual Virtuoso and ViVA screenshots plus supplementary SVG plots generated from simulation data.
- `netlists/` contains the inverter core CDL, schematic baseline and extracted SPICE subcircuit.
- `simulation/` contains the original DC data and ADE settings, plus final comparison decks, CSV data and manual commands.
- `reports/` contains verification summaries, structured results and source hashes.

The PDK models and rule decks are supplied through the local Cadence and GPDK045 installation. The original GDS and full run logs are kept in the local project archive.

## What I learned

This project helped me understand how schematic connections become physical routes. I practised gate access, supply routing and body contacts, then used the DRC markers and LVS report to check my work. The DC curve tied the device connections back to the inverter's voltage response.

## Project closeout

The planned practice flow is complete: schematic and symbol, custom layout, recorded DRC/LVS, RC extraction, and matched schematic/post-layout DC and transient characterization. Further sizing, PVT or load sweeps are possible extensions. This is a cell-level learning project, not a manufactured chip or fabrication signoff.
