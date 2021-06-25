name: release

# https://github.com/marcellodesales/pycobertura-reports-docker/blob/main/.github/workflows/main.yaml

on:
  push:
    branches:
      - 'main'

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
    
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0

      # https://github.com/marcellodesales/cloner/packages?package_type=Docker
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build docker image
        run: DOCKER_BUILDKIT=1 docker build --progress=plain -t ghcr.io/${GITHUB_REPOSITORY}/${GITHUB_REF##*/} .
        
      - name: Tag image
        run: docker tag ghcr.io/${GITHUB_REPOSITORY}/${GITHUB_REF##*/} ghcr.io/rob-luke/mne-nirs/image

      - name: Push image to github
        run: docker push ghcr.io/rob-luke/mne-nirs/image:latest
