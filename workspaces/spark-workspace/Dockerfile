# https://github.com/bitnami/containers/blob/main/bitnami/spark/3.3/debian-11/Dockerfile
FROM bitnami/spark:3.3-debian-11 as spark_image
FROM alnoda/notebook-workspace:3.0 as run_image

COPY --from=spark_image --chown=abc /opt/bitnami/spark /home/abc/spark

ENV SPARK_HOME=/home/abc/spark \
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
ENV PATH="$PATH:/home/abc/spark/bin"

RUN echo "------------------------------------------------------ java" \
    && sudo apt-get -y update \
    && sudo apt-get install -y openjdk-17-jre \
    && sudo apt-get install -y openjdk-17-jdk \
    && echo "------------------------------------------------------ toree" \
    && pip install --upgrade toree==0.5.0 \
    && jupyter toree install --interpreters=Scala --spark_home=$SPARK_HOME \
    && echo "------------------------------------------------------ pyspark kernel" \
    && pip install pyspark-kernel==0.3.0 \
    && echo "------------------------------------------------------ spark monitor" \
    && pip install sparkmonitor==2.1.1 \
    && echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >>  $(ipython profile locate default)/ipython_kernel_config.py \
    && jupyter nbextension install sparkmonitor --py \
    && jupyter nbextension enable sparkmonitor --py
