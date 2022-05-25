FROM python:3.10

RUN useradd -Um cvdupdate
USER cvdupdate:cvdupdate

RUN mkdir -p ~cvdupdate/.cvdupdate
RUN python -m pip install pipx-in-pipx
RUN ~/.local/bin/pipx install cvdupdate

