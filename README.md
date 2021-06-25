# MNE-NIRS Docker Container with Jupyterlab

This provides a [docker](https://docs.docker.com/get-docker/) container for running [MNE-Python](https://mne.tools/stable/index.html) and [MNE-NIRS](https://mne.tools/mne-nirs/master/index.html) with full 3d visualisation capabilities.

## Usage

To start a jupyter lab server with the latest image and allow access to any IP address use:

```bash
docker run ghcr.io/rob-luke/mne-nirs/image:latest jupyter-lab --ip 0.0.0.0
```

To pull the latest image use:

```bash
docker pull ghcr.io/rob-luke/mne-nirs/image:latest
```

## Versions

Tags will be built according to the versioning of MNE-NIRS.


## Roadmap

Once MNE-Docker is working robustly I will refactor this to build from that container base.
