# Verification record

## Layout used for the checks

The recorded physical checks used the exported `invertor_core` GDS and the GPDK045 rule decks in Pegasus 26.10-p012. The reference circuit contains one PMOS, one NMOS and the four pins VDD, VSS, Vin and Vout.

## Design rule check

On 8 November 2026, Pegasus completed all 562 selected DRC checks on 69 original geometries and reported zero violations. The concise result is in `reports/drc_summary.txt`.

## Layout versus schematic

The completed LVS comparison reported MATCH. The layout and schematic each contained one PMOS and one NMOS, with all four external pins matching. The report recorded zero parameter mismatches and zero blackboxed cells. See `reports/lvs_summary.txt`.

## Body contact checks

The extraction report recorded zero findings for the named contact checks psubstrate, nwell_conn and Nburied. These results are listed in `reports/lvs_extraction.txt`.

The separate standalone ERC summary records its own check counts: zero general ERC checks and zero results. This count is kept separately from the named contact soft-check results in `reports/erc_summary.txt`.

## DC simulation

The `perf/invertor` testbench uses the same transistor model names and dimensions as the core. The saved run contains 101 DC samples, with Vin swept from 0 to 1 V in 0.01 V steps at VDD = 1 V and 27 °C. Linear interpolation of the Vin = Vout crossing gives an estimated switching point of 0.495 V. Spectre completed with zero errors and zero warnings.

## Project records

`reports/provenance.json` records the filenames and SHA-256 hashes of the original verification reports. The full reports and GDS are kept in the local project archive. The screenshots show the actual saved Virtuoso views and the DC result plotted in ViVA.
