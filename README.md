# 8-bit Successecive Approximation Register

Workflow : 
1. Design a simple Successive approximation register in VHDL.
2. Import the code in Cadence and generate a symbol.
3. Design a schematic for an 8 bit SAR ADC.
4. Simulate the circuit with a sine wave as input signal.
5. Export values for about 100m time period as a CSV file.
6. Import the file to matlab, plot the waveform.
7. Get a FFT of the input data.
8. Apply hanning window to reduce ripples.


## Schematic for 8-bit ADC

![8bit ADC Schematic](https://i.imgur.com/K64V61z.png)


## State model for SAR

![State model for SAR](https://i.imgur.com/QzWsTqU.jpg)

## Outputs

#### 1. Cadence Simulation of the ADC

![Cadence simulation output](https://i.imgur.com/SH37Vbe.png)

#### 2. FFT with Windowing

![FFT with windowing](https://i.imgur.com/GNRcMQK.png)
