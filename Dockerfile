FROM ghcr.io/mne-tools/mne-python-plot:latest

ARG mne_nirs_v=main
ARG mne_v=main
ARG nilearn_v=main

USER root 

RUN pip install https://github.com/mne-tools/mne-python/archive/${mne_v}.zip
RUN pip install https://github.com/nilearn/nilearn/archive/${nilearn_v}.zip
RUN pip install https://github.com/mne-tools/mne-nirs/archive/${mne_nirs_v}.zip
RUN pip install https://codeload.github.com/rob-luke/mne-bids/zip/nirs
RUN pip install statsmodels lets-plot dabest

# Copy examples across
COPY examples /home/mne_user/examples
RUN chmod -R 777 /home/mne_user/examples
RUN chown ${MNE_USER} /home/mne_user/examples

USER $MNE_USER
WORKDIR $HOME_DIR

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
