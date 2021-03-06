FROM ghcr.io/mne-tools/mne-python-plot@sha256:b0555124a2f1bb09bbca660764d543e729af14300bcac9499a6fde1e9776f4f7

ARG mne_nirs_v=main
ARG nilearn_v=main

USER root 

RUN pip install statsmodels lets-plot dabest
RUN pip install https://github.com/nilearn/nilearn/archive/${nilearn_v}.zip
RUN pip install https://codeload.github.com/rob-luke/mne-bids/zip/nirs
RUN pip install https://github.com/mne-tools/mne-nirs/archive/${mne_nirs_v}.zip

# Copy examples
COPY examples /home/mne_user/examples
RUN chmod -R 777 /home/mne_user/examples
RUN chown ${MNE_USER} /home/mne_user/examples

USER $MNE_USER
WORKDIR $HOME_DIR

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
