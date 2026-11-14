* Spectre-compatible copy: removed two unsupported fw parameters; W is unchanged.
*
*
*
*                       LINUX           Sat Nov 14 10:08:37 2026
*
*
*
*  PROGRAM  advgen
*
*  Name           : advgen - Quantus - (64-bit)
*  Version        : 25.1.0-p047
*  Build Date     : Thu Dec 11 23:20:30 PST 2025
*
*  HSPICE LIBRARY
*
*  OPERATING_TEMPERATURE 25
*
*
*

*
.SUBCKT invertor_core VDD VSS Vin Vout
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MNM0	Vout#2	Vin#4	VSS#3	VSS	g45n1svt	L=4.5e-08
+ W=1.2e-07
+ AD=1.68e-14	AS=1.68e-14	PD=5.2e-07	PS=5.2e-07	SA=1.4e-07
+ SB=1.4e-07
+ sca=6.94881 scb=0.00373474 scc=2.98582e-05
MPM0	Vout#3	Vin#1	VDD#1	VDD	g45p1svt	L=4.5e-08
+ W=1.2e-07
+ AD=1.68e-14	AS=1.68e-14	PD=5.2e-07	PS=5.2e-07	SA=1.4e-07
+ SB=1.4e-07
+ sca=76.226 scb=0.0762475 scc=0.0101175
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rl1	Vin#1	Vin#2	109.735382	$poly_conn
Rl2	Vin#2	Vin#3	354.447510	$poly_conn
Rl3	Vin#2	Vin#4	82.028816	$poly_conn
Rk1	Vin#3	Vin	45.003681	$metal1_conn
Rk3	VSS#2	VSS	0.144650	$metal1_conn
Rk4	VSS#2	VSS#3	75.347992	$metal1_conn
Rk5	VDD#1	VDD#2	62.312557	$metal1_conn
Rk6	VDD#2	VDD	0.195172	$metal1_conn
Rk8	Vout	Vout#1	0.645565	$metal1_conn
Rk9	Vout#1	Vout#2	75.490562	$metal1_conn
Rk10	Vout#1	Vout#3	62.108860	$metal1_conn
*
*       CAPACITOR CARDS
*
*
C1	VDD	VSS	5.28462e-17
C2	Vin	VSS	2.82614e-17
C3	Vout	VSS	4.59528e-17
C4	Vin#1	VSS	3.42665e-17
C5	Vin#4	VSS	3.19488e-17
C6	Vin#3	VSS	5.65936e-17
C7	Vout#3	VSS	2.66291e-17
C8	VDD#1	VSS	3.2896e-17
C9	Vout#2	VSS	5.77119e-17
C10	VDD#2	VSS	3.28168e-17
C11	Vout#1	VSS	5.4067e-17
C12	Vin#2	VSS	6.9504e-17
*
*
.ENDS invertor_core
*
