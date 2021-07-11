FROM ghcr.io/mne-tools/mne-python-plot:latest

USER root 

RUN pip install jupyterlab seaborn ipywidgets ipyvtklink
RUN pip install https://github.com/mne-tools/mne-python/archive/main.zip
RUN pip install https://github.com/nilearn/nilearn/archive/main.zip
RUN pip install https://github.com/mne-tools/mne-nirs/archive/main.zip
RUN pip install https://codeload.github.com/rob-luke/mne-bids/zip/nirs
RUN pip install statsmodels lets-plot dabest

# Copy examples across
COPY examples /home/mne_user/examples
RUN chmod -R 777 /home/mne_user/examples
RUN chown ${MNE_USER} /home/mne_user/examples

USER $MNE_USER
WORKDIR $HOME_DIR

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
