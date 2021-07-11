FROM ghcr.io/mne-tools/mne-python-plot:latest

RUN pip install jupyterlab seaborn ipywidgets ipyvtklink
RUN pip install https://github.com/mne-tools/mne-python/archive/main.zip
RUN pip install https://github.com/nilearn/nilearn/archive/main.zip
RUN pip install https://github.com/mne-tools/mne-nirs/archive/main.zip
RUN pip install https://codeload.github.com/rob-luke/mne-bids/zip/nirs
RUN pip install statsmodels lets-plot dabest

# setup entry point
COPY prepare.sh /usr/bin/prepare.sh
RUN chmod a+x /usr/bin/prepare.sh

# Copy examples across
COPY examples /home/mne_user/examples
RUN chmod -R 777 /home/mne_user/examples

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
