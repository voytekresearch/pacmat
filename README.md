# pacmat

[![Project Status: Inactive – The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive)

A MATLAB library for calculating phase-amplitude coupling.

This is a wrapper for a python module that can be found at, https://github.com/voytekresearch/pacpy

MATLAB version 2014b or later is required.

## Install : MATLAB

## Install : Python

[Anaconda](https://store.continuum.io/cshop/anaconda/) or another version of python with scientific packages should be installed.

Then, pacpy must be installed.  To install:

	pip install pacpy

Users must also install the statsmodels package (pip install statsmodels).

## Usage

An example of calculating PAC from two simulated voltage signals using the phase-locking value (PLV) method:

		>> t = 0:.001:10; % Define time array
		>> lo = sin(t * 2 * pi * 6); % Create low frequency carrier
		>> hi = sin(t * 2 * pi * 100); % Create modulated oscillation
		>> hi(angle(hilbert(lo)) > -pi*.5) = 0; % Clip to 1/4 of cycle
		>> pac_plv(lo, hi, [4,8], [80,150], 1000) % Calculate PAC
		ans =
			0.9981
