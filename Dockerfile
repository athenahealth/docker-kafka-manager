FROM java:jdk-alpine

MAINTAINER Stas Alekseev

ENV SBT_VERSION 0.13.8
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin
ENV \
  KM_CHECKOUT=eeeca0e305b56f54e1d9659ce6139a2df510eaf4 \
  KM_VERSION=1.3.1.6

RUN apk add --update curl git bash unzip && \
  curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
  git clone https://github.com/yahoo/kafka-manager.git /tmp/kafka-manager && \
  cd /tmp/kafka-manager && \
  git checkout ${KM_CHECKOUT} && \
  sbt clean dist && \
  unzip -d / target/universal/kafka-manager-${KM_VERSION}.zip && \
  mv /kafka-manager-${KM_VERSION} /kafka-manager && \
  sed -i -e 's@<appender-ref ref="ASYNCFILE" />@@g' /kafka-manager/conflogback.xml && \
  apk del expat pcre git curl unzip && \
  rm -rf /var/cache/apk/* /root/.m2 /root/.sbt /root/.ivy2 /tmp/* /usr/local/sbt

EXPOSE 9000

WORKDIR /kafka-manager

COPY start.sh /kafka-manager/start.sh

CMD ["./start.sh"]
