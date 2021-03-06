FROM java:jre-alpine

MAINTAINER Mark Fioravanti <mark.fioravanti.ii@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget https://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
RUN unzip stanford-corenlp-full-2018-02-27.zip && \
	rm stanford-corenlp-full-2018-02-27.zip

WORKDIR stanford-corenlp-full-2015-12-09

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer
