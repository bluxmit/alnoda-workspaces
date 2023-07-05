FROM alnoda/alnoda-workspace:1.1

RUN wrk install emacs==28

# Update Alnoda workspace UI, icons, fonts
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
