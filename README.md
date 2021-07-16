# MNE-NIRS Docker Container with Jupyterlab

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/rob-luke/mne-nirs-docker/HEAD)
[![Tests](https://github.com/rob-luke/mne-nirs-docker/actions/workflows/main.yml/badge.svg)](https://github.com/rob-luke/mne-nirs-docker/actions/workflows/main.yml)
[![Release](https://github.com/rob-luke/mne-nirs-docker/actions/workflows/release.yml/badge.svg)](https://github.com/rob-luke/mne-nirs-docker/actions/workflows/release.yml)

This provides a [docker](https://docs.docker.com/get-docker/) container for running [MNE-Python](https://mne.tools/stable/index.html) and [MNE-NIRS](https://mne.tools/mne-nirs/master/index.html) with full 3d visualisation capabilities.
It is also used as the basis for a [binder](https://mybinder.org/) image. Binder allows you to run notebooks in the cloud with no local installation.

## Usage

To start a jupyter lab server with the latest image and allow access from any IP address use:

```bash
docker run -p 8888:8888 ghcr.io/rob-luke/mne-nirs/image:latest jupyter-lab --ip="*"
```

To pull the latest image use:

```bash
docker pull ghcr.io/rob-luke/mne-nirs/image:latest
```

If you wish to mount a local directory on a \*nix or mac:

```bash
docker run -p 8888:8888 -v `pwd`:/home/mne_user ghcr.io/rob-luke/mne-nirs/image jupyter-lab --ip="*"
```

Or on windows:
```bash
docker run -p 8888:8888 -v %cd%:/home/mne_user ghcr.io/rob-luke/mne-nirs/image jupyter-lab --ip="*"
```


## Versions

Tags will be built according to the versioning of MNE-NIRS.
For example, to use MNE-NIRS version v0.0.6 run:

```bash
docker run -p 8888:8888 ghcr.io/rob-luke/mne-nirs/image:v0.0.6 jupyter-lab --ip="*"
```


## Roadmap

Once MNE-Docker is working robustly I will refactor this to build from that container base.
